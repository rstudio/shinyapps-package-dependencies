PACKAGE_DIRS := $(wildcard packages/*)
PACKAGES := $(notdir ${PACKAGE_DIRS})
PACKAGE_TESTS := $(PACKAGES:%=test-%)
TRUSTY_DOCKER_IMAGE ?= "rstudio/docker-r:trusty-3.4.2"
XENIAL_DOCKER_IMAGE ?= "rstudio/docker-r:xenial-3.4.2"

test-trusty-%:
	docker run --name shinyapps-package-dependencies -v $(CURDIR):/shinyapps --rm $(TRUSTY_DOCKER_IMAGE) /shinyapps/test $*

test-xenial-%:
	docker run --name shinyapps-package-dependencies -v $(CURDIR):/shinyapps --rm $(XENIAL_DOCKER_IMAGE) /shinyapps/test $*

test-all-trusty:
	docker run --name shinyapps-package-dependencies -v $(CURDIR):/shinyapps --rm $(TRUSTY_DOCKER_IMAGE) /shinyapps/test

test-all-xenial:
	docker run --name shinyapps-package-dependencies -v $(CURDIR):/shinyapps --rm $(XENIAL_DOCKER_IMAGE) /shinyapps/test

test-all: test-all-trusty test-all-xenial
