
--
-- Operator families for the various operator classes:
--
---------------------------------------------------

CREATE OPERATOR FAMILY knx_ops USING btree;
CREATE OPERATOR FAMILY knx_ops USING hash;

--
-- Operator functions:
--
---------------------------------------------------
CREATE FUNCTION knx_group_address3_lt(knx_group_address3, knx_group_address3)
	RETURNS boolean
	AS 'int4lt'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_group_address3_le(knx_group_address3, knx_group_address3)
	RETURNS boolean
	AS 'int4le'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_group_address3_eq(knx_group_address3, knx_group_address3)
	RETURNS boolean
	AS 'int4eq'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_group_address3_ge(knx_group_address3, knx_group_address3)
	RETURNS boolean
	AS 'int4ge'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_group_address3_gt(knx_group_address3, knx_group_address3)
	RETURNS boolean
	AS 'int4gt'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_group_address3_ne(knx_group_address3, knx_group_address3)
	RETURNS boolean
	AS 'int4ne'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;


--
-- Now the operators of knx_group_address3:
--
---------------------------------------------------
CREATE OPERATOR < (
	PROCEDURE = knx_group_address3_lt,
	LEFTARG = knx_group_address3,
	RIGHTARG = knx_group_address3,
	COMMUTATOR = >,
	NEGATOR = >=,
	RESTRICT = scalarltsel,
	JOIN = scalarltjoinsel);
CREATE OPERATOR <= (
	PROCEDURE = knx_group_address3_le,
	LEFTARG = knx_group_address3,
	RIGHTARG = knx_group_address3,
	COMMUTATOR = >=,
	NEGATOR = >,
	RESTRICT = scalarltsel,
	JOIN = scalarltjoinsel);
CREATE OPERATOR = (
	PROCEDURE = knx_group_address3_eq,
	LEFTARG = knx_group_address3,
	RIGHTARG = knx_group_address3,
	COMMUTATOR = =,
	NEGATOR = <>,
	RESTRICT = eqsel,
	JOIN = eqjoinsel,
	MERGES,
	HASHES);
CREATE OPERATOR >= (
	PROCEDURE = knx_group_address3_ge,
	LEFTARG = knx_group_address3,
	RIGHTARG = knx_group_address3,
	COMMUTATOR = <=,
	NEGATOR = <,
	RESTRICT = scalargtsel,
	JOIN = scalargtjoinsel );
CREATE OPERATOR > (
	PROCEDURE = knx_group_address3_gt,
	LEFTARG = knx_group_address3,
	RIGHTARG = knx_group_address3,
	COMMUTATOR = <,
	NEGATOR = <=,
	RESTRICT = scalargtsel,
	JOIN = scalargtjoinsel );
CREATE OPERATOR <> (
	PROCEDURE = knx_group_address3_ne,
	LEFTARG = knx_group_address3,
	RIGHTARG = knx_group_address3,
	COMMUTATOR = <>,
	NEGATOR = =,
	RESTRICT = neqsel,
	JOIN = neqjoinsel);

--
-- Operator classes of knx_group_address3:
--
---------------------------------------------------
CREATE FUNCTION bt_knx_group_address3_cmp(knx_group_address3, knx_group_address3)
	RETURNS int4
	AS 'btint4cmp'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;

CREATE OPERATOR CLASS knx_group_address3_ops DEFAULT
	FOR TYPE knx_group_address3 USING btree FAMILY knx_ops AS
	OPERATOR 1  <,
	OPERATOR 2  <=,
	OPERATOR 3  =,
	OPERATOR 4  >=,
	OPERATOR 5  >,
	FUNCTION 1  bt_knx_group_address3_cmp(knx_group_address3, knx_group_address3);

CREATE FUNCTION hash_knx_group_address3(knx_group_address3)
	RETURNS int4
	AS 'hashint4'
	LANGUAGE 'internal' IMMUTABLE STRICT
	PARALLEL SAFE;

CREATE OPERATOR CLASS knx_group_address3_ops DEFAULT
	FOR TYPE knx_group_address3 USING hash FAMILY knx_ops AS
	OPERATOR 1  =,
	FUNCTION 1  hash_knx_group_address3(knx_group_address3);

--
-- Operator functions:
--
---------------------------------------------------
CREATE FUNCTION knx_group_address2_lt(knx_group_address2, knx_group_address2)
	RETURNS boolean
	AS 'int4lt'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_group_address2_le(knx_group_address2, knx_group_address2)
	RETURNS boolean
	AS 'int4le'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_group_address2_eq(knx_group_address2, knx_group_address2)
	RETURNS boolean
	AS 'int4eq'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_group_address2_ge(knx_group_address2, knx_group_address2)
	RETURNS boolean
	AS 'int4ge'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_group_address2_gt(knx_group_address2, knx_group_address2)
	RETURNS boolean
	AS 'int4gt'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_group_address2_ne(knx_group_address2, knx_group_address2)
	RETURNS boolean
	AS 'int4ne'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;


--
-- Now the operators of knx_group_address2:
--
---------------------------------------------------
CREATE OPERATOR < (
	PROCEDURE = knx_group_address2_lt,
	LEFTARG = knx_group_address2,
	RIGHTARG = knx_group_address2,
	COMMUTATOR = >,
	NEGATOR = >=,
	RESTRICT = scalarltsel,
	JOIN = scalarltjoinsel);
CREATE OPERATOR <= (
	PROCEDURE = knx_group_address2_le,
	LEFTARG = knx_group_address2,
	RIGHTARG = knx_group_address2,
	COMMUTATOR = >=,
	NEGATOR = >,
	RESTRICT = scalarltsel,
	JOIN = scalarltjoinsel);
CREATE OPERATOR = (
	PROCEDURE = knx_group_address2_eq,
	LEFTARG = knx_group_address2,
	RIGHTARG = knx_group_address2,
	COMMUTATOR = =,
	NEGATOR = <>,
	RESTRICT = eqsel,
	JOIN = eqjoinsel,
	MERGES,
	HASHES);
CREATE OPERATOR >= (
	PROCEDURE = knx_group_address2_ge,
	LEFTARG = knx_group_address2,
	RIGHTARG = knx_group_address2,
	COMMUTATOR = <=,
	NEGATOR = <,
	RESTRICT = scalargtsel,
	JOIN = scalargtjoinsel );
CREATE OPERATOR > (
	PROCEDURE = knx_group_address2_gt,
	LEFTARG = knx_group_address2,
	RIGHTARG = knx_group_address2,
	COMMUTATOR = <,
	NEGATOR = <=,
	RESTRICT = scalargtsel,
	JOIN = scalargtjoinsel );
CREATE OPERATOR <> (
	PROCEDURE = knx_group_address2_ne,
	LEFTARG = knx_group_address2,
	RIGHTARG = knx_group_address2,
	COMMUTATOR = <>,
	NEGATOR = =,
	RESTRICT = neqsel,
	JOIN = neqjoinsel);

--
-- Operator classes of knx_group_address2:
--
---------------------------------------------------
CREATE FUNCTION bt_knx_group_address2_cmp(knx_group_address2, knx_group_address2)
	RETURNS int4
	AS 'btint4cmp'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;

CREATE OPERATOR CLASS knx_group_address2_ops DEFAULT
	FOR TYPE knx_group_address2 USING btree FAMILY knx_ops AS
	OPERATOR 1  <,
	OPERATOR 2  <=,
	OPERATOR 3  =,
	OPERATOR 4  >=,
	OPERATOR 5  >,
	FUNCTION 1  bt_knx_group_address2_cmp(knx_group_address2, knx_group_address2);

CREATE FUNCTION hash_knx_group_address2(knx_group_address2)
	RETURNS int4
	AS 'hashint4'
	LANGUAGE 'internal' IMMUTABLE STRICT
	PARALLEL SAFE;

CREATE OPERATOR CLASS knx_group_address2_ops DEFAULT
	FOR TYPE knx_group_address2 USING hash FAMILY knx_ops AS
	OPERATOR 1  =,
	FUNCTION 1  hash_knx_group_address2(knx_group_address2);

--
-- Operator functions:
--
---------------------------------------------------
CREATE FUNCTION knx_individual_address_lt(knx_individual_address, knx_individual_address)
	RETURNS boolean
	AS 'int4lt'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_individual_address_le(knx_individual_address, knx_individual_address)
	RETURNS boolean
	AS 'int4le'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_individual_address_eq(knx_individual_address, knx_individual_address)
	RETURNS boolean
	AS 'int4eq'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_individual_address_ge(knx_individual_address, knx_individual_address)
	RETURNS boolean
	AS 'int4ge'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_individual_address_gt(knx_individual_address, knx_individual_address)
	RETURNS boolean
	AS 'int4gt'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_individual_address_ne(knx_individual_address, knx_individual_address)
	RETURNS boolean
	AS 'int4ne'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;


--
-- Now the operators of knx_individual_address:
--
---------------------------------------------------
CREATE OPERATOR < (
	PROCEDURE = knx_individual_address_lt,
	LEFTARG = knx_individual_address,
	RIGHTARG = knx_individual_address,
	COMMUTATOR = >,
	NEGATOR = >=,
	RESTRICT = scalarltsel,
	JOIN = scalarltjoinsel);
CREATE OPERATOR <= (
	PROCEDURE = knx_individual_address_le,
	LEFTARG = knx_individual_address,
	RIGHTARG = knx_individual_address,
	COMMUTATOR = >=,
	NEGATOR = >,
	RESTRICT = scalarltsel,
	JOIN = scalarltjoinsel);
CREATE OPERATOR = (
	PROCEDURE = knx_individual_address_eq,
	LEFTARG = knx_individual_address,
	RIGHTARG = knx_individual_address,
	COMMUTATOR = =,
	NEGATOR = <>,
	RESTRICT = eqsel,
	JOIN = eqjoinsel,
	MERGES,
	HASHES);
CREATE OPERATOR >= (
	PROCEDURE = knx_individual_address_ge,
	LEFTARG = knx_individual_address,
	RIGHTARG = knx_individual_address,
	COMMUTATOR = <=,
	NEGATOR = <,
	RESTRICT = scalargtsel,
	JOIN = scalargtjoinsel );
CREATE OPERATOR > (
	PROCEDURE = knx_individual_address_gt,
	LEFTARG = knx_individual_address,
	RIGHTARG = knx_individual_address,
	COMMUTATOR = <,
	NEGATOR = <=,
	RESTRICT = scalargtsel,
	JOIN = scalargtjoinsel );
CREATE OPERATOR <> (
	PROCEDURE = knx_individual_address_ne,
	LEFTARG = knx_individual_address,
	RIGHTARG = knx_individual_address,
	COMMUTATOR = <>,
	NEGATOR = =,
	RESTRICT = neqsel,
	JOIN = neqjoinsel);

--
-- Operator classes of knx_individual_address:
--
---------------------------------------------------
CREATE FUNCTION bt_knx_individual_address_cmp(knx_individual_address, knx_individual_address)
	RETURNS int4
	AS 'btint4cmp'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;

CREATE OPERATOR CLASS knx_individual_address_ops DEFAULT
	FOR TYPE knx_individual_address USING btree FAMILY knx_ops AS
	OPERATOR 1  <,
	OPERATOR 2  <=,
	OPERATOR 3  =,
	OPERATOR 4  >=,
	OPERATOR 5  >,
	FUNCTION 1  bt_knx_individual_address_cmp(knx_individual_address, knx_individual_address);

CREATE FUNCTION hash_knx_individual_address(knx_individual_address)
	RETURNS int4
	AS 'hashint4'
	LANGUAGE 'internal' IMMUTABLE STRICT
	PARALLEL SAFE;

CREATE OPERATOR CLASS knx_individual_address_ops DEFAULT
	FOR TYPE knx_individual_address USING hash FAMILY knx_ops AS
	OPERATOR 1  =,
	FUNCTION 1  hash_knx_individual_address(knx_individual_address);

-- btree for knx_group_address3: ['knx_group_address2', 'knx_individual_address']

--
-- Operator functions:
--
---------------------------------------------------
CREATE FUNCTION knx_group_address3_lt(knx_group_address3, knx_group_address2)
	RETURNS boolean
	AS 'int4lt'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_group_address3_le(knx_group_address3, knx_group_address2)
	RETURNS boolean
	AS 'int4le'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_group_address3_eq(knx_group_address3, knx_group_address2)
	RETURNS boolean
	AS 'int4eq'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_group_address3_ge(knx_group_address3, knx_group_address2)
	RETURNS boolean
	AS 'int4ge'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_group_address3_gt(knx_group_address3, knx_group_address2)
	RETURNS boolean
	AS 'int4gt'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_group_address3_ne(knx_group_address3, knx_group_address2)
	RETURNS boolean
	AS 'int4ne'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;


--
-- Now the operators of knx_group_address3:
--
---------------------------------------------------
CREATE OPERATOR < (
	PROCEDURE = knx_group_address3_lt,
	LEFTARG = knx_group_address3,
	RIGHTARG = knx_group_address2,
	COMMUTATOR = >,
	NEGATOR = >=,
	RESTRICT = scalarltsel,
	JOIN = scalarltjoinsel);
CREATE OPERATOR <= (
	PROCEDURE = knx_group_address3_le,
	LEFTARG = knx_group_address3,
	RIGHTARG = knx_group_address2,
	COMMUTATOR = >=,
	NEGATOR = >,
	RESTRICT = scalarltsel,
	JOIN = scalarltjoinsel);
CREATE OPERATOR = (
	PROCEDURE = knx_group_address3_eq,
	LEFTARG = knx_group_address3,
	RIGHTARG = knx_group_address2,
	COMMUTATOR = =,
	NEGATOR = <>,
	RESTRICT = eqsel,
	JOIN = eqjoinsel,
	MERGES,
	HASHES);
CREATE OPERATOR >= (
	PROCEDURE = knx_group_address3_ge,
	LEFTARG = knx_group_address3,
	RIGHTARG = knx_group_address2,
	COMMUTATOR = <=,
	NEGATOR = <,
	RESTRICT = scalargtsel,
	JOIN = scalargtjoinsel );
CREATE OPERATOR > (
	PROCEDURE = knx_group_address3_gt,
	LEFTARG = knx_group_address3,
	RIGHTARG = knx_group_address2,
	COMMUTATOR = <,
	NEGATOR = <=,
	RESTRICT = scalargtsel,
	JOIN = scalargtjoinsel );
CREATE OPERATOR <> (
	PROCEDURE = knx_group_address3_ne,
	LEFTARG = knx_group_address3,
	RIGHTARG = knx_group_address2,
	COMMUTATOR = <>,
	NEGATOR = =,
	RESTRICT = neqsel,
	JOIN = neqjoinsel);

--
-- Operator functions:
--
---------------------------------------------------
CREATE FUNCTION knx_group_address3_lt(knx_group_address3, knx_individual_address)
	RETURNS boolean
	AS 'int4lt'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_group_address3_le(knx_group_address3, knx_individual_address)
	RETURNS boolean
	AS 'int4le'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_group_address3_eq(knx_group_address3, knx_individual_address)
	RETURNS boolean
	AS 'int4eq'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_group_address3_ge(knx_group_address3, knx_individual_address)
	RETURNS boolean
	AS 'int4ge'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_group_address3_gt(knx_group_address3, knx_individual_address)
	RETURNS boolean
	AS 'int4gt'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_group_address3_ne(knx_group_address3, knx_individual_address)
	RETURNS boolean
	AS 'int4ne'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;


--
-- Now the operators of knx_group_address3:
--
---------------------------------------------------
CREATE OPERATOR < (
	PROCEDURE = knx_group_address3_lt,
	LEFTARG = knx_group_address3,
	RIGHTARG = knx_individual_address,
	COMMUTATOR = >,
	NEGATOR = >=,
	RESTRICT = scalarltsel,
	JOIN = scalarltjoinsel);
CREATE OPERATOR <= (
	PROCEDURE = knx_group_address3_le,
	LEFTARG = knx_group_address3,
	RIGHTARG = knx_individual_address,
	COMMUTATOR = >=,
	NEGATOR = >,
	RESTRICT = scalarltsel,
	JOIN = scalarltjoinsel);
CREATE OPERATOR = (
	PROCEDURE = knx_group_address3_eq,
	LEFTARG = knx_group_address3,
	RIGHTARG = knx_individual_address,
	COMMUTATOR = =,
	NEGATOR = <>,
	RESTRICT = eqsel,
	JOIN = eqjoinsel,
	MERGES,
	HASHES);
CREATE OPERATOR >= (
	PROCEDURE = knx_group_address3_ge,
	LEFTARG = knx_group_address3,
	RIGHTARG = knx_individual_address,
	COMMUTATOR = <=,
	NEGATOR = <,
	RESTRICT = scalargtsel,
	JOIN = scalargtjoinsel );
CREATE OPERATOR > (
	PROCEDURE = knx_group_address3_gt,
	LEFTARG = knx_group_address3,
	RIGHTARG = knx_individual_address,
	COMMUTATOR = <,
	NEGATOR = <=,
	RESTRICT = scalargtsel,
	JOIN = scalargtjoinsel );
CREATE OPERATOR <> (
	PROCEDURE = knx_group_address3_ne,
	LEFTARG = knx_group_address3,
	RIGHTARG = knx_individual_address,
	COMMUTATOR = <>,
	NEGATOR = =,
	RESTRICT = neqsel,
	JOIN = neqjoinsel);



CREATE FUNCTION bt_knx_group_address3_cmp(knx_group_address3, knx_group_address2)
	RETURNS int4
	AS 'btint4cmp'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;

CREATE FUNCTION bt_knx_group_address3_cmp(knx_group_address3, knx_individual_address)
	RETURNS int4
	AS 'btint4cmp'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;


ALTER OPERATOR FAMILY knx_ops USING btree ADD
	OPERATOR 1  < (knx_group_address3, knx_group_address2),
	OPERATOR 1  < (knx_group_address3, knx_individual_address),
	OPERATOR 2  <= (knx_group_address3, knx_group_address2),
	OPERATOR 2  <= (knx_group_address3, knx_individual_address),
	OPERATOR 3  = (knx_group_address3, knx_group_address2),
	OPERATOR 3  = (knx_group_address3, knx_individual_address),
	OPERATOR 4  >= (knx_group_address3, knx_group_address2),
	OPERATOR 4  >= (knx_group_address3, knx_individual_address),
	OPERATOR 5  > (knx_group_address3, knx_group_address2),
	OPERATOR 5  > (knx_group_address3, knx_individual_address),
	FUNCTION 1  bt_knx_group_address3_cmp(knx_group_address3, knx_group_address2),
	FUNCTION 1  bt_knx_group_address3_cmp(knx_group_address3, knx_individual_address);

ALTER OPERATOR FAMILY knx_ops USING hash ADD
	OPERATOR 1  = (knx_group_address3, knx_group_address2),
	OPERATOR 1  = (knx_group_address3, knx_individual_address);

-- btree for knx_group_address2: ['knx_group_address3', 'knx_individual_address']

--
-- Operator functions:
--
---------------------------------------------------
CREATE FUNCTION knx_group_address2_lt(knx_group_address2, knx_group_address3)
	RETURNS boolean
	AS 'int4lt'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_group_address2_le(knx_group_address2, knx_group_address3)
	RETURNS boolean
	AS 'int4le'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_group_address2_eq(knx_group_address2, knx_group_address3)
	RETURNS boolean
	AS 'int4eq'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_group_address2_ge(knx_group_address2, knx_group_address3)
	RETURNS boolean
	AS 'int4ge'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_group_address2_gt(knx_group_address2, knx_group_address3)
	RETURNS boolean
	AS 'int4gt'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_group_address2_ne(knx_group_address2, knx_group_address3)
	RETURNS boolean
	AS 'int4ne'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;


--
-- Now the operators of knx_group_address2:
--
---------------------------------------------------
CREATE OPERATOR < (
	PROCEDURE = knx_group_address2_lt,
	LEFTARG = knx_group_address2,
	RIGHTARG = knx_group_address3,
	COMMUTATOR = >,
	NEGATOR = >=,
	RESTRICT = scalarltsel,
	JOIN = scalarltjoinsel);
CREATE OPERATOR <= (
	PROCEDURE = knx_group_address2_le,
	LEFTARG = knx_group_address2,
	RIGHTARG = knx_group_address3,
	COMMUTATOR = >=,
	NEGATOR = >,
	RESTRICT = scalarltsel,
	JOIN = scalarltjoinsel);
CREATE OPERATOR = (
	PROCEDURE = knx_group_address2_eq,
	LEFTARG = knx_group_address2,
	RIGHTARG = knx_group_address3,
	COMMUTATOR = =,
	NEGATOR = <>,
	RESTRICT = eqsel,
	JOIN = eqjoinsel,
	MERGES,
	HASHES);
CREATE OPERATOR >= (
	PROCEDURE = knx_group_address2_ge,
	LEFTARG = knx_group_address2,
	RIGHTARG = knx_group_address3,
	COMMUTATOR = <=,
	NEGATOR = <,
	RESTRICT = scalargtsel,
	JOIN = scalargtjoinsel );
CREATE OPERATOR > (
	PROCEDURE = knx_group_address2_gt,
	LEFTARG = knx_group_address2,
	RIGHTARG = knx_group_address3,
	COMMUTATOR = <,
	NEGATOR = <=,
	RESTRICT = scalargtsel,
	JOIN = scalargtjoinsel );
CREATE OPERATOR <> (
	PROCEDURE = knx_group_address2_ne,
	LEFTARG = knx_group_address2,
	RIGHTARG = knx_group_address3,
	COMMUTATOR = <>,
	NEGATOR = =,
	RESTRICT = neqsel,
	JOIN = neqjoinsel);

--
-- Operator functions:
--
---------------------------------------------------
CREATE FUNCTION knx_group_address2_lt(knx_group_address2, knx_individual_address)
	RETURNS boolean
	AS 'int4lt'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_group_address2_le(knx_group_address2, knx_individual_address)
	RETURNS boolean
	AS 'int4le'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_group_address2_eq(knx_group_address2, knx_individual_address)
	RETURNS boolean
	AS 'int4eq'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_group_address2_ge(knx_group_address2, knx_individual_address)
	RETURNS boolean
	AS 'int4ge'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_group_address2_gt(knx_group_address2, knx_individual_address)
	RETURNS boolean
	AS 'int4gt'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_group_address2_ne(knx_group_address2, knx_individual_address)
	RETURNS boolean
	AS 'int4ne'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;


--
-- Now the operators of knx_group_address2:
--
---------------------------------------------------
CREATE OPERATOR < (
	PROCEDURE = knx_group_address2_lt,
	LEFTARG = knx_group_address2,
	RIGHTARG = knx_individual_address,
	COMMUTATOR = >,
	NEGATOR = >=,
	RESTRICT = scalarltsel,
	JOIN = scalarltjoinsel);
CREATE OPERATOR <= (
	PROCEDURE = knx_group_address2_le,
	LEFTARG = knx_group_address2,
	RIGHTARG = knx_individual_address,
	COMMUTATOR = >=,
	NEGATOR = >,
	RESTRICT = scalarltsel,
	JOIN = scalarltjoinsel);
CREATE OPERATOR = (
	PROCEDURE = knx_group_address2_eq,
	LEFTARG = knx_group_address2,
	RIGHTARG = knx_individual_address,
	COMMUTATOR = =,
	NEGATOR = <>,
	RESTRICT = eqsel,
	JOIN = eqjoinsel,
	MERGES,
	HASHES);
CREATE OPERATOR >= (
	PROCEDURE = knx_group_address2_ge,
	LEFTARG = knx_group_address2,
	RIGHTARG = knx_individual_address,
	COMMUTATOR = <=,
	NEGATOR = <,
	RESTRICT = scalargtsel,
	JOIN = scalargtjoinsel );
CREATE OPERATOR > (
	PROCEDURE = knx_group_address2_gt,
	LEFTARG = knx_group_address2,
	RIGHTARG = knx_individual_address,
	COMMUTATOR = <,
	NEGATOR = <=,
	RESTRICT = scalargtsel,
	JOIN = scalargtjoinsel );
CREATE OPERATOR <> (
	PROCEDURE = knx_group_address2_ne,
	LEFTARG = knx_group_address2,
	RIGHTARG = knx_individual_address,
	COMMUTATOR = <>,
	NEGATOR = =,
	RESTRICT = neqsel,
	JOIN = neqjoinsel);



CREATE FUNCTION bt_knx_group_address2_cmp(knx_group_address2, knx_group_address3)
	RETURNS int4
	AS 'btint4cmp'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;

CREATE FUNCTION bt_knx_group_address2_cmp(knx_group_address2, knx_individual_address)
	RETURNS int4
	AS 'btint4cmp'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;


ALTER OPERATOR FAMILY knx_ops USING btree ADD
	OPERATOR 1  < (knx_group_address2, knx_group_address3),
	OPERATOR 1  < (knx_group_address2, knx_individual_address),
	OPERATOR 2  <= (knx_group_address2, knx_group_address3),
	OPERATOR 2  <= (knx_group_address2, knx_individual_address),
	OPERATOR 3  = (knx_group_address2, knx_group_address3),
	OPERATOR 3  = (knx_group_address2, knx_individual_address),
	OPERATOR 4  >= (knx_group_address2, knx_group_address3),
	OPERATOR 4  >= (knx_group_address2, knx_individual_address),
	OPERATOR 5  > (knx_group_address2, knx_group_address3),
	OPERATOR 5  > (knx_group_address2, knx_individual_address),
	FUNCTION 1  bt_knx_group_address2_cmp(knx_group_address2, knx_group_address3),
	FUNCTION 1  bt_knx_group_address2_cmp(knx_group_address2, knx_individual_address);

ALTER OPERATOR FAMILY knx_ops USING hash ADD
	OPERATOR 1  = (knx_group_address2, knx_group_address3),
	OPERATOR 1  = (knx_group_address2, knx_individual_address);

-- btree for knx_individual_address: ['knx_group_address3', 'knx_group_address2']

--
-- Operator functions:
--
---------------------------------------------------
CREATE FUNCTION knx_individual_address_lt(knx_individual_address, knx_group_address3)
	RETURNS boolean
	AS 'int4lt'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_individual_address_le(knx_individual_address, knx_group_address3)
	RETURNS boolean
	AS 'int4le'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_individual_address_eq(knx_individual_address, knx_group_address3)
	RETURNS boolean
	AS 'int4eq'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_individual_address_ge(knx_individual_address, knx_group_address3)
	RETURNS boolean
	AS 'int4ge'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_individual_address_gt(knx_individual_address, knx_group_address3)
	RETURNS boolean
	AS 'int4gt'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_individual_address_ne(knx_individual_address, knx_group_address3)
	RETURNS boolean
	AS 'int4ne'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;


--
-- Now the operators of knx_individual_address:
--
---------------------------------------------------
CREATE OPERATOR < (
	PROCEDURE = knx_individual_address_lt,
	LEFTARG = knx_individual_address,
	RIGHTARG = knx_group_address3,
	COMMUTATOR = >,
	NEGATOR = >=,
	RESTRICT = scalarltsel,
	JOIN = scalarltjoinsel);
CREATE OPERATOR <= (
	PROCEDURE = knx_individual_address_le,
	LEFTARG = knx_individual_address,
	RIGHTARG = knx_group_address3,
	COMMUTATOR = >=,
	NEGATOR = >,
	RESTRICT = scalarltsel,
	JOIN = scalarltjoinsel);
CREATE OPERATOR = (
	PROCEDURE = knx_individual_address_eq,
	LEFTARG = knx_individual_address,
	RIGHTARG = knx_group_address3,
	COMMUTATOR = =,
	NEGATOR = <>,
	RESTRICT = eqsel,
	JOIN = eqjoinsel,
	MERGES,
	HASHES);
CREATE OPERATOR >= (
	PROCEDURE = knx_individual_address_ge,
	LEFTARG = knx_individual_address,
	RIGHTARG = knx_group_address3,
	COMMUTATOR = <=,
	NEGATOR = <,
	RESTRICT = scalargtsel,
	JOIN = scalargtjoinsel );
CREATE OPERATOR > (
	PROCEDURE = knx_individual_address_gt,
	LEFTARG = knx_individual_address,
	RIGHTARG = knx_group_address3,
	COMMUTATOR = <,
	NEGATOR = <=,
	RESTRICT = scalargtsel,
	JOIN = scalargtjoinsel );
CREATE OPERATOR <> (
	PROCEDURE = knx_individual_address_ne,
	LEFTARG = knx_individual_address,
	RIGHTARG = knx_group_address3,
	COMMUTATOR = <>,
	NEGATOR = =,
	RESTRICT = neqsel,
	JOIN = neqjoinsel);

--
-- Operator functions:
--
---------------------------------------------------
CREATE FUNCTION knx_individual_address_lt(knx_individual_address, knx_group_address2)
	RETURNS boolean
	AS 'int4lt'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_individual_address_le(knx_individual_address, knx_group_address2)
	RETURNS boolean
	AS 'int4le'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_individual_address_eq(knx_individual_address, knx_group_address2)
	RETURNS boolean
	AS 'int4eq'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_individual_address_ge(knx_individual_address, knx_group_address2)
	RETURNS boolean
	AS 'int4ge'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_individual_address_gt(knx_individual_address, knx_group_address2)
	RETURNS boolean
	AS 'int4gt'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_individual_address_ne(knx_individual_address, knx_group_address2)
	RETURNS boolean
	AS 'int4ne'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;


--
-- Now the operators of knx_individual_address:
--
---------------------------------------------------
CREATE OPERATOR < (
	PROCEDURE = knx_individual_address_lt,
	LEFTARG = knx_individual_address,
	RIGHTARG = knx_group_address2,
	COMMUTATOR = >,
	NEGATOR = >=,
	RESTRICT = scalarltsel,
	JOIN = scalarltjoinsel);
CREATE OPERATOR <= (
	PROCEDURE = knx_individual_address_le,
	LEFTARG = knx_individual_address,
	RIGHTARG = knx_group_address2,
	COMMUTATOR = >=,
	NEGATOR = >,
	RESTRICT = scalarltsel,
	JOIN = scalarltjoinsel);
CREATE OPERATOR = (
	PROCEDURE = knx_individual_address_eq,
	LEFTARG = knx_individual_address,
	RIGHTARG = knx_group_address2,
	COMMUTATOR = =,
	NEGATOR = <>,
	RESTRICT = eqsel,
	JOIN = eqjoinsel,
	MERGES,
	HASHES);
CREATE OPERATOR >= (
	PROCEDURE = knx_individual_address_ge,
	LEFTARG = knx_individual_address,
	RIGHTARG = knx_group_address2,
	COMMUTATOR = <=,
	NEGATOR = <,
	RESTRICT = scalargtsel,
	JOIN = scalargtjoinsel );
CREATE OPERATOR > (
	PROCEDURE = knx_individual_address_gt,
	LEFTARG = knx_individual_address,
	RIGHTARG = knx_group_address2,
	COMMUTATOR = <,
	NEGATOR = <=,
	RESTRICT = scalargtsel,
	JOIN = scalargtjoinsel );
CREATE OPERATOR <> (
	PROCEDURE = knx_individual_address_ne,
	LEFTARG = knx_individual_address,
	RIGHTARG = knx_group_address2,
	COMMUTATOR = <>,
	NEGATOR = =,
	RESTRICT = neqsel,
	JOIN = neqjoinsel);



CREATE FUNCTION bt_knx_individual_address_cmp(knx_individual_address, knx_group_address3)
	RETURNS int4
	AS 'btint4cmp'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;

CREATE FUNCTION bt_knx_individual_address_cmp(knx_individual_address, knx_group_address2)
	RETURNS int4
	AS 'btint4cmp'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;


ALTER OPERATOR FAMILY knx_ops USING btree ADD
	OPERATOR 1  < (knx_individual_address, knx_group_address3),
	OPERATOR 1  < (knx_individual_address, knx_group_address2),
	OPERATOR 2  <= (knx_individual_address, knx_group_address3),
	OPERATOR 2  <= (knx_individual_address, knx_group_address2),
	OPERATOR 3  = (knx_individual_address, knx_group_address3),
	OPERATOR 3  = (knx_individual_address, knx_group_address2),
	OPERATOR 4  >= (knx_individual_address, knx_group_address3),
	OPERATOR 4  >= (knx_individual_address, knx_group_address2),
	OPERATOR 5  > (knx_individual_address, knx_group_address3),
	OPERATOR 5  > (knx_individual_address, knx_group_address2),
	FUNCTION 1  bt_knx_individual_address_cmp(knx_individual_address, knx_group_address3),
	FUNCTION 1  bt_knx_individual_address_cmp(knx_individual_address, knx_group_address2);

ALTER OPERATOR FAMILY knx_ops USING hash ADD
	OPERATOR 1  = (knx_individual_address, knx_group_address3),
	OPERATOR 1  = (knx_individual_address, knx_group_address2);
