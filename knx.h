/*-------------------------------------------------------------------------
 *
 * knx.h
 *	  PostgreSQL type definitions for KNX Group/Internal Addresses
 *
 * Author:	Michael Kefeder (htd)
 *
 *-------------------------------------------------------------------------
 */

#ifndef KNX_H
#define KNX_H

#include "fmgr.h"

#undef KNX_DEBUG
#define KNX_WEAK_MODE

/*
 * uint16 is the internal storage format for KNX addresses.
 */
typedef uint16 knx_addr;

#define KNX_ADDR_FORMAT UINT16_FORMAT

#define PG_GETARG_KNX_ADDR(n) PG_GETARG_UINT16(n)
#define PG_RETURN_KNX_ADDR(x) PG_RETURN_UINT16(x)

extern void initialize(void);

#endif							/* KNX_H */
