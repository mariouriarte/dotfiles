#!/bin/bash

help: ## Show makefile help message prod 1
	@echo 'usage: make [target]'
	@echo 'targets:'
	@grep -E '^(.+):\s##\s(.+)' ${MAKEFILE_LIST} | column -t -c 2 -s ':#'

install-manjaro-apps: ## Install all manjaro apps
	sh scripts/install_manjaro_apps.sh
	$(MAKE) install-manjaro-p10k

install-manjaro-p10k: ## Install p10k zsh
	sh scripts/install_p10k.sh

