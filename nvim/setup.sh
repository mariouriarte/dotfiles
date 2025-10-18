#!/bin/bash

rm ~/.config/nvim/lua/plugins/*

cp nvim/init.lua ~/.config/nvim
cp -r nvim/lua/ ~/.config/nvim
