PACKAGES := $(wildcard packages/*)
PACKAGE_TESTS := $(PACKAGES:%=test-%)

test-%:
	docker run --name shinyapps-package-dependencies -v $(CURDIR):/shinyapps --rm cbarraford/r3x:latest /shinyapps/test $*

all-test: ${PACKAGE_TESTS}

