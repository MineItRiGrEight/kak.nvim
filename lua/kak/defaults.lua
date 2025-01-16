return {
  full = true,                  -- if set to false, it disables all keybinds except Normal mode c, d, x and y
  which_key_integration = true, -- which-key text objects integration

  experimental = {              -- # experimental features
    rebind_visual_aiAI = false, -- if set to true, rebinds Visual mode `[aiAI]` keybinds to act like they do in Normal mode,
  }                             -- except that `[ai]` goes to the corresponding end of the selection. however, this
}                               -- makes it so you can only use the default keybinds with `<A-[ai]>`
