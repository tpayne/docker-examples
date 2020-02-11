Docker Examples
===============

This repo contains various examples of Docker files that have been created to help people get started with Docker and
Kubernetes.

Status
------
````
Docker Example Status: Ready for use
Kubernetes Example Status: TBD
````

Docker Examples
===============
The examples contained in this repo run on various flavours of Linux. The examples are driven by a set of simple makefiles.

Pre-requisites
--------------
Before running these examples you will need to have installed `GNUMake` or other Make and `Docker`.

Downloading the Repo
--------------------
First download the repo using git

	% git clone https://github.com/tpayne/docker-examples.git
	% cd docker-examples

Running the Demos
-----------------
To run the examples simply do the following

	% cd samples; gmake 
  
This will build all the examples.

To clean up, simply repeat with the clean target

	% cd samples; gmake clean
  
The examples will run various Dockerfiles building containers for `Centos`, `OpenSuse` and `Busybox`.

More examples will be added at a later date.
