ruby = docker run --rm -it -v `pwd`:/usr/src/app -w /usr/src/app ruby:2.4

.PHONY: go build push

go: ## Jump to ruby container
	$(ruby) /bin/bash

build: ## Build gem file
	$(ruby) gem build capistrano-gitlab-artifact.gemspec

push: ## Push gem file into rubygems.org
	$(ruby) gem push capistrano-gitlab-artifact-0.0.2.gem