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

Docker Files
------------
The following table contains the file descriptions.

>| Docker File | Description | 
>| ----------- | ----------- |
>| `busybox/DockerFileSimple.docker` | Docker file to setup Busybox container and run some commands on it |
>| `centos/DockerFileBasic.docker` | Docker file to setup Centos container and install some packages on it |
>| `centos/DockerFileDevEnv.docker` | Docker file to setup Centos container and install dev environment on it |
>| `opensuse/DockerFileSuse.docker` | Docker file to setup OpenSUSE container and install some packages on it |

Liability Warning
=================
The contents of this repository (documents and examples) are provided “as-is” with no warrantee implied 
or otherwise about the accuracy or functionality of the examples.

You use them at your own risk. If anything results to your machine or environment or anything else as a 
result of ignoring this warning, then the fault is yours only and has nothing to do with me.

Licensing
=========
This software is licensed using the terms and provisions of the [MIT license](https://en.wikipedia.org/wiki/MIT_License).
