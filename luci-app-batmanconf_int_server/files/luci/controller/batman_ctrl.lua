module("luci.controller.batman_ctrl", package.seeall)
function index()
	entry({"admin", "network", "batman"}, cbi("batman_cbi"), _("BATMAN"), 100)
	end

