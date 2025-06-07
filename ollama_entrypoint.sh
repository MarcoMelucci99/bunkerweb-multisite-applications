#!/bin/bash

echo "Starting Ollama..."
/bin/ollama serve &
pid=$!

echo "Waiting for Ollama to start..."
until ollama list > /dev/null 2>&1; do
  sleep 2
done

# Controlla se la variabile è impostata
if [ -z "$LLM_MODEL_VERSION" ]; then
  echo "Warning: LLM_MODEL_VERSION not set. Skipping model pull."
else
  MODEL_NAME=${LLM_MODEL_VERSION}
  
  if ollama list | grep -q "$MODEL_NAME"; then
    echo "Model $MODEL_NAME already available."
  else
    echo "Retrieving model: $MODEL_NAME"
    ollama pull "$MODEL_NAME"
    echo "Model $MODEL_NAME is ready!"
  fi
fi

wait $pid
