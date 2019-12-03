PACKAGE_DIRS := $(wildcard packages/*)
PACKAGES := $(notdir ${PACKAGE_DIRS})
PACKAGE_TESTS := $(PACKAGES:%=test-%)
R_VERSION := 3.5.3

# Docker image is built on Docker Hub https://hub.docker.com/repository/docker/rstudio/shinyapps-package-dependencies/
docker-build-%:
	docker build -t rstudio/shinyapps-package-dependencies:$* --build-arg R_VERSION=$(R_VERSION) -f Dockerfile.$* .

test-xenial-%:
	docker run --rm --name spd-xenial-$* -v $(CURDIR):/shinyapps rstudio/shinyapps-package-dependencies:xenial /shinyapps/test $*

test-all-xenial:
	docker run --rm --name spd-xenial -v $(CURDIR):/shinyapps rstudio/shinyapps-package-dependencies:xenial /shinyapps/test

test-bionic-%:
	docker run --rm --name spd-bionic-$* -v $(CURDIR):/shinyapps rstudio/shinyapps-package-dependencies:bionic /shinyapps/test $*

test-all-bionic:
	docker run --rm --name spd-bionic -v $(CURDIR):/shinyapps rstudio/shinyapps-package-dependencies:bionic /shinyapps/test

test-all: test-all-bionic test-all-xenial

.PHONY: test-all-xenial test-all-bionic
