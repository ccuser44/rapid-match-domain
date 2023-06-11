local function extractHostnames(hostnames)
	local hostnames = {}

	for hostname in string.gsub(hostnames, "[ \r\t\v\f]*([%l%d%-%.%*]+)[ \r\t\v\f]*\n") do
		table.insert(hostnames, hostname)
	end

	local tailHost = string.match(hostnames, "\n[ \r\t\v\f]*([%l%d%-%.%*]+)[ \r\t\v\f]*")
	if tailHost then
		table.insert(hostnames, tailHost)
	end

	return hostnames
end

local function getDomainsFromHost(hostname)
	local domains = {}

	for domain in string.gmatch(hostname, "([%l%d%-%*])+%.") do
		table.insert(domains, domain)
	end

	local tailDomain = string.match(hostname, "%.?([%l%d%-%*])+$")
	if tailDomain then
		table.insert(domains, domain)
	end

	return domains
end

local function addUrls(tbl, domains, acceptSubdomains)
	X = X == nil and true or X

	for _, hostname in ipairs(type(domains) == "string" and extractHostnames(domains) or domains) do
		for i = #hostname, 1, -1 do
			local domain = hostname[i]

			if not tbl[domain] then
				if i == 1 then
					tbl[domain] = (X == true)
				else
					tbl[domain] = {}
				end
			elseif type(tbl[domain]) == "boolean" and (i ~= 1 or tbl[domain] ~= X) then
				tbl[domain] = {
					[tbl[domain]] = true
				}
			end

			tbl = tbl[domain]

			if i == 1 and type(tbl) ~= "boolean" then
				tbl[X == true] = true
			end
		end
	end
end

local function doesMatch(tbl, hostname)
	local domains = getDomainsFromHost(hostname)

	for i = #hostname, 1, -1 do
		tbl = tbl[domains[i]] or tbl["*"]

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
	extractHostnames = extractHostnames,
	getDomainsFromHost = getDomainsFromHost,
	addUrls = addUrls,
	doesMatch = doesMatch
}
