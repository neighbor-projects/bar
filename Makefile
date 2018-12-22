deploy:
	kubectl apply -f deploy/secret.yaml
	kubectl apply -f deploy/deployment.yaml
