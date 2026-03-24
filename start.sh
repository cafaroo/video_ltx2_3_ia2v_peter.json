#!/bin/bash

# Download models on first run
/download_models.sh

# Create required model directories if missing
mkdir -p /comfyui/models/checkpoints /comfyui/models/loras /comfyui/models/text_encoders /comfyui/models/latent_upscale_models

# Run the original worker start script
exec /start_original.sh
