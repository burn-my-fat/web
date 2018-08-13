.PHONY: help test

help:
	@echo 'Available targets:'
	@echo '  make test'

test:
	docker-compose down
	docker-compose -f docker-compose.test.yml up --build --abort-on-container-exit --exit-code-from test
