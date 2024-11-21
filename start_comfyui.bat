@echo off
set CUDA_LAUNCH_BLOCKING=1
.\python_embeded\python.exe -s ComfyUI\main.py --disable-cuda-malloc --windows-standalone-build
pause