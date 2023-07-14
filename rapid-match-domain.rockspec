package = "rapid-match-domain"
version = "1.0.3"
source = {tag = "v1.0.3", url = "git+ssh://git@github.com/ccuser44/rapid-match-domain.git"}
description = {
    summary = "A fast Lua library to check if a domain name in a list of domain names. Wildcards, subdomains, portnumbers and IP addresses supported.",
    license = "MIT",
    homepage = "https://github.com/ccuser44/rapid-match-domain",
    issues_url = "https://github.com/ccuser44/rapid-match-domain/issues",
    maintainer = "ccuser44",
    detailed = [[
    RapidMatchDomain is a fast Lua library to check if a domain name in a list of domain names.
    It supports wildcards, subdomains, portnumbers and IP addresses.
    Has O(1) complexity meaning even with 2 million domains it doesn't lag a tiny bit more.
    For example the library is ideal for security to see if domains and/or IP addresses are in a blocklist.
]]
}

files = {
    "main.lua",
    "LICENSE",
}
