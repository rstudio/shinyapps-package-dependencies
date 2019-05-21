PACKAGE_DIRS := $(wildcard packages/*)
PACKAGES := $(notdir ${PACKAGE_DIRS})
PACKAGE_TESTS := $(PACKAGES:%=test-%)
R_VERSION := 3.5.3

docker-build-%:
	docker build -t spd:$* --build-arg R_VERSION=$(R_VERSION) -f Dockerfile.$* .

test-xenial-%: docker-build-xenial
	docker run --rm --name spd-xenial-$* -v $(CURDIR):/shinyapps spd:xenial /shinyapps/test $*

test-all-xenial: docker-build-xenial
	docker run --rm --name spd-xenial -v $(CURDIR):/shinyapps spd:xenial /shinyapps/test

test-bionic-%: docker-build-bionic
	docker run --rm --name spd-bionic-$* -v $(CURDIR):/shinyapps spd:bionic /shinyapps/test $*

test-all-bionic: docker-build-bionic
	docker run --rm --name spd-bionic -v $(CURDIR):/shinyapps spd:bionic /shinyapps/test

test-all: test-all-bionic test-all-xenial

.PHONY: test-all-xenial test-all-bionic
