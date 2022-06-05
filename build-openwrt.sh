wget https://archive.openwrt.org/releases/21.02.3/targets/x86/generic/openwrt-21.02.3-x86-generic-rootfs.tar.gz
FILE_NAME='openwrt-21.02.3-x86-generic-rootfs.tar.gz'
#wget https://firmware.ffmuc.net/next/other/gluon-ffmuc-v2022.5.2-next3-x86-64-rootfs.img.gz
#FILE_NAME='gluon-ffmuc-v2022.5.2-next3-x86-64-rootfs.img.gz'
mkdir -p ./build
tar xf "$FILE_NAME" --strip=1 -C ./build
rm -rf "$FILE_NAME"

cp -r ./rootfs/* ./build

docker build -t openwrt .
