# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# No registry-verified custom nodes were detected in the workflow.
# The workflow includes unknown_registry custom nodes that could not be automatically resolved:
# - MarkdownNote (no aux_id / GitHub repository provided) -- skipping automatic install.
# If you have a GitHub repo for a custom node, you can add a line like:
# RUN git clone https://github.com/<owner>/<repo> /comfyui/custom_nodes/<repo>

# download models into comfyui
# No models were required by this workflow.

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
