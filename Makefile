SHELL := /bin/bash
.DEFAULT_GOAL := help

.PHONY: help install-manjaro-apps install-manjaro-p10k

help: ## Show this help message
	@echo 'Usage: make [target]'
	@echo ''
	@echo 'Targets:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-25s\033[0m %s\n", $$1, $$2}'

install-manjaro-apps: ## Install all manjaro apps
	bash scripts/install_manjaro_apps.sh
	$(MAKE) install-manjaro-p10k

install-manjaro-p10k: ## Install p10k zsh
	bash scripts/install_p10k.sh

