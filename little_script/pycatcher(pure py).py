import requests
from bs4 import BeautifulSoup
response = requests.get("http://zhaobiao.hdu.edu.cn/82/list.htm")
html_response = str(response.content.decode())
tags = BeautifulSoup(html_response,'html.parser').find_all('a')
num = 0
for tag in tags:
    if "公告" in str(tag):
        num += 1
print("whole number is "+str(num))
