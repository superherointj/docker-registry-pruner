docker build -t docker-registry-pruner .
docker tag docker-registry-pruner cr.smace.com.br/docker-registry-pruner
docker push cr.smace.com.br/docker-registry-pruner
