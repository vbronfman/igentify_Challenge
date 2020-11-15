docker build -t vladbronfman/igentify_challenge_web:latest -t vladbronfman/igentify_challenge_web:$SHA -f ./composetest/Dockerfile ./composetest

docker push vladbronfman/igentify_challenge_web

docker push vladbronfman/igentify_challenge_web:$SHA

kubectl apply -f k8s
kubectl expose deployment redis  --type=ClusterIP --name=redis
kubectl expose deployment web-deployment --type=LoadBalancer --name=web-service
kubectl set image deployment/web-deployment web=vladbronfman/igentify_challenge_web:$SHA

