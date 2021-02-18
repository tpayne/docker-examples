# Sample commands for building the project dir and saving to a repo...
docker build . -f ApacheServer.docker -t apache_server:1.0

# Push to a GCP repo...
export PROJECT=$(gcloud info --format='value(config.project)')

docker tag apache_server:1.0 gcr.io/${PROJECT}/apache_server:1.0
docker push gcr.io/${PROJECT}/apache_server:1.0