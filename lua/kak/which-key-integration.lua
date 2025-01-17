local function text_objects()
  local wk_text_objects = require("which-key.plugins.presets").text_objects
  table.insert(wk_text_objects.mode, "n")

  for _, keybind in ipairs(wk_text_objects) do
    local keybind_str = keybind[1]
    if string.len(keybind_str) == 1 then
      keybind[1] = "<A-" .. keybind_str .. ">"
    else
      keybind[1] = "<A-" .. string.sub(keybind_str, 1, 1) .. ">" .. string.sub(keybind_str, 2)
    end
  end
end

text_objects()
