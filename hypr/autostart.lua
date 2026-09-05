hl.on("hyprland.start", function()
  -- Speeds up app launch: export the session environment to systemd/D-Bus
  -- before user services start.
  hl.exec_cmd("systemctl --user import-environment $(env | cut -d'=' -f 1)")
  hl.exec_cmd("dbus-update-activation-environment --systemd --all")

  hl.exec_cmd("udiskie --automount --no-notify --no-tray")

  -- Notification daemon. Swap for dunst/swaync if you prefer.
  hl.exec_cmd("mako")
end)

-- Extra autostart processes.
-- hl.exec_cmd("my-service")
