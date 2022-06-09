local filename = 'autoupdate-timestamp.lua'
local timestamp_file = debug.getinfo(1, 'S').source:sub(2):match('.*/') ..filename
local write_timestamp = function()
    local file = assert(io.open(timestamp_file, 'w')) or assert(io.open(timestamp_file, 'a'))
    file:write('return '..os.time())
    file:close()
end

local exists, timestamp = pcall(require, filename)
if not exists then
    write_timestamp()
else
    local update_interval = 2*24*60*60
    local diff = os.difftime(os.time(), timestamp)
    if diff >= update_interval then
        require'user'.update()
        write_timestamp()
    end
end
