local function scandir(directory)
    local i, t, popen = 0, {}, io.popen
    local pfile = popen('ls "'..directory..'"')
    for filename in pfile:lines() do
        local name, ext = filename:match('(.+)(%..+)')
        i = i + 1
        t[i] = {ext = ext, name = name, full = filename}
    end
    pfile:close()
    return t
end

local currentExec = debug.getinfo(1,'S');
local pluginConfigsDir = currentExec.source:gsub('^@', ''):gsub('/init.lua', '')
local plugins = scandir(pluginConfigsDir)

for _, file in ipairs(plugins) do
    if file.name ~= 'init' then
        local status, _ = pcall(require, 'config.plugins.'..file.name)
        if not status then
            print(file.full .. " not loaded.")
        end
    end
end
