
-- this feature  use lua-resty-shell  call safaribooks-downloader to do

local json = require("cjson")
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
    ngx.say(downloadinfo)
end