REPO := hostname
BASE_TAG := latest
IMAGE_NAME := $(REPO):$(BASE_TAG)

patch:
	docker image build --build-arg=BASE_TAG=$(BASE_TAG) -t $(IMAGE_NAME) .
