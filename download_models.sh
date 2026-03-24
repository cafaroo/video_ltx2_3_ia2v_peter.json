#!/bin/bash
set -e

MODELS_DIR="/comfyui/models"
MARKER="/comfyui/.models_downloaded"

# Skip if already downloaded
if [ -f "$MARKER" ]; then
    echo "Models already downloaded, skipping."
    exit 0
fi

echo "Downloading LTX 2.3 models (first run only)..."

# Checkpoint (~22GB)
wget -q --show-progress -O "$MODELS_DIR/checkpoints/ltx-2.3-22b-dev-fp8.safetensors" \
    "https://huggingface.co/Lightricks/LTX-2.3-fp8/resolve/main/ltx-2.3-22b-dev-fp8.safetensors" &

# Text encoder (~6GB)
wget -q --show-progress -O "$MODELS_DIR/text_encoders/gemma_3_12B_it_fp4_mixed.safetensors" \
    "https://huggingface.co/Comfy-Org/ltx-2/resolve/main/split_files/text_encoders/gemma_3_12B_it_fp4_mixed.safetensors" &

# Distilled LoRA
wget -q --show-progress -O "$MODELS_DIR/loras/ltx-2.3-22b-distilled-lora-384.safetensors" \
    "https://huggingface.co/Lightricks/LTX-2.3/resolve/main/ltx-2.3-22b-distilled-lora-384.safetensors" &

# Abliterated LoRA
wget -q --show-progress -O "$MODELS_DIR/loras/gemma-3-12b-it-abliterated_lora_rank64_bf16.safetensors" \
    "https://huggingface.co/Comfy-Org/ltx-2/resolve/main/split_files/loras/gemma-3-12b-it-abliterated_lora_rank64_bf16.safetensors" &

# Spatial upscaler
wget -q --show-progress -O "$MODELS_DIR/latent_upscale_models/ltx-2.3-spatial-upscaler-x2-1.1.safetensors" \
    "https://huggingface.co/Lightricks/LTX-2.3/resolve/main/ltx-2.3-spatial-upscaler-x2-1.1.safetensors" &

# Wait for all downloads
wait

# Create marker so we don't download again
touch "$MARKER"
echo "All models downloaded successfully!"
