# CAIS++ GPU Server Manager
Managing scripts and information for the CAIS++ GPU servers 

## Usage
TODO

## Servers
- Server 1: 10.14.111.183
  - Two TitanX GPUs
  - 1TB of HDD storage
- Server 2: 10.14.167.159
  - One TitanX GPU
  - 30GB of SSD storage (1TB of HDD coming soon)

## System Ops
- Create a new user
  - sh `create_user_all.sh username` You will be prompted to enter passwords for hostuser on server 1 and then server 2.

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
