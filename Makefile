APP_NAME   := hostname
BASE_TAG   := latest
IMAGE_NAME := $(APP_NAME):$(BASE_TAG)

patch:
	docker image build --build-arg=BASE_TAG=$(BASE_TAG) -t $(IMAGE_NAME) .
