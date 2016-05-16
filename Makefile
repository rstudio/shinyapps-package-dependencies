PACKAGE_DIRS := $(wildcard packages/*)
PACKAGES := $(notdir ${PACKAGE_DIRS})
PACKAGE_TESTS := $(PACKAGES:%=test-%)
DOCKER_IMAGE ?= "cbarraford/r3x:latest"

test-%:
	docker run --name shinyapps-package-dependencies -v $(CURDIR):/shinyapps --rm $(DOCKER_IMAGE) /shinyapps/test $*

all:
	docker run --name shinyapps-package-dependencies -v $(CURDIR):/shinyapps --rm $(DOCKER_IMAGE) /shinyapps/test
