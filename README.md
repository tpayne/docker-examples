# docker-examples
Example Docker and Kubernetes scripts 

Docker Examples
===============

This repo contains various examples of Docker files that have been created to help people get started with Docker and
Kubernetes.

Status
------
````
Example Status: Ready for use
````

Docker Examples
===============
The examples contained in this repo run on various flavours of Linux. The examples are driven by a set of simple makefile.

To run the examples simply do the following

	% cd samples; make 
  
This will build all the examples.

To clean up, simply repeat with the clean target

	% cd samples; make clean
  
The examples will run various Dockerfiles building containers for centos, opensuse and busybox.
