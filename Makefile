build-container:
	docker build -t neighbor/bar:$(V) -t neighbor/bar:latest .

release: build-container
	docker push neighbor/bar:$(V)
	docker push neighbor/bar:latest

deploy:
	kubectl apply -f deploy/secret.yaml
	kubectl apply -f deploy/deployment.yaml

setup: deploy

.PHONY: build-container release deploy setup
