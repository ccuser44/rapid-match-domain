<div align="center">

# ⚡ RapidMatchDomain ⚡

![A diagram showing the implementation](https://upload.wikimedia.org/wikipedia/commons/d/d2/DNS_schema.svg)
> [Diagram image](https://commons.wikimedia.org/wiki/File:DNS_schema.svg) is under CC BY-SA 2.5 from Wikimedia

</div>

---

A fast Lua library to check if a domain name in a list of domain names with wildcard, subdomain and IP address support.
It has O(1) complexity meaning even with 2 million domains it doesn't lag a tiny bit more.

For example the library is ideal for security to see if domains and/or IP addresses are in a blocklist.

## Installing

### Installing via LuaRocks

Run `$ luarocks install rapid-match-domain`

### Installing via Lit

Work in progess...

### Instaling via Wally

Work in progess...

### Installing standalone

Work in progess...

## Usage

Work in progess...

## Features

- 🔥 Wildcard support
- 🔍 Matching with and without subdomains
- 🌐 IPv4 addresses supported
- 🌍 Wildcards and subdomain support allow rudimentary IP range checking
- ⚡ Super simple implementation, no bloat, 60 lines of Lua in total
- ⏱️ Amount of domains in the list to be checked againts doesn't increase the complexity, will always be as fast as O(1) amount of domains in the checklist
