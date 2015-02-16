#!/bin/bash

VERSION=
TARGET=

#select_version
BASE=$1
TARGET=$2

if [ -z $1];then
	echo -e "USEAGE:"
	echo -e "\t./mkdiff.sh base target"
	exit 1
fi

if [ -z $2];then
	echo -e "USEAGE:"
	echo -e "\t./mkdiff.sh base target"
	exit 1
fi

echo -e "Make OTA Diff Package Form $BASE to $TARGET"

build/tools/releasetools/ota_from_target_files \
	-v \
	-p out/host/linux-x86 \
	-k build/target/product/security/testkey \
	-l ${TARGET}/logo.bin \
	-u ${TARGET}/lk.bin \
	-i \
	${BASE}/ota/full_x600_mp_leui_target_files_0.2-${BASE}_open_eng.zip \
	${TARGET}/ota/full_x600_mp_leui_target_files_0.2-${TARGET}_open_eng.zip \
	ota-${BASE}-to-${TARGET}.zip
