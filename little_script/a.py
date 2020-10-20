target_info ={
        "ip":"192.168.0.0",
        "port":"8080"
        }
print(target_info)
print(target_info["ip"])

print()
print()
key_numbers = len(list(target_info))
print(key_numbers)
for Keys in range(0,key_numbers):
    print(list(target_info)[Keys])

print(target_info.keys())

print('port' in target_info.keys() and 'ip' in  target_info.keys())
print('port' in target_info.keys())

