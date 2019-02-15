
--
-- Now the operators:
--
/*
--
-- GTIN-14 operators:
--
---------------------------------------------------
CREATE OPERATOR < (
	PROCEDURE = isnlt,
	LEFTARG = gtin14,
	RIGHTARG = gtin14,
	COMMUTATOR = >,
	NEGATOR = >=,
	RESTRICT = scalarltsel,
	JOIN = scalarltjoinsel);
CREATE OPERATOR <= (
	PROCEDURE = isnle,
	LEFTARG = gtin14,
	RIGHTARG = gtin14,
	COMMUTATOR = >=,
	NEGATOR = >,
	RESTRICT = scalarltsel,
	JOIN = scalarltjoinsel);
CREATE OPERATOR = (
	PROCEDURE = isneq,
	LEFTARG = gtin14,
	RIGHTARG = gtin14,
	COMMUTATOR = =,
	NEGATOR = <>,
	RESTRICT = eqsel,
	JOIN = eqjoinsel,
	MERGES,
	HASHES);
CREATE OPERATOR >= (
	PROCEDURE = isnge,
	LEFTARG = gtin14,
	RIGHTARG = gtin14,
	COMMUTATOR = <=,
	NEGATOR = <,
	RESTRICT = scalargtsel,
	JOIN = scalargtjoinsel );
CREATE OPERATOR > (
	PROCEDURE = isngt,
	LEFTARG = gtin14,
	RIGHTARG = gtin14,
	COMMUTATOR = <,
	NEGATOR = <=,
	RESTRICT = scalargtsel,
	JOIN = scalargtjoinsel );
CREATE OPERATOR <> (
	PROCEDURE = isnne,
	LEFTARG = gtin14,
	RIGHTARG = gtin14,
	COMMUTATOR = <>,
	NEGATOR = =,
	RESTRICT = neqsel,
	JOIN = neqjoinsel);

--
-- Operator families for the various operator classes:
--
---------------------------------------------------

CREATE OPERATOR FAMILY isn_ops USING btree;
CREATE OPERATOR FAMILY isn_ops USING hash;

--
-- Operator classes:
--
---------------------------------------------------
-- GTIN-14:
CREATE FUNCTION btgtin14cmp(gtin14, gtin14)
	RETURNS int4
	AS 'btint8cmp'
	LANGUAGE 'internal'
	IMMUTABLE STRICT
	PARALLEL SAFE;

CREATE OPERATOR CLASS gtin14_ops DEFAULT
	FOR TYPE gtin14 USING btree FAMILY isn_ops AS
	OPERATOR 1  <,
	OPERATOR 2  <=,
	OPERATOR 3  =,
	OPERATOR 4  >=,
	OPERATOR 5  >,
	FUNCTION 1  btgtin14cmp(gtin14, gtin14);

CREATE FUNCTION hashgtin14(gtin14)
	RETURNS int4
	AS 'hashint8'
	LANGUAGE 'internal' IMMUTABLE STRICT
	PARALLEL SAFE;

CREATE OPERATOR CLASS gtin14_ops DEFAULT
	FOR TYPE gtin14 USING hash FAMILY isn_ops AS
	OPERATOR 1  =,
	FUNCTION 1  hashgtin14(gtin14);
*/
