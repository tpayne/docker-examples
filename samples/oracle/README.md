# Creating Oracle Docker Images

## Introduction
This README contains information on how to create an Oracle Docker image for Apple Mac M chipsets.

The information in this document is derived from a number of sources and has been validated as of 01/03/2025.

## Pre-canned Oracle Image
A precanned Oracle Docker image has already been created and is available at the Docker Hub [repo](https://hub.docker.com/repository/docker/tpayne666/oracle-database/general). However, due to licensing issues, it is a private repo and access is only granted on a request basis.

## How to create your own Oracle image?
To create your own Oracle image, please do the following...

* Clone the following [repo](https://github.com/oracle/docker-images.git) from Oracle
* Register with Oracle and download the file `LINUX.ARM64_1919000_db_home.zip` for "Oracle Database 19c for LINUX ARM (aarch64)" from their Oracle [download](https://www.oracle.com/database/technologies/oracle-database-software-downloads.html#license-lightbox) page
* You will need to agree with the Oracle licensing T&Cs
* Once you have downloaded the image, do the following

```bash
cd docker-images/OracleDatabase/SingleInstance/dockerfiles
cp ~/Downloads/LINUX.ARM64_1919000_db_home.zip 19.3.0/
./buildContainerImage.sh -v 19.3.0 -e
```

The Oracle should then be built.

## How to run the Oracle image?
To run the Oracle image, you can use the following command.

```bash
docker run --name oracle19c \
   -p 1521:1521 -p 5500:5500 \
   -e ORACLE_PDB=orcl -e ORACLE_PWD=password \
   -e INIT_SGA_SIZE=3000 -e INIT_PGA_SIZE=1000 \
   -v /opt/oracle/oradata \
   -d oracle/database:19.3.0-ee
```

You can monitor the startup of the image using a command like...

```bash
docker ps -f name=oracle19c
docker log -f <containerId>
```

or 

```bash
docker logs -f \
  $(docker ps -f name=oracle19c | \
    tail -n 1 | \
    awk '{print $1}')
```

The image will take a while to initially launch, but once it has you can then create an image from the running container with your specific requirements.

## Connecting to the Container
To connect to the running container, use a connection string similar to the following depending on the client that you are using.

```bash
sqlplus sys/password@localhost/orcl as sysdba
```

# Licensing
The Oracle image is based on the Oracle Enterprise Edition developer use only version and should only be used for DEVELOPMENT, non-commercial or production use. Please refer to Oracle licensing for their specific terms.
