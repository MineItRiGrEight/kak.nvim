#!/usr/bin/env bash
nvim --clean '+set rnu nu rtp+=.' '+lua require("kak").setup({ experimental = { rebind_visual_aiAI = true } })' $@
