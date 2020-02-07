# Environment file for Linux distributions

# NVIDIA Cuda
export PATH=/usr/local/cuda/bin:/usr/local/cuda/nsight-systems-2019.5.2${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
