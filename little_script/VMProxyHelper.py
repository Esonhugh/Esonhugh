#!/bin/env python3

import os
import sys
import re

argvNumber = len(sys.argv)

class ProxySetting:
    def __init__( self,ip="192.168.31.25",port=7890 ):
        self.ipAddr = ip
        self.port = port
        self.socks5 = "socks5://%s:%s/"%(ip,str(port))
        self.socks4 = "socks4://%s:%s/"%(ip,str(port))
        self.http = "http://%s:%s/"%(ip,str(port))
        self.https = "http://%s:%s/"%(ip,str(port))
        self.all = "socks5://%s:%s/"%(ip,str(port))

    def changeip(self,ipTobe):
        self.__init__(ipTobe,self.port)

    def changeport(self,portTobe):
        self.__init__(self.ip,portTobe)
    
yourProxy = ProxySetting()

if argvNumber == 1:
    #default and auto get the env
    noProxyFlag = 0
    envVar=[os.getenv("http_proxy",default="No Proxy"),
            os.getenv("https_proxy",default="No Proxy"),
            os.getenv("socks_proxy",default="No Proxy"),
            os.getenv("all_proxy",default="No Proxy")
            ]

    for i in range(4):
        if 'No Proxy' != envVar[i]:
            print("detected the "+ envVar[i] +"in System environment")
        else:
            noProxyFlag += 1
    if noProxyFlag == 4:
        print("No available is detected")

def exportEnv(yourProxy:object):
    pattern = "export %s='%s'"
    os.system( pattern%("https_proxy",str(yourProxy.https))     )
    os.system( pattern%("http_proxy",str(yourProxy.http))       ) 
    os.system( pattern%("socks_proxy",str(yourProxy.all))       )
    os.system( pattern%("socks4_proxy",str(yourProxy.socks4))   )
    os.system( pattern%("socks5_proxy",str(yourProxy.socks5))   )
    os.system( pattern%("all_proxy",str(yourProxy.all))         )
    print("export success")

def exportEnv(yourProxy):
    os.putenv( "https_proxy",str(yourProxy.https)       )
    os.putenv( "http_proxy",str(yourProxy.http)         ) 
    os.putenv( "socks_proxy",str(yourProxy.all)         )
    os.putenv( "socks4_proxy",str(yourProxy.socks4)     )
    os.putenv( "socks5_proxy",str(yourProxy.socks5)     )
    os.putenv( "all_proxy",str(yourProxy.all)           )
    print("export success")









if argvNumber == 2:
    #got one param
    param = sys.argv[1]
    if param == "on":
        exportEnv(yourProxy)
    elif param == "off":
        os.unsetenv("https_proxy")
        os.unsetenv("http_proxy")
        os.unsetenv("socks_proxy")
        os.unsetenv("socks4_proxy")
        os.unsetenv("socks5_proxy")
        os.unsetenv("all_proxy")
        print("unset success")
    elif param == "status":
        print(os.popen("export|grep proxy").read())
    else:
        print("wrong command")
#ip format checker
def ipMatcher(ip:str): 
    pattern = "^[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}"
    ipMatchedResult = re.match(pattern,ip).group(0)
    flag = True
    if ip != ipMatchedResult:
        flag = False
    for num in ipMatchedResult.split("."):
        if int(num) > 255 or int(num) < 0:
            flag = False
    return(flag)


if argvNumber  == 3:
    whatToChange = sys.argv[1]
    toChangeWhat = sys.argv[2]
    
    if whatToChange == "ip" and ipMatcher(toChangeWhat):
        yourProxy.changeip(toChangeWhat)
        exportEnv(yourProxy)
    elif whatToChange == "port" and (int(toChangeWhat) in range(1,65535)):
        yourProxy.changeport(toChangeWhat)
        exportEnv(yourProxy)
    else:
        print("wrong command")
