import os
from bs4 import BeautifulSoup as bs
get_html = os.popen("curl http://www.mca.gov.cn//article/sj/xzqh/2020/2020/2020092500801.html")
soup = bs(get_html,'html.parser')

print(soup)


print(soup.title)

print(dir(soup.file))


print(soup.find_all('p',class_='div'))
