#!/bin/bash

rm ~/.config/nvim/lua/plugins/*
rm ~/.config/nvim/lua/autocommands/*

cp nvim/init.lua ~/.config/nvim
cp -r nvim/lua/ ~/.config/nvim
