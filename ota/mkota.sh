#!/bin/bash

VERSION=

function select_version ()
{
    # print key list
    echo -e "========================================="
    echo -e "VER LIST"
    echo -e "++++++++"
    echo -e "\t 0 - v 22"
    echo -e "\t 1 - v 26"
    echo -e "\t 2 - v 27"
    echo -e "=========================================\n\n"

    # select
    while :
    do
        if read -n 1 -p "Which version >> "
        then
            case ${REPLY} in
            0) VERSION="22";break;; 
            1) VERSION="26";break;; 
            2) VERSION="27";break;; 
            *) echo -e "\n input parameter error !! \n";continue
            esac
        fi
    done
}

#select_version
VERSION=$1
echo -e "Make OTA Full Package of Version $VERSION"

build/tools/releasetools/ota_from_target_files \
	-v \
	-n \
	-p out/host/linux-x86 \
	-k build/target/product/security/testkey \
	-l ${VERSION}/logo.bin \
	-u ${VERSION}/lk.bin \
	${VERSION}/ota/full_x600_mp_leui_target_files_0.2-${VERSION}_open_eng.zip \
	ota-${VERSION}.zip
