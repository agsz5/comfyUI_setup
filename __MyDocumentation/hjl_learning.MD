# LEARNING

## Workspace color (Peacock @VsCode):

#f9460d

## 18/11/2024 (November)

- "LoraLoader" Module on Worklows like "241007_MICKMUMPITZ_CHARACTER_SHEET_V03_SDXL_SMPL" complains that we don't have the Lora"sdxl\\SDXL1.0_Essenz-series-by-AI_Characters_Style_NausicaäOfTheValleyOfTheWindHayaoMyazaki-v1.2.safetensors"

GPT suggested to look for an alternative anime Lora. You found: - LineAniRedmondV2-Lineart-LineAniAF.safetensors - Recommended on this page: https://www.digitalcreativeai.net/en/post/stable-diffusion-web-ui-sdxl10-recommended-lora-model - Download URL: https://huggingface.co/artificialguybr/LineAniRedmond-LinearMangaSDXL-V2/resolve/fa60a2a60e93448e609e5bf1cc8933bd30d4b7e2/LineAniRedmondV2-Lineart-LineAniAF.safetensors - Put in: ComfyUI\models\loras

# MODELS AND RESOURCES NEEDED FOR Mick Mumpitz's workflows (character sheets) [Redhead Woman]

- Go to ComfyUI Manager > Install missing custom nodes > install all of them > Restart ComfyUI
- Additionally:

  1. Checkpoint: wildcardx-xl-turbo (6.63 GB)
     Put in: ComfyUI\models\checkpoints
     Download: https://civitai.com/api/download/models/329685?type=Model&format=SafeTensor&size=full&fp=fp16

  2. SDXL CONTROLNET: OpenPoseXL2.safetensors (5 GB)
     Download: https://huggingface.co/thibaud/controlnet-openpose-sdxl-1.0/resolve/main/OpenPoseXL2.safetensors
     Put in: ComfyUI\models\controlnet\sdxl

  3. SDXL CONTROLNET (for the advanced workflow version): mistoLine_rank256.safetensors
     Download: https://huggingface.co/TheMistoAI/MistoLine/resolve/main/mistoLine_rank256.safetensors
     Put in: ComfyUI\models\controlnet\sdxl

  4. UPSCALE MODEL: 4x-ClearRealityV1
     Download: https://github.com/agsz5/comfyUI_setup/blob/main/4x-ClearRealityV1.pth
     Put in: ComfyUI\models\upscale_models\ClearRealityV1

  5. Anime (LoRA): LineAniRedmondV2-Lineart-LineAniAF.safetensors
     Download: https://huggingface.co/artificialguybr/LineAniRedmond-LinearMangaSDXL-V2/resolve/fa60a2a60e93448e609e5bf1cc8933bd30d4b7e2/LineAniRedmondV2-Lineart-LineAniAF.safetensors
     Put in: ComfyUI\models\loras

# RUNPOD.IO

1. When opening ComfyUI, ports are:
   3000: COMFYUI
   777: VsCode-like terminal
   8000: Easy way to stop / start comfyUi
   8888: Python running thing? (to execute the setup custom script)

2. Errors: several things fail when trying to install with the Manager ("Install missing custom nodes"). You restart several times, apply the "try fix" several times, and restart. - E.g.

   "ComfyUI Impact Pack" fails
   WAS Node Suite (WASasqua...)
   ComfyUI-PuLID-Flux-Enhanced (sipie800+) [ComfyUI-PuLID-Flux-Enhanced install failed: Unknown Error]

   These work fine, installing from ComfyUI Manager ("Install missing custom nodes").
   UltimateSDUpscale (ssitu)
   rgthree's ComfyUI Nodes (rgthree)
   Save Image with Generation Metadata (Girish Gop...)
   ComfyUI Essentials (cubiq)
   Use everywhere (UE Nodes) (chrisgoringe)
   KJNodes for ComfyUI (kijai)
   ComfyUI-AdvancedLivePortrait (powerHouse...)
   ComfyUI-PuLID-Flux-Enhanced (sipie800+)

COMFYUI loading (workflow) error: "When loading the graph, the following node types were not found:"
String Literal
GetNode
JoinStrings
SetNode
Anything Everywhere
PulidFluxEvaClipLoader
Fast Bypasser (rgthree)
ImageResize+
PulidFluxInsightFaceLoader
ModelPassThrough
ApplyPulidFlux
PulidFluxModelLoader
UltimateSDUpscale
ExpressionEditor
Load Lora
Fast Groups Muter (rgthree)
Int Literal

- Eventually the 'UltimateSDUpscale' module will be the last one left, and fail.. what you did is that you followed the instructions from the site (https://github.com/ssitu/ComfyUI_UltimateSDUpscale), so you open the port 777: VsCode-like terminal, and from there, following the git instructions you go open the terminal.. then:

  - starting in ComfyUI/custom_nodes/:

  git clone https://github.com/ssitu/ComfyUI_UltimateSDUpscale --recursive

## 18/11/2024: After everything is successful on your runpod, you it still fails when starting the queue, message is:

"Error occurred when executing CheckpointLoaderSimple:

Error while deserializing header: HeaderTooLarge

File "/workspace/ComfyUI/execution.py", line 152, in recursive_execute
output_data, output_ui = get_output_data(obj, input_data_all)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
File "/workspace/ComfyUI/execution.py", line 82, in get_output_data
return_values = map_node_over_list(obj, input_data_all, obj.FUNCTION, allow_interrupt=True)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
File "/workspace/ComfyUI/execution.py", line 75, in map_node_over_list
results.append(getattr(obj, func)(\*\*slice_dict(input_data_all, i)))
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
File "/workspace/ComfyUI/nodes.py", line 518, in load_checkpoint
out = comfy.sd.load_checkpoint_guess_config(ckpt_path, output_vae=True, output_clip=True, embedding_directory=folder_paths.get_folder_paths("embeddings"))
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
File "/workspace/ComfyUI/comfy/sd.py", line 502, in load_checkpoint_guess_config
sd = comfy.utils.load_torch_file(ckpt_path)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
File "/workspace/ComfyUI/comfy/utils.py", line 15, in load_torch_file
sd = safetensors.torch.load_file(ckpt, device=device.type)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
File "/workspace/ComfyUI/venv/lib/python3.11/site-packages/safetensors/torch.py", line 313, in load_file
with safe_open(filename, framework="pt", device=device) as f:
"

## Newest MickMumpitz "consistent character" with Flux, PuLID, etc (Young Asian woman)

## 1. Install ComfyUI (note -> I use a pod that has already has ComfyUI installed so we don't have to worry about that , however, in order to use this custom Workflow, we need to install a buch of models and other things.). The installation instructions for this Workflow do include the disclaimer below about ComfyUI and Python versions compatibility, so perhaps our script should include a check on what versions are installed in the pod? if the condition below is not met, then we don't waste our time installing the rest of the models, since it's not gonna work.

This workflow currently works with ComfyUI versions 0.2.3 or lower, as the new one uses an incompatible Python version. I will update this workflow as soon as this is fixed. You can check which Python version your ComfyUI is using by going to the python_embeded folder and running python.exe. It should not be 3.12!

## 2. Install PuLID

These steps are required if you want to use PuLID:

### A. Install Facexlib

- Navigate to folder ComfyUI_windows_portable
- open the “python embedded” folder
- click on the folder path, type “cmd” and hit enter
- use command python.exe -m pip install --use-pep517 facexlib

### Install Insight Face

- Find out which Python version you are using by running “python” in ComfyUI_windows_portable\python_embeded
- Download the corresponding insightface version here: https://github.com/Gourieff/Assets/tree/main/Insightface (can this be achieved with a script? choosing a version?)
- Right click on that file > “Copy as path”
- Go back to your comfyUI, type in “cmd” in the address bar > open terminal and run this command:

.\python_embeded\python.exe -m pip install "paste path here" onnxruntime

- in my case it looked like this:

.\python_embeded\python.exe -m pip install "C:\Users\mick\Downloads\insightface-0.7.3-cp311-cp311-win_amd64.whl" onnxruntime

## 3. Install Missing custom Nodes (note: we can skip this in the script, I can easily manually do this myself inside of ComfyUI)

- Start ComfyUI by clicking run_nvidia_gpu
- ComfyUI will now start in your browser

Drag my workflow(s) .json files into the interface

Go to Manager > Install Missing Custom Nodes > select all of them > Install

## 4. Download the Models

If you don’t have the required folders just manually create them!

### FLUX

MODEL download link:
https://huggingface.co/Kijai/flux-fp8/resolve/main/flux1-dev-fp8-e4m3fn.safetensors?download=true

Put in folder:
ComfyUI_windows_portable\ComfyUI\models\unet

## CLIP

https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors?download=true

and

https://huggingface.co/mcmonkey/google_t5-v1_1-xxl_encoderonly/resolve/main/t5xxl_fp8_e4m3fn.safetensors?download=true

Put both in folder:
ComfyUI_windows_portable\ComfyUI\models\clip

## VAE

https://huggingface.co/black-forest-labs/FLUX.1-schnell/resolve/main/ae.safetensors?download=true

Put in folder:
ComfyUI_windows_portable\ComfyUI\models\vae

## CONTROLNET MODEL:

https://huggingface.co/InstantX/FLUX.1-dev-Controlnet-Union/resolve/main/diffusion_pytorch_model.safetensors?download=true

You can get the models via the ComfyUI Manager:

Put in folder:
ComfyUI_windows_portable\ComfyUI\models\controlnet\flux

## UPSCALE MODEL:

https://huggingface.co/agsz5/4x_clr_rlty/resolve/main/4x-ClearRealityV1.pth?download=true

Put in folder:
ComfyUI_windows_portable\ComfyUI\models\upscale_models

## PuLID FLUX: PuLID Flux pre-trained model

https://huggingface.co/guozinan/PuLID/resolve/main/pulid_flux_v0.9.0.safetensors

Put in folder:
ComfyUI_windows_portable\ComfyUI\models\pulid

## AntelopeV2 (note: this is tricky, since it's a zip file and I need to put the unZip contents on the folder below, not sure if this is possible within this script)

https://huggingface.co/MonsterMMORPG/tools/blob/main/antelopev2.zip

Put in folder (note:folder won't exist, so as a part of the script you need to create it too):
ComfyUI_windows_portable\ComfyUI\models\insightface\models\antelopev2

## Lora

https://huggingface.co/alimama-creative/FLUX.1-Turbo-Alpha/resolve/main/diffusion_pytorch_model.safetensors

- Rename this file to “8-step-flux.safetensors” once download is completed.

Put in folder:
ComfyUI_windows_portable\ComfyUI\models\lora

=====================================================================

## RUNPOD.IO - Clean ComfyUI install, procedure,,,

Runpod PyTorch

# 1. ComfyUI Installation

cd /workspace
git clone https://github.com/comfyanonymous/ComfyUI.git
cd ComfyUI
git checkout v0.2.3
pip install -r requirements.txt

# 2. ComfyUI-Manager Installation

cd custom_nodes
git clone https://github.com/ltdrdata/ComfyUI-Manager.git
cd ComfyUI-Manager
pip install -r requirements.txt

# 3. Verify Installation

cd /workspace/ComfyUI
python main.py --port 8188 --listen 0.0.0.0 --disable-auto-launch

## Now.. how to connect to ComfyUI??

- Stop pod
- Edit pod configuration:

Click "Edit Pod"
Add exposed port 8188
Set port type as HTTP
Start pod with new config

# 1. Rerun COmfyUI

cd /workspace/ComfyUI

# 2. Double-check other potential missing dependencies

pip install -r /workspace/ComfyUI/requirements.txt

## Set SSL verification environment variable (if you wanna make sure ComfyUI manager won't block node installations )

export PYTHONHTTPSVERIFY=0

# 3. Restart ComfyUI

python main.py --listen 0.0.0.0 --port 8188 --enable-cors-header --disable-auto-launch

# 4. Execute your custom chatGPT script to install the models/upscalers, etc which you need

setup_flux_consistency_mickmum_02_asian.ipynb

=====================================

GitHub Copilot

## Revised Template Plan with Larger Storage

1. Same base setup but with increased storage:

- Base: runpod/pytorch:2.1.1-py3.10-cuda11.8-devel-ubuntu22.04
- Container Disk: 100GB (to accommodate all models)

2. Create Template with:

# Template Configuration

Name: "ComfyUI v0.2.3 FLUX"
Container Disk: 100GB
HTTP Ports: 8188, 8888
TCP Ports: 22

# Startup Script

#!/bin/bash
cd /workspace
git clone https://github.com/comfyanonymous/ComfyUI.git
cd ComfyUI
git checkout v0.2.3
pip install -r requirements.txt einops scipy
cd custom_nodes
git clone https://github.com/ltdrdata/ComfyUI-Manager.git
cd ComfyUI-Manager
pip install -r requirements.txt
echo "export PYTHONHTTPSVERIFY=0" >> ~/.bashrc

============================================
Script to do Upscaling

The script shouldn't look for a specific .jpg/.png filename... rather process ANY _.jpg / _.png
The script should append "\_4xUpscaled" to the existing input _.jpg or _.png name... if that name exists, then ALSO append an incremental "\_001", "\_002" nomenclature
The script should not look for a specific "4x-ClearRealityV1.pth" model... rather a "\*.pth" model... (I want the script to be flexible so I can just remove whatever .pth is there and replace it for a different .pth, without me having to adjust the script each time)
