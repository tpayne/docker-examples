# This is a simple makefile to help drive the docker process. It is added for convinence

.SUFFIXES:	.img .docker

# This is clunky but overcomes some issues with standard lc...
lc = $(subst A,a,$(subst B,b,$(subst C,c,$(subst D,d,$(subst E,e,$(subst F,f,$(subst G,g,$(subst H,h,$(subst I,i,$(subst J,j,$(subst K,k,$(subst L,l,$(subst M,m,$(subst N,n,$(subst O,o,$(subst P,p,$(subst Q,q,$(subst R,r,$(subst S,s,$(subst T,t,$(subst U,u,$(subst V,v,$(subst W,w,$(subst X,x,$(subst Y,y,$(subst Z,z,$1))))))))))))))))))))))))))

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

# Dummy files only...
%.img : %.docker
	docker build . -f $< -t $(call lc,$@)
	@touch $@