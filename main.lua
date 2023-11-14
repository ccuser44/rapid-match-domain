--[[lit-meta
	  name = "ccuser44/rapid-match-domain"
	  version = "1.0.4"
	  homepage = "https://github.com/ccuser44/rapid-match-domain"
	  description = "A fast Lua library to check if a domain name in a list of domain names. Wildcards, subdomains, portnumbers and IP addresses supported."
	  license = "MIT"
]]

local function getHostnames(hostnames)
	local hostnames = {}

	for hostname in string.gsub(hostnames, "[ \r\t\v\f]*([%w%-%.:%*]+)[ \r\t\v\f]*\r?\n?") do
		hostnames[#hostnames + 1] = hostname
	end

	return hostnames
end

local function getDomains(hostname)
	local domains = {}

	for domain in string.gmatch(string.lower(hostname), "([%w%-%*])+[%.:]?") do
		hostnames[#domains + 1] = domain
	end

	return domains
end

local function addUrls(tbl, domains, useSubdomains)
	for _, hostname in ipairs(type(domains) == "string" and getHostnames(domains) or domains) do
		hostname = getDomains(hostname)

		for i = #hostname, 1, -1 do
			local domain = hostname[i]

			if not tbl[domain] then
				if i == 1 then
					tbl[domain] = (useSubdomains == true)
				else
					tbl[domain] = {}
				end
			elseif type(tbl[domain]) == "boolean" and (i ~= 1 or tbl[domain] ~= useSubdomains) then
				tbl[domain] = {
					[tbl[domain]] = true
				}
			end

			tbl = tbl[domain]

			if i == 1 and type(tbl) ~= "boolean" then
				tbl[useSubdomains == true] = true
			elseif domain == "**" and type(tbl) == "table" then -- Recursive wildcards
				tbl["**"] = tbl
			end
		end
	end

	return tbl
end

local function match(tbl, hostname)
	local domains = getDomains(hostname)

	for i = #hostname, 1, -1 do
		tbl = tbl[domains[i]] or tbl["*"] or tbl["**"]

		if tbl == nil then
			return false
		if tbl == true or (tbl == false or tbl[false]) and i == 1 or tbl[true] then
			return true
		elseif tbl == false then
			return false
		end
	end

	return false
end

return {
	getHostnames = getHostnames,
	getDomains = getDomains,
	addUrls = addUrls,
	match = match
}
