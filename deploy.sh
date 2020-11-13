docker build -t vladbronfman/multi-client:latest -t vladbronfman/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t vladbronfman/multi-server:latest -t vladbronfman/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t vladbronfman/multi-worker:latest -t vladbronfman/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push vladbronfman/multi-client
docker push vladbronfman/multi-server
docker push vladbronfman/multi-worker

docker push vladbronfman/multi-client:$SHA
docker push vladbronfman/multi-server:$SHA
docker push vladbronfman/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployment/server-deployment server=vladbronfman/multi-server:$SHA
kubectl set image deployment/client-deployment client=vladbronfman/multi-client:$SHA
kubectl set image deployment/worker-deployment worker=vladbronfman/multi-worker:$SHA
