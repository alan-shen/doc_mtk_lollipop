#!/bin/bash

IMAGE_LIST=""
OUTPUT=""

if [ -z $1 ];then
	echo -e "error: need input a file which will be transfored.\n"
	echo -e "eg."
	echo -e "	$0 MT8173_Android_scatter_emmc.txt\n"
	exit 1
else
	if [ -e /tmp/tmp.txt ];then
		rm /tmp/tmp.txt
	fi
	echo "$1" > /tmp/tmp.txt
	file_name=`awk -F '.' '{print $1}' /tmp/tmp.txt`
	file_suff=`awk -F '.' '{print $2}' /tmp/tmp.txt`
	OUTPUT="${file_name}_signed.${file_suff}"
	cp -rfv $1 $OUTPUT
fi

IMAGE_LIST=`grep -wr "file_name" $OUTPUT | awk -F ' ' '{print $2}'`

for image in $IMAGE_LIST
do
	if [ $image != "NONE" -a $image != "preloader.bin" ];then
		if [ -e /tmp/tmp.txt ];then
			rm /tmp/tmp.txt
		fi
		echo $image > /tmp/tmp.txt
		file_name=`awk -F '.' '{print $1}' /tmp/tmp.txt`
		file_suff=`awk -F '.' '{print $2}' /tmp/tmp.txt`
		sed -i "s/$image/$file_name-sign.$file_suff/" $OUTPUT
	fi
done

if [ -e /tmp/tmp.txt ];then
	rm /tmp/tmp.txt
fi
