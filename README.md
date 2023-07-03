<div align="center">

# ⚡ RapidMatchDomain ⚡

![A diagram showing the implementation](https://upload.wikimedia.org/wikipedia/commons/d/d2/DNS_schema.svg)
> [Diagram image](https://commons.wikimedia.org/wiki/File:DNS_schema.svg) is under CC BY-SA 2.5 from Wikimedia

</div>

---

A fast Lua library to check if a domain name in a list of domain names. Wildcards, subdomains and IP addresses supported.
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

### Requiring the library

To require the module use the following Lua code at the top of your script:

```lua
local rapidMatch = require("rapid-match-domain")
```

If you want you can use anything else than `rapidMatch` as the variable name for the library.

---

### Initialization of the domain List

The following Lua code initiates an empty table `t` to store a list of domain names:

```lua
local t = {}
```

---

### Adding domains to the List

The next piece of code adds the specified domain names to the existing list. This operation can be performed multiple times with different domain lists:

```lua
rapidMatch.addUrls(t, domains, true)
```

**Parameters:**
- `t` (table): The table storing the list of domain names.
- `domains` (table | string): A table or a newline seperated string containing the domain names to be added to the list.
- `useSubdomains` (boolean?) : A boolean telling if domains being matched againts the list would still match if they have extra subdomains. Default value is true.

---

### Matching a domain against the List

The final piece of code shows how to check if a domain matches any of the domain names in the list:

```lua
if rapidMatch.match(t, "www.example.com") then
-- The domain matches
end
```

**Parameters:**
- `t` (table): The table storing the list of domain names.
- `"www.example.com"` (string): The domain name to match against the list.

**Returns:**
- `true` if the domain matches any entry in the list.
- `false` if the domain does not match any entry in the list.

---

## Features

- 🔥 Wildcard support
- 🔍 Matching with and without subdomains
- 🌐 IPv4, full IPv6 addresses and portnumbers supported
- 🌍 Wildcards and subdomain support allow rudimentary IP range checking
- ⚡ Super simple implementation, no bloat, 80 lines of Lua in total
- ⏱️ Amount of domains in the list to be checked againts doesn't increase the complexity, will always be as fast as O(1) amount of domains in the checklist
