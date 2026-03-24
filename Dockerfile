# LTX 2.3 Image+Audio to Video worker for Peter Wahrborg trailer
FROM runpod/worker-comfyui:5.5.1-base

# Install LTX Video custom nodes (includes LTXVConcatAVLatent, LTXVAudioVAE, etc.)
RUN comfy node install comfyui-ltxvideo --mode remote

# Download LTX 2.3 checkpoint (fp8)
RUN comfy model download \
  --url https://huggingface.co/Lightricks/LTX-2.3-fp8/resolve/main/ltx-2.3-22b-dev-fp8.safetensors \
  --relative-path models/checkpoints \
  --filename ltx-2.3-22b-dev-fp8.safetensors

# Download distilled LoRA
RUN comfy model download \
  --url https://huggingface.co/Lightricks/LTX-2.3/resolve/main/ltx-2.3-22b-distilled-lora-384.safetensors \
  --relative-path models/loras \
  --filename ltx-2.3-22b-distilled-lora-384.safetensors

# Download Gemma 3 abliterated LoRA (for prompt enhancement)
RUN comfy model download \
  --url https://huggingface.co/Comfy-Org/ltx-2/resolve/main/split_files/loras/gemma-3-12b-it-abliterated_lora_rank64_bf16.safetensors \
  --relative-path models/loras \
  --filename gemma-3-12b-it-abliterated_lora_rank64_bf16.safetensors

# Download Gemma 3 text encoder (fp4)
RUN comfy model download \
  --url https://huggingface.co/Comfy-Org/ltx-2/resolve/main/split_files/text_encoders/gemma_3_12B_it_fp4_mixed.safetensors \
  --relative-path models/text_encoders \
  --filename gemma_3_12B_it_fp4_mixed.safetensors

# Download spatial upscaler
RUN comfy model download \
  --url https://huggingface.co/Lightricks/LTX-2.3/resolve/main/ltx-2.3-spatial-upscaler-x2-1.1.safetensors \
  --relative-path models/latent_upscale_models \
  --filename ltx-2.3-spatial-upscaler-x2-1.1.safetensors
