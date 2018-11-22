
IMAGE=tkngue/supporterz-colab-golang:latest
NAME=golang

all: build run

build:
	docker build -t $(IMAGE) .

run:
	docker run -it -d --rm -p 8080 --name $(NAME) $(IMAGE)

kill:
	docker kill $(NAME)
