'''
本题要求编写程序，针对输入的N个字符串，输出其中最长的字符串。

输入格式：
输入第一行给出正整数N；随后N行，每行给出一个长度小于80的非空字符串，其中不会出现换行符，空格，制表符。
'''

arrayNum = input("")
maxSrting = ""
for i in range(0,int(arrayNum)):
    nowString = input()
    if len(nowString) > len(maxSrting):
        maxSrting = nowString
    
print("The longest is: "+maxSrting)
