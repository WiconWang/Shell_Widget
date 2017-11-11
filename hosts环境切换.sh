#!/bin/bash

sudo clear
function sharedevtest(){
	echo  "正在添加共用模块……"
	echo "10.13.1.197 ptc.auto.sina.cn" >> /etc/hosts
    echo "10.210.67.30 svnpub.webdev.sina.com.cn" >> /etc/hosts
    echo "10.235.56.241 pr.auto.sina.com.cn" >> /etc/hosts
	echo "218.93.127.136  pcbeta.com uc.pcbeta.com m.pcbeta.com mac.pcbeta.com web.pcbeta.com i.pcbeta.com bbs.pcbeta.com www.pcbeta.com cdn.pcbeta.attachment.inimc.com cdn.pcbeta.static.inimc.com cdn.pcbeta.css.inimc.com" >> /etc/hosts
	echo "123.125.106.196 t.cn" >> /etc/hosts
}
function hostsdev(){
	echo  "正在添加开发区模块……"
    echo "192.168.0.111 agent.doudeqipai.com" >> /etc/hosts
	echo "127.0.0.1 www.v71.com www.v56.com" >> /etc/hosts

}
function hoststest(){
	echo  "正在添加测试区模块……"
	echo "139.129.213.166 agent.doudeqipai.com" >> /etc/hosts
}
function hostsroute(){
	echo  "正在添加线上仿真环境模块……"
	echo "10.13.32.235 maiche.sina.com winner.sina.com bbs.auto.sina.com.cn bbs.auto.sina.cn xunjia.auto.sina.cn" >> /etc/hosts
    echo "10.13.1.197 tracker1.auto.sina.com.cn  admin.biz.auto.sina.com.cn" >> /etc/hosts
    echo "#10.73.48.235 bbs.auto.sina.cn bbs.auto.sina.com.cn" >> /etc/hosts
}
function nginx(){
    /etc/init.d/nginx restart
}
function apache(){
    sudo /Applications/MAMP/Library/bin/apachectl restart
}
function orginhost(){
    :>/etc/hosts
    >/etc/hosts
    echo  "正在添加核心屏蔽模块……"
    echo "127.0.0.1 localhost" >> /etc/hosts
    echo "255.255.255.255 broadcasthost" >> /etc/hosts
    echo "::1             localhost" >> /etc/hosts
    echo "127.0.1.1 Wilton-Syswin-Ubuntu" >> /etc/hosts
    echo "127.0.0.1 socks.com  google-analytics.com www.google-analytics.com" >> /etc/hosts

}


# 主程序
echo "MAMP和HOST环境切换"
echo " "
echo "1：开发环境"
#echo "2：开发测试混合环境"
echo "3：测试环境"
#echo "4：线上仿真环境"
echo "5：线上环境"
echo "0：任意键中断程序并查看hosts"
echo " "
read -p "请输入您的选择:" KEY
echo " "
case $KEY in
    1)
echo "【开发环境】 切换开始……"
orginhost;
sharedevtest;
hostsdev;
# rm -rf /etc/nginx/fangtoon_params
# echo  "切换开发区DB配置……"
# cp /etc/nginx/fangtoon_params_dev /etc/nginx/fangtoon_params
# nginx;
apache;
;;
2)
echo "【开发测试混合环境】切换开始……"
orginhost;
sharedevtest;
hostsdev;
# rm -rf /etc/nginx/fangtoon_params
# echo  "切换测试区DB配置……"
# cp /etc/nginx/fangtoon_params_test /etc/nginx/fangtoon_params
# nginx;
apache;
;;
3)
echo "【测试环境】切换开始……"
orginhost;
sharedevtest;
hoststest;
;;
4)
echo "【仿真环境】切换开始……"
orginhost;
sharedevtest;
hostsroute;
;;
5)
echo "【线上环境】切换开始……"
orginhost;
sharedevtest;
;;
*)
echo "未输入或无法识别"
esac
echo " "
echo "操作完成！以下为当前HOSTS……"
echo "——————————————————————————————"
cat /etc/hosts
exit
