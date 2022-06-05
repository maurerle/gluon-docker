wget https://firmware.ffmuc.net/next/other/gluon-ffmuc-v2022.5.2-next3-x86-64-rootfs.img.gz
FILE_NAME='gluon-ffmuc-v2022.5.2-next3-x86-64-rootfs.img.gz'
gzip -d $FILE_NAME
mkdir -p ./gluon-ext
IMG_FILE_NAME="${FILE_NAME%.*}"
sudo mount -t squashfs $IMG_FILE_NAME ./gluon-ext
sudo cp -r ./gluon-ext ./build
sudo umount ./gluon-ext
sudo rm -r ./gluon-ext
rm -rf "$IMG_FILE_NAME"
sudo cp -r ./rootfs/* ./build
sudo docker build -t gluon .

sudo rm -r ./build
