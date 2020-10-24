import os
str1 = {'ip':'192.168.0.0','port':'9090'}
Path = os.popen("pwd").read()
print (str1)
print (Path)
os.system("""vim """+Path[:-1]+"""/before <<EOF
:%s/<ip>/"""+str1['ip']+"""
:%s/<port>/"""+str1['port']+"""
:wq
EOF""")


