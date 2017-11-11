#!/bin/bash
clear
# awk '{print $NF}' ~/Applications/office.log
# FILES=`~/Applications/office.log`
LOG_DATE=`date +%Y-%m-%d`
LOG_TIME=`date +%H:%M:%S`
LOG_NUM=`grep  -c  $LOG_DATE  ~/Applications/office.log`
LOG_TD=`grep  -n $LOG_DATE  ~/Applications/office.log`
LOG_LAST=`tail -1 ~/Applications/office.log`
# echo $LOG_DATE  $LOG_TIME >> ~/Applications/office.log
if [ $LOG_NUM == "0" ]; then
    echo $LOG_DATE  $LOG_TIME >> ~/Applications/office.log
    echo "签到：" $LOG_TIME
elif [  $LOG_NUM == "1" ]; then
    echo $LOG_DATE  $LOG_TIME >> ~/Applications/office.log
    echo "签到：" $LOG_LAST
    echo "签退：" $LOG_DATE  $LOG_TIME

# echo "-----"

# Sys_data=`date -j -f [%Y-%m-%d %H:%i:%s] "$LOG_LAST" +%s`    #把当前时间转化为Linux时间
# In_data=`date -j -f [%Y-%m-%d %H:%i:%s]  "$LOG_DATE  $LOG_TIME" +%s`
# interval=`expr $Sys_data - $In_data`  #计算2个时间的差
# echo $In_data
# echo $Sys_data
# echo $interval

elif [  $LOG_NUM == "2" ]; then
    ed ~/Applications/office.log<<EOF
$,d
w
q
EOF
    echo $LOG_DATE  $LOG_TIME >> ~/Applications/office.log
    echo "签到：" $LOG_LAST
    echo "新签退：" $LOG_DATE  $LOG_TIME
else
    echo "错误：多于一次签退记录"

fi
# echo  $LOG_TD + $LOG_NUM
sleep 5
