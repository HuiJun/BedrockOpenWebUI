# BedrockOpenWebUI

This is where I keep my docker compose yaml for running an AWS Bedrock backed OpenWebUI. What else do you want? Oh an explaination?

## User Guide
### Environment variables
Required:
```bash
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
```

Optional:
```bash
export DOCKER_VOLUME_STORAGE=/mnt/docker-volumes
export AWS_REGION=us-west-2
```

### Running the stack
```bash
git clone git@github.com:HuiJun/BedrockOpenWebUI.git
cd BedrockOpenWebUI
docker compose -f bedrock-openweb-ui.yaml up -d
```
