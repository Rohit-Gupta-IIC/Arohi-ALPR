

# Installl Python3, PIP, Tkinter
sudo apt-get update
sudo apt-get install python3.6 python3-pip python3-tk -y

#Install OpenALPR
sudo apt-get update && sudo apt-get install -y openalpr openalpr-daemon openalpr-utils libopenalpr-dev

#Install Tesseract 4
sudo apt-get install g++ autoconf automake libtool pkg-config libpng-dev libjpeg8-dev libtiff5-dev zlib1g-dev -y 
sudo apt update && sudo apt install tesseract-ocr libtesseract-dev

#Install SQLite3
sudo apt install sqlite3 sqlitebrowser -y

#Python Dependencies
sudo pip3 install DateTime subprocess.run

#GNOME Desktop
sudo apt-get install --no-install-recommends gnome-panel

# VERSION TO BE INSTALLED

OPENCV_VERSION='4.0'


# 1. KEEP UBUNTU OR DEBIAN UP TO DATE

sudo apt-get -y update
 sudo apt-get -y upgrade       
 sudo apt-get -y dist-upgrade  
 sudo apt-get -y autoremove    


# 2. INSTALL THE DEPENDENCIES

# Build tools:
sudo apt-get install -y build-essential cmake

# GUI (if you want to use GTK instead of Qt, replace 'qt5-default' with 'libgtkglext1-dev' and remove '-DWITH_QT=ON' option in CMake):
sudo apt-get install -y qt5-default libvtk6-dev

# Media I/O:
sudo apt-get install -y zlib1g-dev libjpeg-dev libwebp-dev libpng-dev libtiff5-dev libjasper-dev libopenexr-dev libgdal-dev

# Video I/O:
sudo apt-get install -y libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev yasm libopencore-amrnb-dev libopencore-amrwb-dev libv4l-dev libxine2-dev

# Parallelism and linear algebra libraries:
sudo apt-get install -y libtbb-dev libeigen3-dev

# Python:
sudo apt-get install -y python-dev python-tk python-numpy python3-dev python3-tk python3-numpy

# Documentation:
sudo apt-get install -y doxygen


# 3. INSTALL THE LIBRARY

sudo apt-get install -y unzip wget
wget https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip
unzip ${OPENCV_VERSION}.zip
rm ${OPENCV_VERSION}.zip
mv opencv-${OPENCV_VERSION} OpenCV
cd OpenCV
mkdir build
cd build
cmake -DWITH_QT=ON -DWITH_OPENGL=ON -DFORCE_VTK=ON -DWITH_TBB=ON -DWITH_GDAL=ON -DWITH_XINE=ON -DBUILD_EXAMPLES=ON -DENABLE_PRECOMPILED_HEADERS=OFF ..
make -j4
sudo make install
sudo ldconfig


{
echo '#!/usr/bin/env xdg-open'
echo '[Desktop Entry]'
echo 'Version=1.0'
echo 'Icon[en_IN]=gnome-panel-launcher'
echo 'Name[en_IN]=Aarohi Impex'
echo 'Type=Application'
echo 'Terminal=true'
echo 'Exec=exec.sh'
echo 'Name=Aarohi Impex'
echo 'Icon=gnome-panel-launcher'
echo 'StartupNotify=true'
} > Aarohi-Impex.desktop

{
echo '#!/usr/bin/env xdg-open'
echo '[Desktop Entry]'
echo 'Version=1.0'
echo 'Icon[en_IN]=gnome-panel-launcher'
echo 'Name[en_IN]=Aarohi Impex Database'
echo 'Type=Application'
echo 'Terminal=true'
echo 'Exec= sqlitebrowser Aarohi.db'
echo 'Name=Aarohi Impex Databanel-ase'
echo 'Icon=gnome-panel-launcher'
echo 'StartupNotify=true'
} > Aarohi-Database.desktop


#`grep '^Exec' Aarohi-database.desktop | tail -1 | sed 's/^Exec=//' | sed 's/%.//' | sed 's/^"//g' | sed 's/" *$//g'` &
