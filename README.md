# BedrockOpenWebUI

This is where I keep my docker compose yaml for running an AWS Bedrock backed OpenWebUI. What else do you want? Oh an explanation?

This is a Open WebUI deployment that has a Bedrock Access Gateway, local Ollama server (with the model defined in LOCAL_MODEL preloaded), SearxNG server, and a shared Valkey server. The only environment variables needed are the AWS credentials for the Bedrock Access Gateway.

## User Guide
### Environment variables
*NOTE: Values exported are the default values*


Required:
```bash
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
```

Important:
```bash
export LOCAL_MODEL=hf.co/lmstudio-community/Qwen3-4B-Instruct-2507-GGUF:Q8_0
```

Things you'll probably never change:
```bash
export OPENWEBUI_PORT=8080
export LITELLM_PORT=4000
export OLLAMA_WEBAPI_PORT=11434
export AWS_REGION=us-west-2
export POSTGRES_USER=postgres
export POSTGRES_PASS=secret
export POSTGRES_DB=openwebui
export SEARXNG_SECRET=somesearxngsecret
export SEARXNG_PORT=8888
```

### Running the stack
*Requires docker compose or similar*
```bash
git clone git@github.com:HuiJun/BedrockOpenWebUI.git
cd BedrockOpenWebUI
make
```

### Make targets
`make` or `make lite`
- Default, only spins up reverse-proxy, bedrock-access-gateway, and open-webui services

`make bedrock`
- Full feature bedrock deployment with reverse-proxy, bedrock-access-gateway, pgvector, valkey, searxng, and tika services

`make ollama`
- Full feature ollama deployment with reverse-proxy, ollama, pgvector, valkey, searxng, and tika services

`make full`
- Everything, become an AI god

`make down`
- Spin down all services

`make clean`
- Prunes all volumes owned by the stack

`make destroy`
- Does `down` then `clean`
