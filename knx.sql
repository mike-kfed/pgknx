
-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION knx" to load this file. \quit

--
-- Input and output functions and data types:
--
---------------------------------------------------
-- Level 3
CREATE FUNCTION knx_ga3_in(cstring)
	RETURNS knx_group_address3
	AS 'MODULE_PATHNAME'
	LANGUAGE C
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_ga3_out(knx_group_address3)
	RETURNS cstring
	AS 'MODULE_PATHNAME'
	LANGUAGE C
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_ga3_recv(internal) RETURNS knx_group_address3
	IMMUTABLE
	STRICT
	LANGUAGE C
	AS 'MODULE_PATHNAME',
	'knx_addr_recv';
CREATE FUNCTION knx_ga3_send(knx_group_address3) RETURNS bytea
	IMMUTABLE
	STRICT
	LANGUAGE C
	AS 'MODULE_PATHNAME',
	'knx_addr_send';
CREATE TYPE knx_group_address3 (
	INPUT = knx_ga3_in,
	OUTPUT = knx_ga3_out,
	RECEIVE = knx_ga3_recv,
	SEND = knx_ga3_send,
	INTERNALLENGTH = 2,
	PASSEDBYVALUE,
	ALIGNMENT = int2
);
COMMENT ON TYPE knx_group_address3
	IS 'KNX Group Address Level 3';

CREATE FUNCTION int2ga3(integer) RETURNS knx_group_address3 IMMUTABLE STRICT LANGUAGE C AS '$libdir/knx', 'int_to_knx_addr';
CREATE CAST (integer AS knx_group_address3) WITH FUNCTION int2ga3(integer) AS IMPLICIT;

CREATE FUNCTION ga32int(knx_group_address3) RETURNS integer IMMUTABLE STRICT LANGUAGE C AS '$libdir/knx', 'knx_addr_to_int';
CREATE CAST (knx_group_address3 AS integer) WITH FUNCTION ga32int(knx_group_address3) AS IMPLICIT;

-- Level 2
CREATE FUNCTION knx_ga2_in(cstring)
	RETURNS knx_group_address2
	AS 'MODULE_PATHNAME'
	LANGUAGE C
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_ga2_out(knx_group_address2)
	RETURNS cstring
	AS 'MODULE_PATHNAME'
	LANGUAGE C
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_ga2_recv(internal) RETURNS knx_group_address2
	IMMUTABLE
	STRICT
	LANGUAGE C
	AS 'MODULE_PATHNAME',
	'knx_addr_recv';
CREATE FUNCTION knx_ga2_send(knx_group_address2) RETURNS bytea
	IMMUTABLE
	STRICT
	LANGUAGE C
	AS 'MODULE_PATHNAME',
	'knx_addr_send';
CREATE TYPE knx_group_address2 (
	INPUT = knx_ga2_in,
	OUTPUT = knx_ga2_out,
	RECEIVE = knx_ga2_recv,
	SEND = knx_ga2_send,
	INTERNALLENGTH = 2,
	PASSEDBYVALUE,
	ALIGNMENT = int2
);
COMMENT ON TYPE knx_group_address2
	IS 'KNX Group Address Level 2';

CREATE FUNCTION int2ga2(integer) RETURNS knx_group_address2 IMMUTABLE STRICT LANGUAGE C AS '$libdir/knx', 'int_to_knx_addr';
CREATE CAST (integer AS knx_group_address2) WITH FUNCTION int2ga2(integer) AS IMPLICIT;

CREATE FUNCTION ga32int(knx_group_address2) RETURNS integer IMMUTABLE STRICT LANGUAGE C AS '$libdir/knx', 'knx_addr_to_int';
CREATE CAST (knx_group_address2 AS integer) WITH FUNCTION ga32int(knx_group_address2) AS IMPLICIT;

-- Individual
CREATE FUNCTION knx_ia_in(cstring)
	RETURNS knx_individual_address
	AS 'MODULE_PATHNAME'
	LANGUAGE C
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_ia_out(knx_individual_address)
	RETURNS cstring
	AS 'MODULE_PATHNAME'
	LANGUAGE C
	IMMUTABLE STRICT
	PARALLEL SAFE;
CREATE FUNCTION knx_ia_recv(internal) RETURNS knx_individual_address
	IMMUTABLE
	STRICT
	LANGUAGE C
	AS 'MODULE_PATHNAME',
	'knx_addr_recv';
CREATE FUNCTION knx_ia_send(knx_individual_address) RETURNS bytea
	IMMUTABLE
	STRICT
	LANGUAGE C
	AS 'MODULE_PATHNAME',
	'knx_addr_send';
CREATE TYPE knx_individual_address (
	INPUT = knx_ia_in,
	OUTPUT = knx_ia_out,
	RECEIVE = knx_ia_recv,
	SEND = knx_ia_send,
	INTERNALLENGTH = 2,
	PASSEDBYVALUE,
	ALIGNMENT = int2
);
COMMENT ON TYPE knx_individual_address
	IS 'KNX Individual Address';

CREATE FUNCTION int2ia(integer) RETURNS knx_individual_address IMMUTABLE STRICT LANGUAGE C AS '$libdir/knx', 'int_to_knx_addr';
CREATE CAST (integer AS knx_individual_address) WITH FUNCTION int2ia(integer) AS IMPLICIT;

CREATE FUNCTION ga32int(knx_individual_address) RETURNS integer IMMUTABLE STRICT LANGUAGE C AS '$libdir/knx', 'knx_addr_to_int';
CREATE CAST (knx_individual_address AS integer) WITH FUNCTION ga32int(knx_individual_address) AS IMPLICIT;
