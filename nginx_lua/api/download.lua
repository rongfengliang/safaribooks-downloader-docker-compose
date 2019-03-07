
-- this feature  use lua-resty-shell  call safaribooks-downloader to do

local json = require("cjson")
local shell = require "resty.shell"
function init()
    ngx.req.read_body()
    local body = ngx.req.get_body_data()
    if not body then
        if ngx.req.get_body_file() then
            return nil, "request body did not fit into client body buffer, consider raising 'client_body_buffer_size'"
        else
            return ""
        end
    end
    local downloadinfo = json.decode(body)
    local stdin = "hello"
    local timeout = 300000  -- ms
    local max_size = 409600  -- byte
    local ok, stdout, stderr, reason, status =
        shell.run([[ls /]], stdin, timeout, max_size)
    if not ok then
        return ""
    end
    ngx.say(stdout)
end