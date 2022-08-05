DC := /usr/libexec/docker/cli-plugins/docker-compose --env-file ./.env --project-directory

default:
	make loki-up

.PHONY: network-up
network-up:
	docker network create fail2ban-everywhere

.PHONY: network-down
network-down:
	docker network rm fail2ban-everywhere

.PHONY: loki-up
loki-up:
	$(DC) ./third-party/loki up -d

.PHONY: loki-down
loki-down:
	$(DC) ./third-party/loki down