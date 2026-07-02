-- See https://wiki.hypr.land/Configuring/Monitors/
hl.monitor({
	output = "DP-2",
	mode = "1920x1080@144",
	position = "0x0",
	scale = 1,
})

hl.monitor({
	output = "HDMI-A-1",
	mode = "preferred",
	scale = 1,
	position = "1920x0",
	transform = 1,
})

local workspaceMonitors = {
	"DP-2",
	"DP-2",
	"DP-2",
	"DP-2",
	"DP-2",
	"DP-2",
	"DP-2",
	"HDMI-A-1",
	"HDMI-A-1",
	"HDMI-A-1",
}

for workspace, monitor in ipairs(workspaceMonitors) do
	hl.workspace_rule({
		workspace = tostring(workspace),
		monitor = monitor,
		persistent = true,
	})
end
