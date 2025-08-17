#!/bin/bash

# Start Ollama in the background.
/bin/ollama serve &
# Record Process ID.
pid=$!

# Pause for Ollama to start.
sleep 5

echo "Retrieve unsloth Gemma3 GGUF model..."
/bin/ollama pull hf.co/unsloth/gemma-3-4b-it-GGUF:Q4_K_M
echo "Done!"

# Wait for Ollama process to finish.
wait $pid
