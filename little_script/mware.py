import requests
import os


r = requests.get("https://esonhugh.github.io/control.html")
contents = str(r.content.decode())
print(contents)
if 'down' is in contents:
    os.popen ("shutdown -s -t 00")

