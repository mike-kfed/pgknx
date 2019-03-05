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
SELECT '1/0/0'::knx_group_address3;
SELECT '0/1/0'::knx_group_address3;
SELECT '0/0/1'::knx_group_address3;
SELECT '00FA'::knx_group_address3;
SELECT '0xA0FA'::knx_group_address3;
SELECT 165::knx_group_address3;

SELECT '29/2012'::knx_group_address2;
SELECT '1/0'::knx_group_address2;
SELECT '0/1'::knx_group_address2;
SELECT '02E7'::knx_group_address2;
SELECT 165::knx_group_address2;

SELECT '4.3.250'::knx_individual_address;
SELECT '12A5'::knx_individual_address;
SELECT '0x1145'::knx_individual_address;
SELECT 2000::knx_individual_address;

--
-- test casts
--
SELECT ('00FA'::knx_group_address3)::integer;
SELECT ('00FA'::knx_group_address2)::integer;
SELECT ('12A5'::knx_individual_address)::integer;

--
-- test binary send
--
SELECT knx_ga3_send('00FA'::knx_group_address3);
SELECT knx_ga2_send('00FA'::knx_group_address2);
SELECT knx_ia_send('00FA'::knx_individual_address);

--
-- test invalid
--
SELECT '32/1/2'::knx_group_address3;
SELECT '0/0/0'::knx_group_address3;
SELECT '31/8/23'::knx_group_address3;
SELECT '31/1/300'::knx_group_address3;
SELECT '3300FA'::knx_group_address3;
SELECT 65000165::knx_group_address3;
SELECT 0::knx_group_address3;

SELECT '17/2050'::knx_group_address2;
SELECT '0000'::knx_group_address2;
SELECT '0x0000'::knx_group_address2;

SELECT 0::knx_individual_address;
SELECT '0.0.0'::knx_individual_address;
SELECT '0x0'::knx_individual_address;
SELECT '16.0.1'::knx_individual_address;
SELECT '15.16.1'::knx_individual_address;
SELECT '15.12.256'::knx_individual_address;

--
-- test op classes
--
create table knx_test(
	a knx_group_address3 primary key,
	b knx_group_address2,
	c knx_individual_address
);
create index on knx_test(b);
create index on knx_test(c);
insert into knx_test values ('0/1/2', '1/230', '12.13.14');
select * from knx_test;
-- testing binary protocol send and receive using COPY WITH BINARY
-- this is commented code to not mess with other peoples filesystem
-- code in here for reference
/*
copy knx_test
	to '/tmp/pgknx.pgdump'
	with binary;
truncate table knx_test;
copy knx_test from '/tmp/pgknx.pgdump' with binary;
select * from knx_test;
*/
drop table knx_test;

--
-- cleanup
--
DROP EXTENSION knx;
