sudo apt update
sudo apt autoremove -y
sudo apt clean
sudo apt remove thunderbird libreoffice-* -y

## Step 2, still safe but not recommended for dev use
# samples
sudo rm -rf /usr/local/cuda/samples \
    /usr/src/cudnn_samples_* \
    /usr/src/tensorrt/data \
    /usr/src/tensorrt/samples \
    /usr/share/visionworks* ~/VisionWorks-SFM*Samples \
    /opt/nvidia/deepstream/deepstream*/samples	

# Remove local repos
sudo apt purge cuda-repo-l4t-*local* libvisionworks-*repo -y
sudo rm /etc/apt/sources.list.d/cuda*local* /etc/apt/sources.list.d/visionworks*repo*
sudo rm -rf /usr/src/linux-headers-*


# remove static libs (maybe cleaner to remove the "dev" packages instead)
sudo rm -rf /usr/local/cuda/targets/aarch64-linux/lib/*.a \
    /usr/lib/aarch64-linux-gnu/libcudnn*.a \
    /usr/lib/aarch64-linux-gnu/libnvcaffe_parser*.a \
    /usr/lib/aarch64-linux-gnu/libnvinfer*.a \
    /usr/lib/aarch64-linux-gnu/libnvonnxparser*.a \
    /usr/lib/aarch64-linux-gnu/libnvparsers*.a
