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
	REPOSITORY                           TAG                 IMAGE ID            CREATED             SIZE
	dockerfilesuse.img                   latest              23209be3ae81        7 hours ago         296MB
	dockerfileubuntu.img                 latest              226c34824369        7 hours ago         425MB
	dockerfilebasic.img                  latest              bf1c974f5d3f        7 hours ago         386MB
	dockerfiledevenvadv.img              latest              3bfdcdd6de97        7 hours ago         1.21GB
	dockerfiledevenv.img                 latest              aee894f2d776        7 hours ago         1.17GB
	dockerfilesimple.img                 latest              ac814e1b0abb        8 hours ago         1.22MB
	<none>                               <none>              88f094ff69db        8 hours ago         92.1MB
	opensuse/leap                        latest              96c3b792ed50        6 days ago          103MB
	centos                               latest              470671670cac        3 weeks ago         237MB
	ubuntu                               latest              ccc6e87d482b        3 weeks ago         64.2MB
	busybox                              latest              6d5fcfe5ff17        6 weeks ago         1.22MB

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
>| `busybox/DockerFileSimple.docker` | Docker file to setup Busybox container and run some commands on it |
>| `centos/DockerFileBasic.docker` | Docker file to setup Centos container and install some packages on it |
>| `centos/DockerFileDevEnv.docker` | Docker file to setup Centos container and install a dev environment on it |
>| `centos/DockerFileDevEnvAdv.docker` | Docker file to setup Centos container, install a dev environment on it, then create some users plus groups |
>| `opensuse/DockerFileSuse.docker` | Docker file to setup OpenSUSE container and install some packages on it |
>| `ubuntu/DockerFileUbuntu.docker` | Docker file to setup Ubuntu container and install some packages on it |
>| `ubuntu/DockerFileWebServer.docker` | Docker file to setup Ubuntu container and a webserver on it |

Liability Warning
=================
The contents of this repository (documents and examples) are provided “as-is” with no warrantee implied 
or otherwise about the accuracy or functionality of the examples.

You use them at your own risk. If anything results to your machine or environment or anything else as a 
result of ignoring this warning, then the fault is yours only and has nothing to do with me.

Licensing
=========
This software is licensed using the terms and provisions of the [MIT license](https://en.wikipedia.org/wiki/MIT_License).
