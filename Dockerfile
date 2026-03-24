# LTX 2.3 Image+Audio to Video worker for Peter Wahrborg trailer
FROM runpod/worker-comfyui:5.5.1-base

# Install LTX Video custom nodes (includes LTXVConcatAVLatent, LTXVAudioVAE, etc.)
RUN comfy node install comfyui-ltxvideo --mode remote

# Create model directories
RUN mkdir -p /comfyui/models/text_encoders /comfyui/models/latent_upscale_models

# Rename original start script so we can wrap it
RUN cp /start.sh /start_original.sh

# Models are downloaded at first startup via download_models.sh
# This avoids Docker build timeout issues with large model files (~29GB)
COPY download_models.sh /download_models.sh
RUN chmod +x /download_models.sh

# Our wrapper that downloads models then runs the original start
COPY start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]
