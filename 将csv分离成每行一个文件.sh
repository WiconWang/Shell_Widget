#!/bin/sh

# 吴秀芹的需求，一个csv文件共101行。 把表头和其中一行拼接成一个文件。所以最终有100个文件
# 使用方法  ./xxx.sh  filename.csv

# 读取第一行
firstline=$( sed -n '1p' $1)

# 建立存放目录
DATE=$(date +%Y%m%d%H%M%S)
mkdir $DATE

# 循环行
cat $1  |while  read LINE
do
   #取出当前行的第一个字段，做为文件名，他的文件第一段是ID××
   filename=`echo $LINE |awk -F ',' '{print $1}'`
   #输出拼接内容到文件
   echo -e $firstline"\n$LINE" > $DATE"/"$filename".txt"
done
exit  0
