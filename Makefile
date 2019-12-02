PACKAGE_DIRS := $(wildcard packages/*)
PACKAGES := $(notdir ${PACKAGE_DIRS})
PACKAGE_XENIAL_TESTS := $(PACKAGES:%=test-xenial-%)
PACKAGE_BIONIC_TESTS := $(PACKAGES:%=test-bionic-%)
R_VERSION := 3.5.3

docker-build-%:
	docker build -t spd:$* --build-arg R_VERSION=$(R_VERSION) -f Dockerfile.$* .

test-xenial-%: docker-build-xenial
	docker run --rm --name spd-xenial-$* -v $(CURDIR):/shinyapps spd:xenial /shinyapps/test $*

test-all-xenial: $(PACKAGE_XENIAL_TESTS)

test-bionic-%: docker-build-bionic
	docker run --rm --name spd-bionic-$* -v $(CURDIR):/shinyapps spd:bionic /shinyapps/test $*

test-all-bionic: $(PACKAGE_BIONIC_TESTS)

test-all: test-all-bionic test-all-xenial

.PHONY: test-all-xenial test-all-bionic
