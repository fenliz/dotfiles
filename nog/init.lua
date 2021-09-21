nog.config.work_mode = false
nog.config.display_app_bar = false
nog.config.launch_on_startup = true
nog.config.multi_monitor = true
nog.config.remove_task_bar = false

local workspaces = { 1, 2, 3, 4, 5, 6, 7, 8, 9 }

nog.config.workspaces = {
  [1] = { text = " Code " },
  [2] = { text = " Browser " },
  [3] = { text = " Misc " }
}

nog.config.rules = {
  ["explorer.exe"] = { action = "ignore" },
  ["taskmgr.exe"] = { action = "ignore" },
  ["snippingtool.exe"] = { action = "ignore" },

  ["firefox.exe"] = { has_custom_titlebar = true, firefox = true },
  ["edge.exe"] = { has_custom_titlebar = true, chromium = true },
  ["chrome.exe"] = { has_custom_titlebar = true, chromium = true },

  ["discord.exe"] = { has_custom_titlebar = true },
  ["spotify.exe"] = { has_custom_titlebar = true },
  ["code.exe"] = { has_custom_titlebar = true },
}

nog.nbind("alt+i", nog.win_ignore)
nog.nbind("alt+q", nog.win_close)
nog.nbind("alt+m", nog.win_minimize)

-- Window movement
nog.nbind("alt+l", function() nog.ws_focus("Right") end)
nog.nbind("alt+k", function() nog.ws_focus("Up") end)
nog.nbind("alt+j", function() nog.ws_focus("Down") end)
nog.nbind("alt+h", function() nog.ws_focus("Left") end)

nog.nbind("alt+control+l", function() nog.ws_swap("Right") end)
nog.nbind("alt+control+k", function() nog.ws_swap("Up") end)
nog.nbind("alt+control+j", function() nog.ws_swap("Down") end)
nog.nbind("alt+control+h", function() nog.ws_swap("Left") end)

nog.nbind("alt+plus", function() nog.ws_set_split_direction("Vertical") end)
nog.nbind("alt+minus", function() nog.ws_set_split_direction("Horizontal") end)

nog.nbind("alt+control+f", nog.win_toggle_floating)
nog.gbind("alt+control+w", nog.toggle_work_mode)
nog.nbind("alt+f", nog.ws_toggle_fullscreen)

nog.nbind_tbl("alt+shift", nog.win_move_to_ws, workspaces)
nog.nbind_tbl("alt+control", nog.ws_move_to_monitor, workspaces)
nog.nbind_tbl("alt", nog.ws_change, workspaces)
