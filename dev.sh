#!/usr/bin/env bash
nvim --clean '+set rnu nu rtp+=.' '+lua require("kak").setup()' $@
