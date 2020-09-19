*HTB FRIST EXPERIENCE ABOUT THE HOST SAUNA*
**host = 10.10.10.175**
nmap -sV host

resul:

Starting Nmap 7.80 ( https://nmap.org ) at 2020-07-15 10:24 CST
Nmap scan report for 10.10.10.175
Host is up (0.44s latency).
Not shown: 988 filtered ports
PORT     STATE SERVICE       VERSION
53/tcp   open  domain?
80/tcp   open  http          Microsoft IIS httpd 10.0
88/tcp   open  kerberos-sec  Microsoft Windows Kerberos (server time: 2020-07-15 09:29:49Z)
135/tcp  open  msrpc         Microsoft Windows RPC
139/tcp  open  netbios-ssn   Microsoft Windows netbios-ssn (highlight)
389/tcp  open  ldap          Microsoft Windows Active Directory LDAP (Domain: EGOTISTICAL-BANK.LOCAL0., Site: Default-First-Site-Name)
445/tcp  open  microsoft-ds?
464/tcp  open  kpasswd5?
593/tcp  open  ncacn_http    Microsoft Windows RPC over HTTP 1.0 (highlight)
636/tcp  open  tcpwrapped
3268/tcp open  ldap          Microsoft Windows Active Directory LDAP (Domain: EGOTISTICAL-BANK.LOCAL0., Site: Default-First-Site-Name)
3269/tcp open  tcpwrapped


1 service unrecognized despite returning data. If you know the service/version, please submit the following fingerprint at https://nmap.org/cgi-bin/submit.cgi?new-service :
SF-Port53-TCP:V=7.80%I=7%D=7/15%Time=5F0E6909%P=x86_64-apple-darwin19.0.0%
SF:r(DNSVersionBindReqTCP,20,"\0\x1e\0\x06\x81\x04\0\x01\0\0\0\0\0\0\x07ve
SF:rsion\x04bind\0\0\x10\0\x03");
Service Info: Host: SAUNA; OS: Windows; CPE: cpe:/o:microsoft:windows

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ 
Nmap done: 1 IP address (1 host up) scanned in 146.56 seconds



**notes**

overall is the nmap scanner report

netbios is open.seen?
or i need see it website
10.10.10.175:80 is.

it is a e-money bank website seems vulnerable.
{what}
-???-


