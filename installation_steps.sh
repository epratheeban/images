# Install basics and clean
sudo apt install -y python3-pip
sudo -H pip3 install -U jetson-stats
pip3 install gdown
gdown 19yXDpF90Lr4J23cdGCVHPeFSyGCVR3VN
unzip setup_jetson.zip
cd setup_jetson
chmod x+u opencv-install.sh
chmod x+u clean_jetson.sh

sh ./clean_jetson.sh

### Install basics for python
sudo apt install -y libopenblas-base
sudo apt install -y gfortran libopenmpi-dev liblapack-dev libatlas-base-dev
sudo apt install -y libgeos-dev
sudo apt-get install libgeos-c1v5
#
### Pip installation
pip3 install Cython==0.29.28
pip3 install numpy==1.13.3
pip3 install scipy==0.19.1
pip3 install hydra-core==1.1.1
pip3 install omegaconf==2.1.1
pip3 install pandas==0.22.0
pip3 install Shapely==1.6.4
pip3 install tqdm==4.63.0
pip3 install getmac

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

### Install Dlib
DLIB_FILE="dlib-19.23.tar.bz2"
tar xvf ${DLIB_FILE}
cd dlib-19.23/
mkdir build && cd build
cmake ..
cmake --build .
cd ..
sudo python3 setup.py install

###
cd ..
sh ./opencv-install.sh


## Pytorch installations
sudo apt-get install -y libjpeg-dev libopenblas-dev libopenmpi-dev libomp-dev
sudo apt-get install -y libavcodec-dev libavformat-dev libswscale-dev
sudo -H pip3 install future
sudo pip3 install -U --user wheel mock pillow
sudo -H pip3 install testresources
sudo -H pip3 install setuptools==58.3.0
sudo -H pip3 install install torch-1.10.0-cp36-cp36m-linux_aarch64.whl

# Torchvision installation
##sudo -H pip3 install torchvision-0.11.0a0+fa347eb-cp36-cp36m-linux_aarch64.whl
