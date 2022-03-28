cd setup_jetson
sudo apt install -y libopenblas-base
sudo apt install -y gfortran libopenmpi-dev liblapack-dev libatlas-base-dev
sudo apt install -y libgeos-dev
sudo apt-get install libgeos-c1v5

### Pip installation
pip3 install Cython==0.29.28
pip3 install 'https://github.com/jetson-nano-wheels/python3.6-numpy-1.19.4/releases/download/v0.0.1/numpy-1.19.4-cp36-cp36m-linux_aarch64.whl'
pip3 install 'https://github.com/jetson-nano-wheels/python3.6-scipy-1.5.4/releases/download/v0.0.1/scipy-1.5.4-cp36-cp36m-linux_aarch64.whl'
pip3 install hydra-core==1.1.1
pip3 install omegaconf==2.1.1
pip3 install pandas==0.22.0
pip3 install Shapely==1.6.4
pip3 install tqdm==4.63.0
pip3 install getmac

sh ./opencv-install

### Install Numba
git clone https://github.com/wjakob/tbb.git
cd tbb/build
cmake ..
make -j
sudo make install
sudo apt install -y llvm-10
export LLVM_CONFIG=/usr/bin/llvm-config-10
cd ..
pip3 install llvmlite
pip3 install numba
cd ..
# Install torch
sudo apt-get install -y libjpeg-dev libopenblas-dev libopenmpi-dev libomp-dev
sudo apt-get install -y libavcodec-dev libavformat-dev libswscale-dev
sudo -H pip3 install future
sudo pip3 install -U --user wheel mock pillow
sudo -H pip3 install testresources
sudo -H pip3 install setuptools==58.3.0
echo $PWD
sudo -H pip3 install install torch-1.10.0-cp36-cp36m-linux_aarch64.whl

