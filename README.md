# CAIS++ GPU Server Manager
Managing scripts and information for the CAIS++ GPU servers 

## Setting up a New Machine
- Download and install miniconda3 to `/opt/conda/`
- `sudo chmod -R 777 /opt/conda/`
- `sudo chmod -R 777 /hdd/ (same for any other drives)`
- Add
  ```
  export PATH="/opt/conda/miniconda3/bin:$PATH"
  export PATH=/usr/local/cuda/bin:/usr/local/cuda/lib64:$PATH
  export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
  ```
  to `/etc/skel/`
- Create file `/opt/conda/.condarc` and add
  ```
  envs_dirs:
    - /opt/conda/envs
  pkgs_dirs:
    - /opt/conda/packages
  ```
  Be sure to not create existing directories. Conda needs to create the
  directories itself.
- Watch out for conflicts in versions of CUDA, CuDNN and TensorFlow.
