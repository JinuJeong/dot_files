if [ -z $LD_LIBRARY_PATH ];then
    # export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64
    export LD_LIBRARY_PATH=/usr/local/cuda/lib64
else
    # export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-9.0/lib64
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64
fi

# export PATH=/usr/local/cuda-9.0/bin:$PATH
export PATH=/usr/local/NVIDIA-Nsight-Compute:/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/extras/CUPTI/lib64:$LD_LIBRARY_PATH
#export TRT_RELEASE=/usr/local/TensorRT
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$TRT_RELEASE/lib
#export PATH=/usr/local/cuda/nsight-compute-2019.4.0:$PATH

