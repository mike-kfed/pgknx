"generate sql needed for btree and hash operators"
# flake8: noqa

FAMILY = """
--
-- Operator families for the various operator classes:
--
---------------------------------------------------

CREATE OPERATOR FAMILY {family_name} USING btree;
CREATE OPERATOR FAMILY {family_name} USING hash;
"""

TPL = """
--
-- Operator functions:
--
---------------------------------------------------
CREATE FUNCTION {data_type_name}_lt({data_type_name}, {r_data_type_name})
	RETURNS boolean
	AS 'int4lt'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION {data_type_name}_le({data_type_name}, {r_data_type_name})
	RETURNS boolean
	AS 'int4le'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION {data_type_name}_eq({data_type_name}, {r_data_type_name})
	RETURNS boolean
	AS 'int4eq'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION {data_type_name}_ge({data_type_name}, {r_data_type_name})
	RETURNS boolean
	AS 'int4ge'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION {data_type_name}_gt({data_type_name}, {r_data_type_name})
	RETURNS boolean
	AS 'int4gt'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION {data_type_name}_ne({data_type_name}, {r_data_type_name})
	RETURNS boolean
	AS 'int4ne'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;


--
-- Now the operators of {data_type_name}:
--
---------------------------------------------------
CREATE OPERATOR < (
	PROCEDURE = {data_type_name}_lt,
	LEFTARG = {data_type_name},
	RIGHTARG = {r_data_type_name},
	COMMUTATOR = >,
	NEGATOR = >=,
	RESTRICT = scalarltsel,
	JOIN = scalarltjoinsel);
CREATE OPERATOR <= (
	PROCEDURE = {data_type_name}_le,
	LEFTARG = {data_type_name},
	RIGHTARG = {r_data_type_name},
	COMMUTATOR = >=,
	NEGATOR = >,
	RESTRICT = scalarltsel,
	JOIN = scalarltjoinsel);
CREATE OPERATOR = (
	PROCEDURE = {data_type_name}_eq,
	LEFTARG = {data_type_name},
	RIGHTARG = {r_data_type_name},
	COMMUTATOR = =,
	NEGATOR = <>,
	RESTRICT = eqsel,
	JOIN = eqjoinsel,
	MERGES,
	HASHES);
CREATE OPERATOR >= (
	PROCEDURE = {data_type_name}_ge,
	LEFTARG = {data_type_name},
	RIGHTARG = {r_data_type_name},
	COMMUTATOR = <=,
	NEGATOR = <,
	RESTRICT = scalargtsel,
	JOIN = scalargtjoinsel );
CREATE OPERATOR > (
	PROCEDURE = {data_type_name}_gt,
	LEFTARG = {data_type_name},
	RIGHTARG = {r_data_type_name},
	COMMUTATOR = <,
	NEGATOR = <=,
	RESTRICT = scalargtsel,
	JOIN = scalargtjoinsel );
CREATE OPERATOR <> (
	PROCEDURE = {data_type_name}_ne,
	LEFTARG = {data_type_name},
	RIGHTARG = {r_data_type_name},
	COMMUTATOR = <>,
	NEGATOR = =,
	RESTRICT = neqsel,
	JOIN = neqjoinsel);
"""

OPCLASS_TPL = """
--
-- Operator classes of {data_type_name}:
--
---------------------------------------------------
CREATE FUNCTION bt_{data_type_name}_cmp({data_type_name}, {data_type_name})
	RETURNS int4
	AS 'btint4cmp'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;

CREATE OPERATOR CLASS {data_type_name}_ops DEFAULT
	FOR TYPE {data_type_name} USING btree FAMILY {family_name} AS
	OPERATOR 1  <,
	OPERATOR 2  <=,
	OPERATOR 3  =,
	OPERATOR 4  >=,
	OPERATOR 5  >,
	FUNCTION 1  bt_{data_type_name}_cmp({data_type_name}, {data_type_name});

CREATE FUNCTION hash_{data_type_name}({data_type_name})
	RETURNS int4
	AS 'hashint4'
	LANGUAGE 'internal' IMMUTABLE STRICT
	PARALLEL SAFE;

CREATE OPERATOR CLASS {data_type_name}_ops DEFAULT
	FOR TYPE {data_type_name} USING hash FAMILY {family_name} AS
	OPERATOR 1  =,
	FUNCTION 1  hash_{data_type_name}({data_type_name});
"""

def btree_others(dt_left, others):
    "generate functions and operators for mix of datatypes."
    assert others
    assert dt_left not in others
    tpl_func = """
CREATE FUNCTION bt_{dt_left}_cmp({dt_left}, {other})
	RETURNS int4
	AS 'btint4cmp'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
"""
    comment = "-- {dt_left} vs other types:\n"
    functions = ""
    other_ops = ""
    operators = []
    bt_op_funcs = []
    for other in others:
        other_ops += TPL.format(family_name=family_name, data_type_name=dt_left, r_data_type_name=other)
        functions += tpl_func.format(dt_left=dt_left, other=other)
        operators.append((dt_left, other))
        bt_op_funcs.append("\tFUNCTION 1  bt_{dt_left}_cmp({dt_left}, {other})".format(dt_left=dt_left, other=other))
    op_defs = []
    for op_num, op_code in [(1, '<'), (2, '<='), (3, '='), (4, '>='), (5, '>')]:
        for dt_left, other in operators:
            data = dict(op_num=op_num, op_code=op_code, dt_left=dt_left, other=other)
            op_defs.append("\tOPERATOR {op_num}  {op_code} ({dt_left}, {other}),".format(**data))
    hash_ops = []
    for dt_left, other in operators:
        hash_ops.append("\tOPERATOR 1  = ({dt_left}, {other})".format(dt_left=dt_left, other=other))
    return """
-- btree for {dt_left}: {others}
{other_ops}

{functions}

ALTER OPERATOR FAMILY {family_name} USING btree ADD
{operators}
{bt_op_funcs};

ALTER OPERATOR FAMILY {family_name} USING hash ADD
{hash_ops};
""".format(
        dt_left=dt_left,
        others=others,
        other_ops=other_ops,
        functions=functions,
        family_name=family_name,
        operators="\n".join(op_defs),
        bt_op_funcs=",\n".join(bt_op_funcs),
        hash_ops=",\n".join(hash_ops),
        )

family_name = 'knx_ops'
type_names = ['knx_group_address3',
              'knx_group_address2',
              'knx_individual_address']

with open('knx-operators.sql', 'w') as opf:
    opf.write(FAMILY.format(family_name=family_name))
    for type_name in type_names:
        opf.write(TPL.format(family_name=family_name, data_type_name=type_name, r_data_type_name=type_name))
        opf.write(OPCLASS_TPL.format(family_name=family_name, data_type_name=type_name))
    for dt_left in type_names:
        all_except_self = type_names[:]
        all_except_self.remove(dt_left)
        opf.write(btree_others(dt_left, all_except_self))
