==============================================================================================

	http://blog.csdn.net/huangyabin001/article/details/42777703
	

==============================================================================================
Android bootchartʹ�ò���
+++++++++++++++++++++++++

1.������װ bootchart ����:

	# sudo apt-get install bootchart(Ubuntu)

2.����֧�� bootchart �� boot.img, ��дboot.img���ֻ��������ֻ�:

	# export INIT_BOOTCHART=true
	# make boot.img

3.�趨bootchart�ռ���Ϣ�Ľ���ʱ��

	# adb shell 'echo 120>/data/bootchart-start'

	�����ֻ�.
	�����Ҫֹͣ�ռ���Ϣ,����ʹ��

		# adb shell 'echo 1 > /data/bootchart-stop'

4.���Կ����� /data/bootchart Ŀ¼��,��������������ļ�, pull��bootchartĿ¼��

	header
	kernel_pacct
	proc_diskstats.log
	proc_ps.log
	proc_stat.log

5.��pull������bootchartĿ¼��,ʹ��

	# tar czf bootchat.tgz *

6.���bootchart.pngͼ��

	�� Ubuntu ��,ʹ��

		# bootchart bootchart.tgz

	����bootchart.pngͼ��

==============================================================================================
