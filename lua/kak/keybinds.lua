local M = {}

local utils = require("kak.utils")

function M.setup(opts)
  local opts = opts or {}

  if opts.full then
    local movement = { "h", "j", "k", "l" }
    local word = { "w", "e", "b" }
    local ft = { "f", "t" }

    for _, key in ipairs(vim.list_extend(movement, word)) do
      local upper_key = string.upper(key)

      utils.keymap.set(upper_key, key, { post_first_str_extra_str = "v" })
      utils.keymap.set(upper_key, key, { mode = "x" })
    end

    for _, key in ipairs(movement) do
      local upper_key = string.upper(key)

      utils.keymap.set(key, key, { mode = "x", post_first_str_extra_str = utils.keycode("<Esc>") })
      utils.keymap.set(upper_key, key, { post_first_str_extra_str = "v" })
    end

    for _, key in ipairs(word) do
      utils.keymap.set(key, key, { pre_count = true, pre_key_str = "v" })
      utils.keymap.set(key, key, {
        mode = "x",
        pre_count = true,
        post_first_str_extra_str = utils.keycode("<Esc>"),
        pre_key_str = "v",
      })

      local wrapped_key = "<A-" .. key .. ">"
      local upper_key = string.upper(key)
      utils.keymap.set(wrapped_key, upper_key, { pre_count = true, pre_key_str = "v" })
      utils.keymap.set(wrapped_key, upper_key, {
        mode = "x",
        post_first_str_extra_str = utils.keycode("<Esc>"),
        pre_count = true,
        pre_key_str = "v",
      })
    end

    for _, key in ipairs(ft) do
      utils.keymap.set(key, key, { pre_count = true, pre_key_str = "v", getcharstr = true })
      utils.keymap.set(key, key, {
        post_first_str_extra_str = utils.keycode("<Esc>"),
        pre_key_str = "v",
        pre_count = true,
        mode = "x",
        getcharstr = true,
      })

      local upper_key = string.upper(key)

      utils.keymap.set(upper_key, key, { post_first_str_extra_str = "v", getcharstr = true })
      utils.keymap.set(upper_key, key, { mode = "x", getcharstr = true })

      local key_wrapped = "<A-" .. key .. ">"
      utils.keymap.set(key_wrapped, upper_key, { post_first_str_extra_str = "v", getcharstr = true })
      utils.keymap.set(key_wrapped, upper_key, { mode = "x", getcharstr = true })
    end

    utils.keymap.set("<A-h>", "v0", { countable = false })
    utils.keymap.set("<A-h>", "0", { mode = "x", countable = false })
    utils.keymap.set("<A-l>", "v$", { countable = false })
    utils.keymap.set("<A-l>", "$", { mode = "x", countable = false })
    utils.keymap.set("gh", "0", { countable = false })
    utils.keymap.set("gh", utils.keycode("<Esc>") .. "0", { mode = "x", countable = false })
    utils.keymap.set("gl", "$", { countable = false })
    utils.keymap.set("gl", utils.keycode("<Esc>") .. "$", { mode = "x", countable = false })
    utils.keymap.set("ge", "G$", { countable = false })
    utils.keymap.set("ge", "G$", { mode = "x", countable = false })
    utils.keymap.set("gj", "G", { countable = false })
    utils.keymap.set("gj", "G", { mode = "x", countable = false })
    utils.keymap.set("gg", "gg0", { countable = false })
    utils.keymap.set("gg", "gg0", { mode = "x", countable = false })
    utils.keymap.set("gk", "gg", { countable = false })
    utils.keymap.set("gk", "gg", { mode = "x", countable = false })

    utils.keymap.set("<A-j>", "J", { mode = { "n", "v" }, opts = { desc = "Join lines" } })

    utils.keymap.set("gt", "H", { countable = false })
    utils.keymap.set("gc", "M", { countable = false })
    utils.keymap.set("gb", "L", { countable = false })

    utils.keymap.set(
      "p",
      "p",
      { mode = "x", post_first_str_extra_str = utils.keycode("<Esc>") .. "`>", pre_count = true }
    )
    utils.keymap.set("P", "P", {
      mode = "x",
      post_first_str_extra_str = utils.keycode("<Esc>") .. "`<",
      pre_count = true,
      second_resulting_key = "p",
    })
    utils.keymap.set("R", "p", { mode = "x" })
    utils.keymap.set("R", "p", { post_first_str_extra_str = "v" })

    for _, key in ipairs({ "i", "a" }) do
      local wrapped_key = "<A-" .. key .. ">"
      local rhs = "v" .. key
      local v_rhs = utils.keycode("<Esc>") .. rhs
      vim.keymap.set("n", wrapped_key, rhs)
      vim.keymap.set("x", wrapped_key, v_rhs)

      if opts.experimental.rebind_visual_aiAI then
        utils.keymap.set(wrapped_key, v_rhs, { count = false, getcharstr = true, mode = "x" })
        vim.keymap.set("n", wrapped_key, "v" .. wrapped_key)

        local upper_key = string.upper(key)
        vim.keymap.set("x", upper_key, "<Esc>" .. upper_key)
      end
    end
  end
  if opts.experimental.rebind_visual_aiAI then
    vim.keymap.set("x", "i", "<Esc>`<i")
    vim.keymap.set("x", "a", "<Esc>`>a")
  end

  for _, key in ipairs({ "d", "c", "y" }) do
    vim.keymap.set({ "n" }, key, "v" .. key)
  end
  vim.keymap.set({ "n", "x" }, "x", "V")
  --vim.keymap.set({ "n", "x" }, "%", "gg<Esc>VG")
end

return M
