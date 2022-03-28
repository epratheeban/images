sudo apt install -y python3-pip
sudo -H pip3 install -U jetson-stats
wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=19yXDpF90Lr4J23cdGCVHPeFSyGCVR3VN' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=19yXDpF90Lr4J23cdGCVHPeFSyGCVR3VN" -O setup_jetson.zip && rm -rf /tmp/cookies.txt
unzip setup_jetson.zip
cd setup_jetson
chmod u+x opencv-install.sh
chmod u+x clean_jetson.sh
cd ..

mkdir Datasets && cd Datasets
mkdir Kapsch && cd Kapsch

cd
