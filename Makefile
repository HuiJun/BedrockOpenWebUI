# Makefile for docker-compose operations

# Default target
.PHONY: lite
lite:
	export PROFILE=lite; docker compose -f bedrock-openweb-ui.yaml --profile lite up -d $(c)

.PHONY: full
full:
	export PROFILE=full; export LITELLM_MODELS=ollama; docker compose -f bedrock-openweb-ui.yaml --profile full up -d $(c)

.PHONY: bedrock
bedrock:
	export PROFILE=bedrock; docker compose -f bedrock-openweb-ui.yaml --profile bedrock up -d $(c)

.PHONY: ollama
ollama:
	export PROFILE=ollama; export LITELLM_MODELS=ollama; docker compose -f bedrock-openweb-ui.yaml --profile ollama up -d $(c)

.PHONY: down
down:
	export PROFILE=full; docker compose -f bedrock-openweb-ui.yaml --profile full down -v $(c)

.PHONY: clean
clean:
	docker volume prune -af --filter label="com.github.bedrockopenwebui.stack"

.PHONY: destroy
destroy: down clean

# Set default target
.DEFAULT_GOAL := lite
