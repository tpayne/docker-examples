# Sample commands for building the project dir and saving to a repo...
docker build . -f ApacheServer.docker -t apache_server:1.0

# Push to a GCP repo...
export PROJECT=$(gcloud info --format='value(config.project)')

docker tag apache_server:1.0 gcr.io/${PROJECT}/apache_server:latest
docker push gcr.io/${PROJECT}/apache_server:latest

docker images apache_server
docker run -d -p 8080:80 -it --rm --name myhttpserver apache_server:1.0
curl localhost:8080 | grep Wow
docker ps | grep apache_server:1.0 | gawk '{ printf("\ndocker stop %s",$1);}' | sh -xv
docker rmi -f apache_server:1.0
docker images apache_server

# Multistage build...
docker build . -f multistage-build.docker -t sample_multi:1.0
docker run -t sample_multi:1.0 /binary

# Cleanup...
docker system prune --all -f 
