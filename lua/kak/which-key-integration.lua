local function text_objects()
  for _, keybind in ipairs(require("which-key.plugins.presets").text_objects) do
    local keybind_str = keybind[1]
    if string.len(keybind_str) == 1 then
      keybind[1] = "<A-" .. keybind_str .. ">"
    else
      vim.print(string.sub(keybind_str, 1, 1))
      keybind[1] = "<A-" .. string.sub(keybind_str, 1, 1) .. ">" .. string.sub(keybind_str, 2)
    end
  end
end

text_objects()
