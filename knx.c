/*-------------------------------------------------------------------------
 *
 * knx.c
 *	  PostgreSQL type definitions for KNX Group/individual Addresses
 *
 * Author:	Michael Kefeder (htd)
 *
 *-------------------------------------------------------------------------
 */

#include "postgres.h"

#include "fmgr.h"
#include "utils/builtins.h"

#include "knx.h"

PG_MODULE_MAGIC;

#ifdef USE_ASSERT_CHECKING
#define KNX_DEBUG 1
#else
#define KNX_DEBUG 0
#endif


enum knx_type
{
	INVALID, ANY, GA_LEVEL3, GA_LEVEL2, INDIVIDUAL
};

/*static const char *const knx_names[] = {"invalid", "KNX Address", "Group Address Level 3", "Group Address Level 2", "Individual Address"};*/

const size_t MAX_ADDR_LEN = 12;

/*----------------------------------------------------------
 * Formatting and conversion routines.
 *---------------------------------------------------------*/

static bool
string2group_addr(const char *addr, bool errorOK, knx_addr *result,
		   enum knx_type accept)
{
	unsigned int a=0, b=0, c=0, res;
	res = sscanf(addr, "%u/%u/%u", &a, &b, &c);
	if (res == 3 && a <= 0x1F && b <= 0x07 && c <= 0xFF
			&& (a > 0 || b > 0 || c > 0))
	{
		*result = (a << 11) | (b << 8) | c;
		return true;
	}
	if (res == 2 && a <= 0x1F && b <= 0x7FF
			&& (a > 0 || b > 0))
	{
		*result = (a << 11) | (b & 0x7FF);
		return true;
	}
	if (res == 1 && sscanf(addr, "%x", &a) == 1 && a <= 0xFFFF
			&& a > 0)
	{
		*result = a;
		return true;
	}
	ereport(ERROR,
			(errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE),
			 errmsg("invalid group address format/values %s", addr)));
	return false;
}

static bool
string2individual_addr(const char *addr, bool errorOK, knx_addr *result)
{
	unsigned int a=0, b=0, c=0, res;
	res = sscanf(addr, "%u.%u.%u", &a, &b, &c);
	if (res == 3 && a == 0 && b == 0 && c == 0)
		goto kaputt;
	if (res == 3 && (a > 15 || b > 15 || c > 255))
		goto kaputt;
	if (res == 3)
	{
		*result = ((a & 0x0f) << 12) | ((b & 0x0f) << 8) | ((c & 0xff));
		return true;
	}
	res = sscanf(addr, "%x", &a);
	if (res == 1 && a > 0)
	{
		*result = a & 0xffff;
		return true;
	}
kaputt:
	ereport(ERROR,
			(errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE),
			 errmsg("invalid individual address format/values %s", addr)));
	return false;
}

static bool
group_addr2string(knx_addr addr, bool errorOK, char *result)
{
	if (snprintf(result, MAX_ADDR_LEN, "%d/%d/%d",
			(addr >> 11) & 0x1f, (addr >> 8) & 0x07, (addr) & 0xff) < 0)
	{
		ereport(ERROR,
			(errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE),
			 errmsg("cannot format to group address %d", addr)));
		return false;
	}
	return true;
}

static bool
group_addr2ga2string(knx_addr addr, bool errorOK, char *result)
{
	if (snprintf(result, MAX_ADDR_LEN, "%d/%d",
			(addr >> 11) & 0x1f, addr & 0x07ff) < 0)
	{
		ereport(ERROR,
			(errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE),
			 errmsg("cannot format to group address %d", addr)));
		return false;
	}
	return true;
}

static bool
individual_addr2string(knx_addr addr, bool errorOK, char *result)
{
	if (snprintf(result, MAX_ADDR_LEN, "%d.%d.%d",
			(addr >> 12) & 0x0f, (addr >> 8) & 0x0f, (addr) & 0xff) < 0)
	{
		ereport(ERROR,
			(errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE),
			 errmsg("cannot format to individual address %d", addr)));
		return false;
	}
	return true;
}

PG_FUNCTION_INFO_V1(knx_ga3_out);
Datum
knx_ga3_out(PG_FUNCTION_ARGS)
{
	knx_addr	val = PG_GETARG_KNX_ADDR(0);
	char	   *result;
	char		buf[MAX_ADDR_LEN + 1];

	(void) group_addr2string(val, false, buf);

	result = pstrdup(buf);
	PG_RETURN_CSTRING(result);
}

PG_FUNCTION_INFO_V1(knx_ga3_in);
Datum
knx_ga3_in(PG_FUNCTION_ARGS)
{
	const char *str = PG_GETARG_CSTRING(0);
	knx_addr		result;

	(void) string2group_addr(str, false, &result, GA_LEVEL3);
	PG_RETURN_KNX_ADDR(result);
}

PG_FUNCTION_INFO_V1(knx_ga2_out);
Datum
knx_ga2_out(PG_FUNCTION_ARGS)
{
	knx_addr	val = PG_GETARG_KNX_ADDR(0);
	char	   *result;
	char		buf[MAX_ADDR_LEN + 1];

	(void) group_addr2ga2string(val, false, buf);

	result = pstrdup(buf);
	PG_RETURN_CSTRING(result);
}

PG_FUNCTION_INFO_V1(knx_ga2_in);
Datum
knx_ga2_in(PG_FUNCTION_ARGS)
{
	const char *str = PG_GETARG_CSTRING(0);
	knx_addr		result;

	(void) string2group_addr(str, false, &result, GA_LEVEL2);
	PG_RETURN_KNX_ADDR(result);
}

PG_FUNCTION_INFO_V1(int_to_knx_addr);
Datum
int_to_knx_addr(PG_FUNCTION_ARGS)
{
	int32 arg1 = PG_GETARG_INT32(0);
	knx_addr		result;

	result = arg1;
	if ((uint16) result != arg1)
		ereport(ERROR,
			(errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE),
			 errmsg("integer out of range")));
	if (result == 0)
		ereport(ERROR,
			(errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE),
			 errmsg("address cannot be zero")));
	PG_RETURN_KNX_ADDR(result);
}

PG_FUNCTION_INFO_V1(knx_addr_to_int);
Datum
knx_addr_to_int(PG_FUNCTION_ARGS)
{
	knx_addr arg1 = PG_GETARG_KNX_ADDR(0);
	int32		result;

	result = arg1;
	if ((uint16) result != arg1)
		ereport(ERROR,
			(errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE),
			 errmsg("integer out of range")));
	if (result == 0)
		ereport(ERROR,
			(errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE),
			 errmsg("address cannot be zero")));
	PG_RETURN_INT32(result);
}

/* Individual Addr */

PG_FUNCTION_INFO_V1(knx_ia_out);
Datum
knx_ia_out(PG_FUNCTION_ARGS)
{
	knx_addr	val = PG_GETARG_KNX_ADDR(0);
	char	   *result;
	char		buf[MAX_ADDR_LEN + 1];

	(void) individual_addr2string(val, false, buf);

	result = pstrdup(buf);
	PG_RETURN_CSTRING(result);
}

PG_FUNCTION_INFO_V1(knx_ia_in);
Datum
knx_ia_in(PG_FUNCTION_ARGS)
{
	const char *str = PG_GETARG_CSTRING(0);
	knx_addr		result;

	(void) string2individual_addr(str, false, &result);
	PG_RETURN_KNX_ADDR(result);
}
