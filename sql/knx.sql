--
-- Test KNX extension
--

CREATE EXTENSION knx;

-- Check whether any of our opclasses fail amvalidate
-- ... they will, because of missing cross-type operators
SELECT amname, opcname
FROM (SELECT amname, opcname, opc.oid
      FROM pg_opclass opc LEFT JOIN pg_am am ON am.oid = opcmethod
      WHERE opc.oid >= 16384
      ORDER BY 1, 2 OFFSET 0) ss
WHERE NOT amvalidate(oid);

--
-- test valid conversions
--
SELECT '17/6/1'::knx_group_address3;
SELECT '00FA'::knx_group_address3;
SELECT '0xA0FA'::knx_group_address3;
SELECT 165::knx_group_address3;

SELECT '29/2012'::knx_group_address2;
SELECT '02E7'::knx_group_address2;
SELECT 165::knx_group_address2;

SELECT '4.3.250'::knx_individual_address;
SELECT '12A5'::knx_individual_address;
SELECT 2000::knx_individual_address;

SELECT ('00FA'::knx_group_address3)::integer;
SELECT ('00FA'::knx_group_address2)::integer;
SELECT ('12A5'::knx_individual_address)::integer;
--
-- test invalid
--

SELECT '32/1/2'::knx_group_address3;
SELECT '0/0/0'::knx_group_address3;
SELECT '31/8/23'::knx_group_address3;
SELECT '31/1/300'::knx_group_address3;
SELECT '17/2050'::knx_group_address2;
SELECT '0000'::knx_group_address2;
SELECT '0x0000'::knx_group_address2;
SELECT '3300FA'::knx_group_address3;
SELECT 65000165::knx_group_address3;
SELECT 0::knx_group_address3;


SELECT 0::knx_individual_address;
SELECT '0.0.0'::knx_individual_address;
SELECT '16.0.1'::knx_individual_address;
SELECT '15.16.1'::knx_individual_address;
SELECT '15.12.256'::knx_individual_address;


--
-- cleanup
--
DROP EXTENSION knx;
