#!/bin/bash
export TMPDIR="/home/lee/temp/android"
export NDKROOT="/home/lee/android-ndk-r8"
PREBUILT=$NDKROOT/toolchains/arm-linux-androideabi-4.4.3/prebuilt/linux-x86
PLATFORM=$NDKROOT/platforms/android-9/arch-arm

./configure --target-os=linux \
	--arch=arm \
    --cpu=armv7-a \
    --enable-libx264 \
    --enable-encoder=libx264 \
    --enable-muxer=h264 \
    --enable-pthreads \
	--enable-version3 \
	--enable-gpl \
	--enable-nonfree \
	--disable-stripping \
	--disable-ffmpeg \
	--disable-ffplay \
	--disable-ffserver \
	--disable-ffprobe \
	--disable-devices \
	--disable-protocols \
	--enable-protocol=file \
	--enable-avfilter \
	--disable-network \
	--disable-avdevice \
	--enable-cross-compile \
	--cc=$PREBUILT/bin/arm-linux-androideabi-gcc \
	--cross-prefix=$PREBUILT/bin/arm-linux-androideabi- \
	--nm=$PREBUILT/bin/arm-linux-androideabi-nm \
	--extra-cflags="-I/home/lee/armlib/include -I$PLATFORM/usr/include  -fPIC -DANDROID -mfpu=neon -mfloat-abi=softfp " \
	--disable-asm \
	--enable-neon \
    --disable-yasm \
	--extra-ldflags="-L/home/lee/share-files -lx264 -Wl,-T,$PREBUILT/arm-linux-androideabi/lib/ldscripts/armelf_linux_eabi.x -Wl,-rpath-link=$PLATFORM/usr/lib -L$PLATFORM/usr/lib -nostdlib $PREBUILT/lib/gcc/arm-linux-androideabi/4.4.3/armv7-a/crtbegin.o $PREBUILT/lib/gcc/arm-linux-androideabi/4.4.3/armv7-a/crtend.o -lc -lm -ldl"
