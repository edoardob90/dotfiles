# Environment file for Linux distributions

# Setup Linuxbrew
BREW="/home/linuxbrew/.linuxbrew/bin/brew"
if type -a "$BREW" 2>&1 >/dev/null; then
    eval "$("$BREW" shellenv)"
fi

# NVIDIA Cuda
export PATH=/usr/local/cuda/bin:/usr/local/cuda/nsight-systems-2019.5.2${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
