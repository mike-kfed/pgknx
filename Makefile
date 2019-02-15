
MODULES = knx

EXTENSION = knx
DATA = knx--1.0.sql
PGFILEDESC = "knx - data types for KNX Protocol Adresses"

HEADERS_knx = knx.h

REGRESS = knx

PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
