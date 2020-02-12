# This is a simple makefile to help drive the docker process. It is added for convinence


.PHONY: build

all: build         
	  @echo Built images

# Docker images to build...
TARGETS=\
	busybox \
	centos \
	ubuntu \
	opensuse

build:
	@echo Creating images...         
	@$(foreach i,$(TARGETS),$(MAKE) -C $(i) all;)

clean:         
	@echo Cleaning up image files ONLY...
	@$(foreach i,$(TARGETS),$(MAKE) -C $(i) clean;)
