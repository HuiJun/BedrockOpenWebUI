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
export LOCAL_MODEL=hf.co/unsloth/gemma-3-4b-it-GGUF:Q4_K_M
```

External:
```bash
export OPENWEBUI_PORT=8080
export BEDROCK_ACCESS_GATEWAY_PORT=8000
export OLLAMA_WEBAPI_PORT=11434
export AWS_REGION=us-west-2
export SEARXNG_SECRET=somesearxngsecret
export SEARXNG_PORT=8888
```

### Running the stack
```bash
git clone git@github.com:HuiJun/BedrockOpenWebUI.git
cd BedrockOpenWebUI
docker compose -f bedrock-openweb-ui.yaml up -d
```
