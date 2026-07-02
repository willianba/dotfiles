-- See https://wiki.hypr.land/Configuring/Environment-variables/
hl.env("XCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("HYPRCURSOR_SIZE", "24")

-- Dark mode
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("GTK_USE_PORTAL", "1")

-- Gaming stuff
hl.env("PROTON_USE_OPTISCALER", "1")
hl.env("PROTON_FSR4_UPGRADE", "1")
hl.env("PROTON_FSR4_RDNA3_UPGRADE", "1")
hl.env("PROTON_XESS_UPGRADE", "1")
hl.env("PROTON_NO_WM_DECORATION", "1")
hl.env("PROTON_ENABLE_WAYLAND", "1") -- Experimental, may use only if needed
hl.env("PROTON_USE_NTSYNC", "1") -- Experimental
hl.env("RADV_PERFTEST", "aco")
hl.env("MESA_GLTHREAD", "true")
hl.env("ENABLE_LAYER_MESA_ANTI_LAG", "true")
hl.env("MANGOHUD", "1")
hl.env("LSFG_DLL_PATH", "/mnt/games/SteamLibrary/steamapps/common/Lossless Scaling/Lossless.dll")
