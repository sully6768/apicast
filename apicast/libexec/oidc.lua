pcall(require, 'luarocks.loader')
package.path = package.path .. ";./src/?.lua"

local oidc = require 'oauth.oidc'
local cjson = require 'cjson'

local config = oidc.load_configuration()

if config then
  ngx.say(cjson.encode(config))
else
  io.stderr:write('failed to download OIDC configuration\n')
  os.exit(1)
end
