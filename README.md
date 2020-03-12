Docker/Kubernetes Examples Repo
===============================

This repo contains various examples of Docker files that have been created to help people get started with Docker and
Kubernetes.

Status
------
````
Docker Example Status: Ready for use
Kubernetes Example Status: Ready for use
````

Build CI/Testing Status
-----------------------
This repo is automatically verified with the `Travis-CI` build system. If you want to see an example of a build,
click on the button below.

[![Build Status](https://travis-ci.org/tpayne/docker-examples.svg?branch=master)](https://travis-ci.org/tpayne/docker-examples)


Kubernetes Examples
===================
The examples contained in this repo run on GCP and standard Kubernetes. They are sequences of `kubectl` commands
that show what Kubernetes can do. 

They can be found in the `samples/kubernetes` directory. You will need to install or have access to a Kubernetes 
or GKE system to run them. They also rely on the Docker images having been created.

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
To run the examples simply do the following...

	% cd samples; gmake 
  
This will build all the examples.

To clean up, simply repeat with the clean target

	% cd samples; gmake clean
  
The examples will run various Dockerfiles building containers for `Centos`, `OpenSuse` and `Busybox`.

More examples will be added at a later date.

So, what next?
--------------
To show and run the containers you have just created, you can use the following commands...

	% docker images
    REPOSITORY                TAG                 IMAGE ID            CREATED              SIZE
    dockerfilesuse.img        latest              8eb7d429b10c        1 second ago         316MB
    dockerfilepostgres.img    latest              78471a1dc2ff        About a minute ago   486MB
    dockerfileminecraft.img   latest              e3aaa6b77dae        2 minutes ago        487MB
    dockerfilemediawiki.img   latest              592aade42d4b        3 minutes ago        2.2GB
    dockerfilejenkins.img     latest              412a063b5b4e        14 minutes ago       876MB
    dockerfilemongodb.img     latest              2c9bf248cced        16 minutes ago       981MB
    dockerfilewebserver.img   latest              4523f5f7003f        17 minutes ago       154MB
    dockerfileubuntu.img      latest              9dd9893c98e2        18 minutes ago       476MB
    dockerfilebasic.img       latest              ccd0b50f1482        19 minutes ago       387MB
    dockerfiledevenvadv.img   latest              a010f42e17a4        19 minutes ago       1.21GB
    dockerfiledevenv.img      latest              53b4edc3db85        20 minutes ago       1.17GB
    dockerfilesimple.img      latest              cf3afa09e1a4        22 minutes ago       1.22MB
    ubuntu                    latest              72300a873c2c        7 days ago           64.2MB
    opensuse/leap             latest              38924343a351        2 weeks ago          103MB
    centos                    latest              470671670cac        6 weeks ago          237MB
    busybox                   latest              6d5fcfe5ff17        2 months ago         1.22MB

The `docker images` command lists all the images you have created. You can then run them via the `docker run` command
as shown in the example below...

	% docker run -i -t dockerfiledevenv.img 
	[root@21b717998a7c /]# df -H
	Filesystem      Size  Used Avail Use% Mounted on
	overlay          63G  5.6G   54G  10% /
	tmpfs            68M     0   68M   0% /dev
	tmpfs           1.1G     0  1.1G   0% /sys/fs/cgroup
	/dev/sda1        63G  5.6G   54G  10% /etc/hosts
	shm              68M     0   68M   0% /dev/shm
	tmpfs           1.1G     0  1.1G   0% /proc/acpi
	tmpfs           1.1G     0  1.1G   0% /sys/firmware
	[root@21b717998a7c /]# gcc --version
	gcc (GCC) 8.3.1 20190507 (Red Hat 8.3.1-4)
	Copyright (C) 2018 Free Software Foundation, Inc.
	This is free software; see the source for copying conditions.  There is NO
	warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
	
	[root@21b717998a7c /]# lscpu
	Architecture:        x86_64
	CPU op-mode(s):      32-bit, 64-bit
	Byte Order:          Little Endian
	CPU(s):              4
	On-line CPU(s) list: 0-3
	Thread(s) per core:  1
	Core(s) per socket:  1
	Socket(s):           4
	Vendor ID:           GenuineIntel
	CPU family:          6
	Model:               58
	Model name:          Intel(R) Core(TM) i7-3840QM CPU @ 2.80GHz
	Stepping:            9
	CPU MHz:             2791.549
	BogoMIPS:            5583.09
	L1d cache:           32K
	L1i cache:           32K
	L2 cache:            256K
	L3 cache:            8192K
	[root@21b717998a7c /]# exit 

Replace `dockerfiledevenv.img` with the container name you wish to use.

Docker Files
------------
The following table contains the file descriptions.

>| Docker File | Description | 
>| ----------- | ----------- |
>| `busybox/DockerFileSimple.docker` | Docker file to setup a Busybox container and run some commands on it |
>| `centos/DockerFileBasic.docker` | Docker file to setup a Centos container and install some packages on it |
>| `centos/DockerFileDevEnv.docker` | Docker file to setup a Centos container and install a dev environment on it |
>| `centos/DockerFileDevEnvAdv.docker` | Docker file to setup a Centos container, install a dev environment on it, then create some users plus groups |
>| `opensuse/DockerFileSuse.docker` | Docker file to setup an OpenSUSE container and install some packages on it |
>| `ubuntu/DockerFileJenkins.docker` | Docker file to setup an Ubuntu container and a Jenkins CI server in it |
>| `ubuntu/DockerFileKubernetes.docker` | Docker file to setup an Ubuntu container and Docker/Kubernetes into it |
>| `ubuntu/DockerFileMediaWiki.docker` | Docker file to setup an Ubuntu container and a MediaWiki server in it |
>| `ubuntu/DockerFileMinecraft.docker` | Docker file to setup an Ubuntu container and a Minecraft server in it |
>| `ubuntu/DockerFileMongoDB.docker` | Docker file to setup an Ubuntu container and a Mongo NoSQL DB server in it |
>| `ubuntu/DockerFilePostgres.docker` | Docker file to setup an Ubuntu container and a PostgreSQL DB server in it |
>| `ubuntu/DockerFileUbuntu.docker` | Docker file to setup an Ubuntu container and install some packages on it |
>| `ubuntu/DockerFileWebServer.docker` | Docker file to setup an Ubuntu container and a webserver in it |

Liability Warning
=================
The contents of this repository (documents and examples) are provided “as-is” with no warrantee implied 
or otherwise about the accuracy or functionality of the examples.

You use them at your own risk. If anything results to your machine or environment or anything else as a 
result of ignoring this warning, then the fault is yours only and has nothing to do with me.

Licensing
=========
This software is licensed using the terms and provisions of the [MIT license](https://en.wikipedia.org/wiki/MIT_License).

Google packages are release under their licensing - Apache 2.0
