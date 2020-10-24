import os
from bs4 import BeautifulSoup
html_response = os.popen("curl http://zhaobiao.hdu.edu.cn/82/list.htm/").read()
tags = BeautifulSoup(html_response,'html.parser').final_all('a')
num = 0
for tag in tags:
    if "公告" in tag.strings:
        num += 1
print(num)
