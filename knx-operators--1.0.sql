--
-- Operator functions:
--
---------------------------------------------------
CREATE FUNCTION knx_ga3_lt(knx_group_address3, knx_group_address3)
	RETURNS boolean
	AS 'int4lt'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_ga3_le(knx_group_address3, knx_group_address3)
	RETURNS boolean
	AS 'int4le'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_ga3_eq(knx_group_address3, knx_group_address3)
	RETURNS boolean
	AS 'int4eq'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_ga3_ge(knx_group_address3, knx_group_address3)
	RETURNS boolean
	AS 'int4ge'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_ga3_gt(knx_group_address3, knx_group_address3)
	RETURNS boolean
	AS 'int4gt'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_ga3_ne(knx_group_address3, knx_group_address3)
	RETURNS boolean
	AS 'int4ne'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;


--
-- Now the operators:
--
---------------------------------------------------
CREATE OPERATOR < (
	PROCEDURE = knx_ga3_lt,
	LEFTARG = knx_group_address3,
	RIGHTARG = knx_group_address3,
	COMMUTATOR = >,
	NEGATOR = >=,
	RESTRICT = scalarltsel,
	JOIN = scalarltjoinsel);
CREATE OPERATOR <= (
	PROCEDURE = knx_ga3_le,
	LEFTARG = knx_group_address3,
	RIGHTARG = knx_group_address3,
	COMMUTATOR = >=,
	NEGATOR = >,
	RESTRICT = scalarltsel,
	JOIN = scalarltjoinsel);
CREATE OPERATOR = (
	PROCEDURE = knx_ga3_eq,
	LEFTARG = knx_group_address3,
	RIGHTARG = knx_group_address3,
	COMMUTATOR = =,
	NEGATOR = <>,
	RESTRICT = eqsel,
	JOIN = eqjoinsel,
	MERGES,
	HASHES);
CREATE OPERATOR >= (
	PROCEDURE = knx_ga3_ge,
	LEFTARG = knx_group_address3,
	RIGHTARG = knx_group_address3,
	COMMUTATOR = <=,
	NEGATOR = <,
	RESTRICT = scalargtsel,
	JOIN = scalargtjoinsel );
CREATE OPERATOR > (
	PROCEDURE = knx_ga3_gt,
	LEFTARG = knx_group_address3,
	RIGHTARG = knx_group_address3,
	COMMUTATOR = <,
	NEGATOR = <=,
	RESTRICT = scalargtsel,
	JOIN = scalargtjoinsel );
CREATE OPERATOR <> (
	PROCEDURE = knx_ga3_ne,
	LEFTARG = knx_group_address3,
	RIGHTARG = knx_group_address3,
	COMMUTATOR = <>,
	NEGATOR = =,
	RESTRICT = neqsel,
	JOIN = neqjoinsel);

--
-- Operator families for the various operator classes:
--
---------------------------------------------------

CREATE OPERATOR FAMILY knx_group_address_ops USING btree;
CREATE OPERATOR FAMILY knx_group_address_ops USING hash;

--
-- Operator classes:
--
---------------------------------------------------
CREATE FUNCTION btknx_group_address3cmp(knx_group_address3, knx_group_address3)
	RETURNS int4
	AS 'btint4cmp'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;

CREATE OPERATOR CLASS knx_group_address3_ops DEFAULT
	FOR TYPE knx_group_address3 USING btree FAMILY knx_group_address_ops AS
	OPERATOR 1  <,
	OPERATOR 2  <=,
	OPERATOR 3  =,
	OPERATOR 4  >=,
	OPERATOR 5  >,
	FUNCTION 1  btknx_group_address3cmp(knx_group_address3, knx_group_address3);

CREATE FUNCTION hashknx_group_address3(knx_group_address3)
	RETURNS int4
	AS 'hashint4'
	LANGUAGE 'internal' IMMUTABLE STRICT
	PARALLEL SAFE;

CREATE OPERATOR CLASS knx_group_address3_ops DEFAULT
	FOR TYPE knx_group_address3 USING hash FAMILY knx_group_address_ops AS
	OPERATOR 1  =,
	FUNCTION 1  hashknx_group_address3(knx_group_address3);
