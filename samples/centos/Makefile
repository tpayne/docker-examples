# This is a simple makefile to help drive the docker process. It is added for convinence
include ../rules/rules.mk

all: build         
	  @echo Built images

# Docker images to build...
DOCKERFILES=\
	DockerFileDevEnv.img \
	DockerFileDevEnvAdv.img \
	DockerFileBasic.img

build: $(DOCKERFILES)
	@echo Creating images...         

clean:         
	@echo Cleaning up images...
	@-rm $(DOCKERFILES)
	@$(foreach i,$(DOCKERFILES),docker rmi -f $(call lc,$(i));)
