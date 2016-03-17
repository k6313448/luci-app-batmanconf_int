require("luci.sys")
m = Map("batman_conf", translate("BATMAN"),translate("Configure BATMAN"))

s = m:section(TypedSection, "bat_conf_1", "")
s.addremove=false
s.anonymous=true

essid = s:option(Value, "essid", translate("ESSID"))
ap = s:option(Value, "ap", translate("AP"))
channel = s:option(Value, "channel", translate("Channel"))

local apply = luci.http.formvalue("cbi.apply")
if apply then
        io.popen("/etc/init.d/batman_ini restart")
end

return m