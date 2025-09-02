#!/bin/bash
if [ "${PROFILE}" == "bedrock" ] || [ "${PROFILE}" == "full" ] || [ "${PROFILE}" != "lite" ]; then
  export ENABLE_OLLAMA_API=False
  export OPENAI_API_BASE_URL=http://litellm-server:4000
  export OPENAI_API_KEY=${LITELLM_MASTER_KEY:-sk-1234}
  export DEFAULT_MODELS=${LOCAL_MODEL:-gpt-oss-120b}
fi

if [ "${PROFILE}" != "lite" ]; then
  export DATABASE_URL=postgresql://${POSTGRES_USER:-postgres}:${POSTGRES_PASS:-secret}@${POSTGRES_SERVER:-pgvector-server}:${POSTGRES_PORT:-5432}/${POSTGRES_DB:-openwebui}
  export VECTOR_DB=pgvector
  export PGVECTOR_DB_URL=postgresql://${POSTGRES_USER:-postgres}:${POSTGRES_PASS:-secret}@${POSTGRES_SERVER:-pgvector-server}:${POSTGRES_PORT:-5432}/${POSTGRES_DB:-openwebui}
  export REDIS_URL=redis://valkey-server:6379/0
  export SEARXNG_QUERY_URL="http://searxng-server:8888/search?q=<query>"
  export CONTENT_EXTRACTION_ENGINE=tika
  export TIKA_SERVER_URL=http://tika-server:9998
  export ENABLE_WEB_SEARCH=True
  export WEB_SEARCH_ENGINE=searxng
  export WEB_SEARCH_TRUST_ENV=True
  export AUDIO_TTS_ENGINE=openai
  export AUDIO_TTS_OPENAI_API_KEY=not-needed
  export AUDIO_TTS_OPENAI_API_BASE_URL=http://kokoro-server:8880/v1
  export AUDIO_TTS_MODEL=kokoro
  export AUDIO_TTS_VOICE=af_heart
fi

if [ "${PROFILE}" == "ollama" ]; then
  export DEFAULT_MODELS=${LOCAL_MODEL:-hf.co/lmstudio-community/Qwen3-4B-Instruct-2507-GGUF:Q8_0}
fi

/bin/bash start.sh
