.PHONY: build shell migrate deps composer-install composer-update composer reload start stop destroy doco rebuild

build: start deps

shell:
	@docker exec -it php-docker-template-php /bin/sh

deps: composer-install

composer-install: CMD=install
composer-update: CMD=update
composer composer-install composer-update:
	@docker exec -it php-docker-template-php composer $(CMD)

# 🐳 Docker Compose
start: CMD=up -d
stop: CMD=stop
destroy: CMD=down

# Usage: `make doco CMD="ps --services"`
# Usage: `make doco CMD="build --parallel --pull --force-rm --no-cache"`
doco start stop destroy:
	@docker-compose $(CMD)

rebuild:
	docker-compose build --pull --force-rm --no-cache
	make deps
	make start
