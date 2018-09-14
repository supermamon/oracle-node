
.DEFAULT_GOAL := all

all: build release clean

clean: 
	@./clean-all
	@rm Dockerfile

build: 
	@./build-all

release:
	@./release-all