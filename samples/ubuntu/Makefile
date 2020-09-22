# This is a simple makefile to help drive the docker process. It is added for convinence
include ../rules/rules.mk

all: build         
	  @echo Built images

# Docker images to build...
DOCKERFILES=\
	DockerFileJenkins.img \
	DockerFileGcpAnsible.img \
	DockerFileKubernetes.img \
	DockerFileMediaWiki.img \
	DockerFileMinecraft.img \
	DockerFileMongoDB.img \
	DockerFilePostgres.img \
	DockerFileUbuntu.img \
	DockerFileWebServer.img

build: $(DOCKERFILES)
	@echo Creating images...         

clean:         
	@echo Cleaning up images...
	@-rm $(DOCKERFILES)
	@$(foreach i,$(DOCKERFILES),docker rmi -f $(call lc,$(i));)
