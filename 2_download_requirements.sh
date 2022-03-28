sudo apt install -y python3-pip
sudo -H pip3 install -U jetson-stats
pip3 install gdown
gdown https://drive.google.com/uc?id=19yXDpF90Lr4J23cdGCVHPeFSyGCVR3VN
unzip setup_jetson.zip
cd setup_jetson
chmod u+x opencv-install.sh
chmod u+x clean_jetson.sh
cd ..
