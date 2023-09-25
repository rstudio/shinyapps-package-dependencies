PACKAGE_DIRS := $(wildcard packages/*)
PACKAGES := $(notdir ${PACKAGE_DIRS})
PACKAGE_TESTS := $(PACKAGES:%=test-%)
R_VERSION := 4.3.1

# Docker image is built on Docker Hub https://hub.docker.com/repository/docker/rstudio/shinyapps-package-dependencies/
docker-build-%:
	docker build -t rstudio/shinyapps-package-dependencies:$* --build-arg R_VERSION=$(R_VERSION) -f Dockerfile.$* .

test-focal-%:
	docker run --rm --name spd-focal-$* -v $(CURDIR):/shinyapps rstudio/shinyapps-package-dependencies:focal /shinyapps/test $*

test-all-focal:
	docker run --rm --name spd-focal -v $(CURDIR):/shinyapps rstudio/shinyapps-package-dependencies:focal /shinyapps/test

test-jammy-%:
	docker run --rm --name spd-jammy-$* -v $(CURDIR):/shinyapps rstudio/shinyapps-package-dependencies:jammy /shinyapps/test $*

test-all-jammy:
	docker run --rm --name spd-jammy -v $(CURDIR):/shinyapps rstudio/shinyapps-package-dependencies:jammy /shinyapps/test


test-all: test-all-focal test-all-jammy

.PHONY: test-all-focal test-all-jammy
