DOCKER=docker
FLAGS=
MOUNT_OPTION=
# uncomment the following lines to use podman instead of docker
# DOCKER=podman
# FLAGS=--userns=keep-id
# MOUNT_OPTION=:Z

.PHONY: serve build default build-image deploy

default: buildimage serve

buildimage:
	$(DOCKER) build -t openhsr/www.open-ost.ch docker/
	$(DOCKER) run -i -t --rm --name www.open-ost.ch -v $(shell pwd):/src/$(MOUNT_OPTION) -p 4000:4000 $(FLAGS) openhsr/www.open-ost.ch bundle install --clean

build:
	$(DOCKER) run -i -t --rm --name www.open-ost.ch -v $(shell pwd):/src/$(MOUNT_OPTION) -p 4000:4000 $(FLAGS) openhsr/www.open-ost.ch bundle exec jekyll build

enter:
	$(DOCKER) run -i -t --rm --name www.open-ost.ch -v $(shell pwd):/src/$(MOUNT_OPTION) -p 4000:4000 $(FLAGS) openhsr/www.open-ost.ch bash

serve:
	$(DOCKER) run -i -t --rm --name www.open-ost.ch -v $(shell pwd):/src/$(MOUNT_OPTION) -p 4000:4000 $(FLAGS) openhsr/www.open-ost.ch bundle exec jekyll serve

updatedeps:
	$(DOCKER) run -i --rm --name www.open-ost.ch -v $(shell pwd):/src/$(MOUNT_OPTION) -p 4000:4000 $(FLAGS) openhsr/www.open-ost.ch bundle update
