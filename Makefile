PACKAGE_DIRS := $(wildcard packages/*)
PACKAGES := $(notdir ${PACKAGE_DIRS})
PACKAGE_TESTS := $(PACKAGES:%=test-%)

test-%:
	docker run --name shinyapps-package-dependencies -v $(CURDIR):/shinyapps --rm cbarraford/r3x:latest /shinyapps/test $*

all: ${PACKAGE_TESTS}

