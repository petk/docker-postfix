.PHONY: test

help:
	@echo "\033[33mUsage:\033[0m\n  make [target] [arg=\"val\"...]\n\n\033[33mTargets:\033[0m"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[32m%-15s\033[0m %s\n", $$1, $$2}'

test: ## Run all tests; Usage: make test [t="<test-folder-1> <test-folder-2> ..."]
	cd tests; \
	./test-all

build: ## Build image; make build TAG="latest"
	docker build --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` --build-arg VCS_REF=`git rev-parse --short HEAD` --tag petk/postfix:$(TAG) --file Dockerfile .
