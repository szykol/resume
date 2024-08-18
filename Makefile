TAG ?= latest
TARGET_PLATFORM ?= linux/amd64
REPOSITORY ?= szyko7/xelatex
PWD = $(shell pwd)
RESUME ?= resume.tex

build-resume:
	docker run --rm -v ${PWD}:/data szykol/xelatex xelatex ${RESUME}

build:
	docker build . --platform=${TARGET_PLATFORM} -t ${REPOSITORY}:${TAG}

push: build
	docker push ${REPOSITORY}:${TAG}
