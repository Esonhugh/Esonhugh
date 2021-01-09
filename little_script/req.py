# curl 'http://178.128.40.63:32176/' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101 Firefox/78.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Accept-Language: en-US,en;q=0.5' --compressed -H 'Content-Type: application/x-www-form-urlencoded' -H 'Origin: http://178.128.40.63:32176' -H 'Connection: keep-alive' -H 'Referer: http://178.128.40.63:32176/' -H 'Cookie: PHPSESSID=lq074lrkvu1b214h4io3ifqdi0' -H 'Upgrade-Insecure-Requests: 1' --data-raw 'hash=%7D%7D%7D%7D%7D'

# data = hash=$thehash
# header = 
# 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101 Firefox/78.0'
# 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8'
# 'Accept-Language: en-US,en;q=0.5' --compressed
# 'Content-Type: application/x-www-form-urlencoded'
# 'Origin: http://178.128.40.63:32176'
# 'Connection: keep-alive'
# 'Referer: http://178.128.40.63:32176/'
# 'Cookie: PHPSESSID=lq074lrkvu1b214h4io3ifqdi0' 
# 'Upgrade-Insecure-Requests: 1' 

import requests
from bs4 import BeautifulSoup as BS

headers = {
        'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101 Firefox/78.0',
        'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
        'Accept-Language': 'en-US,en;q=0.5',
        'Content-Type': 'application/x-www-form-urlencoded',
        'Origin':'http://178.128.40.63:32176',
        'Connection':'keep-alive' ,
        'Referer': 'http://178.128.40.63:32176/',
        'Cookie': 'PHPSESSID=lq074lrkvu1b214h4io3ifqdi0',
        'Upgrade-Insecure-Requests': '1' 
}

r = requests.get('http://178.128.40.63:32176/?',headers=headers)
htmlConetent = r.content
soup = BS(htmlConetent,'html.parser')
print(b"feedback"+r.content)
print()
MD5strings = str(soup.select('h3'))

# delete the begin and end
print(MD5strings[20:-6])

while 1:
    MD5strings = str(MD5strings[20:-6])

    import hashlib

    md5value = hashlib.md5(MD5strings.encode())
    print("md5 encrpt")
    print(md5value.hexdigest())
    print()
    data={ 'hash':md5value.hexdigest() }
    print(data)
    print()
    back = requests.post("http://178.128.40.63:32176",headers=headers,data=data)
    print("back html = ",end="")
    print(back.content)
    
    soup = BS(back.content,'html.parser')
    
    MD5strings = str(soup.select('h3'))












