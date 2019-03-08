
-- this feature  use lua-resty-shell  call safaribooks-downloader to do

local json = require("cjson")
local shell = require "resty.shell"

function exec_shell(ebookid,storagepath,username,password)
   -- for simple use ebookid
   local filename = ebookid..".epub"
   local defaultstoragepath = (storagepath or "/app/")..filename
   --  exec shell format  -b ebookid  -o output directory
   --  safaribooks-downloader -b <ebookid> -u <id> -p <password> -o /Users/dalong/Desktop/testbook.epub
   return "/app/safaribooks-downloader".." -b "..ebookid.." ".." -o "..defaultstoragepath.." -u "..username.." -p "..password.." -d"
end

function init()
    ngx.req.read_body()
    local method_name = ngx.req.get_method()
    if method_name ~= "POST" then
       ngx.say("must with post  to pass datas")
    end
    local body = ngx.req.get_body_data()
    if not body then
        if ngx.req.get_body_file() then
            return nil, "request body did not fit into client body buffer, consider raising 'client_body_buffer_size'"
        else
            return ""
        end
    end
    local downloadinfo = json.decode(body)
    if downloadinfo ~=nil then
       if downloadinfo.ebookid ==nil then
           ngx.say("please pass ebook id ")
           return 
       end
       if downloadinfo.username == nil or  downloadinfo.password == nil then
           ngx.say("must provide  user account info ")
           return 
       end
    end
    local execommand = exec_shell(downloadinfo.ebookid,"/opt/ebooks/",downloadinfo.username,downloadinfo.password)
    local timeout = 300000  -- ms
    local max_size = 409600  -- byte
    local ok, stdout, stderr, reason, status =
        shell.run(execommand, nil, timeout, max_size)
    if not ok then
        return  stderr
    end
    ngx.say(stdout..reason..status)
end

return init;