=begin
本题要求对任意给定的一位正整数N，输出从1*1到N*N的部分口诀表。

输入格式：
输入在一行中给出一个正整数N（1≤N≤9）。

输出格式：
输出下三角N*N部分口诀表，其中等号右边数字占4位、左对齐。
=end
Num = gets
(1..Num.to_i).each do |eachloop|
    (1..eachloop).each do |eachline|
        print "#{eachline}*#{eachloop}=#{(eachloop*eachline).to_s.ljust(4)}"
    end
    puts ""
end

=begin 
本题要求编写程序，将给定字符串中的字符，按照ASCII码顺序从小到大排序后输出。
=end
strYouInput = gets
strYouInput.delete!("\n")
array = strYouInput.bytes
arr = array.sort
arr.each do |eachChar|
print "#{eachChar.chr}"
end

=begin
给定N个职员的信息，包括姓名、基本工资、浮动工资和支出，要求编写程序顺序输出每位职员的姓名和实发工资（实发工资=基本工资+浮动工资-支出）。

输入格式：
输入在一行中给出正整数N。随后N行，每行给出一位职员的信息，格式为“姓名 基本工资 浮动工资 支出”，中间以空格分隔。其中“姓名”为长度小于10的不包含空白字符的非空字符串，其他输入、输出保证在单精度范围内。

输出格式：
按照输入顺序，每行输出一位职员的姓名和实发工资，间隔一个空格，工资保留2位小数。
=end
def calc(moneyBase,moneyFloat,moneyPay)
    return moneyBase+moneyFloat-moneyPay
end
numOfworkers = gets
(1..numOfworkers.to_i).each do |worker|
    line = gets
    workInfo = line.split(" ")
    name = workInfo[0]
    moneyBase = workInfo[1].to_f
    moneyFloat = workInfo[2].to_f
    moneyPay = workInfo[3].to_f
    money=calc(moneyBase,moneyFloat,moneyPay)
    puts "#{name} #{format('%.2f',money)}"
end






