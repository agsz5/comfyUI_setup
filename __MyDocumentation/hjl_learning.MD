# LEARNING

## Workspace color (Peacock @VsCode):
#f9460d

## 18/11/2024 (November)
- "LoraLoader" Module on Worklows like "241007_MICKMUMPITZ_CHARACTER_SHEET_V03_SDXL_SMPL" complains that we don't have the Lora"sdxl\\SDXL1.0_Essenz-series-by-AI_Characters_Style_NausicaäOfTheValleyOfTheWindHayaoMyazaki-v1.2.safetensors"

GPT suggested to look for an alternative anime Lora. You found:
            - LineAniRedmondV2-Lineart-LineAniAF.safetensors
            - Recommended on this page: https://www.digitalcreativeai.net/en/post/stable-diffusion-web-ui-sdxl10-recommended-lora-model
            - Download URL: https://huggingface.co/artificialguybr/LineAniRedmond-LinearMangaSDXL-V2/resolve/fa60a2a60e93448e609e5bf1cc8933bd30d4b7e2/LineAniRedmondV2-Lineart-LineAniAF.safetensors
            - Put in: ComfyUI\models\loras


# MODELS AND RESOURCES NEEDED FOR Mick Mumpitz's workflows (character sheets)

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

2. Errors: several things fail when trying to install with the Manager (missing modules). You restart several times, apply the "try fix" several times, and restart. 

- Eventually the 'UltimateSDUpscale' module will be the last one left, and fail.. what you did is that you followed the instructions from the site (https://github.com/ssitu/ComfyUI_UltimateSDUpscale), so you open the port 777: VsCode-like terminal, and from there, following the git instructions you go open the terminal.. then:
    -  starting in ComfyUI/custom_nodes/:

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
results.append(getattr(obj, func)(**slice_dict(input_data_all, i)))
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