PACKAGE_DIRS := $(wildcard packages/*)
PACKAGES := $(notdir ${PACKAGE_DIRS})
PACKAGE_TESTS := $(PACKAGES:%=test-%)
R_VERSION := 4.0.4

# Docker image is built on Docker Hub https://hub.docker.com/repository/docker/rstudio/shinyapps-package-dependencies/
docker-build-%:
	docker build -t rstudio/shinyapps-package-dependencies:$* --build-arg R_VERSION=$(R_VERSION) -f Dockerfile.$* .

test-xenial-%:
	docker run --rm --name spd-xenial-$* -v $(CURDIR):/shinyapps rstudio/shinyapps-package-dependencies:xenial /shinyapps/test $*

test-all-xenial:
	docker run --rm --name spd-xenial -v $(CURDIR):/shinyapps rstudio/shinyapps-package-dependencies:xenial /shinyapps/test

test-focal-%:
	docker run --rm --name spd-focal-$* -v $(CURDIR):/shinyapps rstudio/shinyapps-package-dependencies:focal /shinyapps/test $*

test-all-focal:
	docker run --rm --name spd-focal -v $(CURDIR):/shinyapps rstudio/shinyapps-package-dependencies:focal /shinyapps/test

test-all: test-all-focal test-all-xenial

.PHONY: test-all-focal test-all-xenial
