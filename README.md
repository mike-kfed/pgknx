# KNX Address Datatypes

This extension for Postgresql provides data-types to store knx-addresses.

Inspired by pguint extension and the inet/cidr network datatypes.

Only uses 2 bytes to store, has full data validation and human readable representation.

## Install

```bash
make
sudo make install
# for tests run
make installcheck
```

## Usage

```sql
CREATE EXTENSION knx;

SELECT '17/6/1'::knx_group_address3;
SELECT '29/2012'::knx_group_address2;

SELECT '4.3.250'::knx_individual_address;

```

## Docs:

### KNX Individual Address

https://support.knx.org/hc/en-us/articles/115003185789-Individual-Address

- D7+D6+D5+D4 of the device high address octet represent the Area (A) the device belongs to
- D3+D2+D1+D0 of the device high address octet represent the Line (L) the device is connected to
- the entire device low address octet represents the Device Address (D) within the Line
- allowed range: A = 0..15, L = 0..15, D = 0..255
- **not allowed**: `0.0.0`

### KNX Group Address:

https://support.knx.org/hc/en-us/articles/115003188109-Group-Addresses

#### '3-level' = main/middle/sub

- main = D7+D6+D5+D4+D3 of the first octet (high address)
- middle = D2+D1+D0 of the first octet (high address)
- sub = the entire second octet (low address)
- allowed ranges: main = 0..31, middle = 0..7, sub = 0..255

#### '2-level' = main/sub

- main = D7+D6+D5+D4+D3 of the first octet (high address)
- sub = D2+D1+D0 of the first octet (high address) + the entire second octet (low address)
- allowed ranges: main = 0..31, sub = 0..2047
- **not allowed**: `0/0/0` and `0/0`

## Future

- support subnet selection like inet/cidr
- add DPT storage and conversion?
