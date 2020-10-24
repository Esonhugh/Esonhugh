curl http://zhaobiao.hdu.edu.cn/82/list.htm|grep target=\"_blank\" > cache
curl http://zhaobiao.hdu.edu.cn/82/list.htm|grep target=\'_blank\' >> cache
cat cache | grep -v 详细内容 > cache2
wc -l cache2
rm -f cache cache2
## or all_in_one 
#
#curl http://zhaobiao.hdu.edu.cn/82/list.htm|grep target=\"_blank\" > cache && curl http://zhaobiao.hdu.edu.cn/82/list.htm|grep target=\'_blank\' >> cache && cat cache | grep -v 详细内容 > cache2 && wc -l cache2 && rm -f cache cache2
