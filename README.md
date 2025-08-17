# BedrockOpenWebUI

This is where I keep my docker compose yaml for running an AWS Bedrock backed OpenWebUI. What else do you want? Oh an explanation?

## User Guide
### Environment variables
Required:
```bash
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
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
