.PHONY: help test dockerize shell docker_build docker_push

help:
	@echo 'Available targets:'
	@echo '  make test'
	@echo '  make dockerize'
	@echo '  make shell'
	@echo '  make docker_build'
	@echo '  make docker_push'

test:
	docker-compose down
	docker-compose -f docker-compose.test.yml up --build --abort-on-container-exit --exit-code-from test

dockerize:
	docker-compose up --build

shell:
	docker-compose exec web sh

docker_build:
	docker build -f Dockerfile.base -t gruz0/burn_my_fat:0.2 .

docker_push:
	docker push gruz0/burn_my_fat
