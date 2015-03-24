==============================================================================================

	http://blog.csdn.net/huangyabin001/article/details/42777703
	

==============================================================================================
Android bootchart使用步骤
+++++++++++++++++++++++++

1.主机安装 bootchart 工具:

	# sudo apt-get install bootchart(Ubuntu)

2.生成支持 bootchart 的 boot.img, 烧写boot.img到手机，重启手机:

	# export INIT_BOOTCHART=true
	# make boot.img

3.设定bootchart收集信息的结束时间

	# adb shell 'echo 120>/data/bootchart-start'

	重启手机.
	如果需要停止收集信息,可以使用

		# adb shell 'echo 1 > /data/bootchart-stop'

4.可以看到在 /data/bootchart 目录下,生成了下面五个文件, pull到bootchart目录下

	header
	kernel_pacct
	proc_diskstats.log
	proc_ps.log
	proc_stat.log

5.在pull出来的bootchart目录下,使用

	# tar czf bootchat.tgz *

6.设成bootchart.png图表

	在 Ubuntu 下,使用

		# bootchart bootchart.tgz

	生成bootchart.png图表

==============================================================================================
