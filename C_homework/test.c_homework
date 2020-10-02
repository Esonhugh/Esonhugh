给定一个华氏温度F，本题要求编写程序，计算对应的摄氏温度C。计算公式：C=5×(F−32)/9。题目保证输入与输出均在整型范围内。
#include<stdio.h>
main(){
    int temp;
    scanf("%d",&temp);
    printf("Celsius = %d",(5*(temp-32)/9));
}

本题要求编写程序，计算并输出2个正整数的和、差、积、商与余数。题目保证输入和输出全部在整型范围内。
#include<stdio.h>
main(){
    int num_A,num_B;
    scanf("%d%d",&num_A,&num_B);
    int result;
    result = num_A + num_B;
    printf("%d + %d = %d\n",num_A,num_B,result);
    result = num_A - num_B;
    printf("%d - %d = %d\n",num_A,num_B,result);
    result = num_A * num_B;
    printf("%d * %d = %d\n",num_A,num_B,result);
   // result = (num_A - num_A % num_B)/num_B;
    result = num_A / num_B;
    printf("%d / %d = %d\n",num_A,num_B,result);
    result = num_A % num_B;
    printf("%d %% %d = %d\n",num_A,num_B,result);
}

本题要求编写程序，计算4个整数的和与平均值。题目保证输入与输出均在整型范围内。
#include<stdio.h>
main(){
    int a[5],Sum = 0;
    scanf("%d%d%d%d",&a[1],&a[2],&a[3],&a[4]);
    for(int i=1;i<=4;i++){
        Sum = a[i] + Sum;
    }
    printf("Sum = %d; ",Sum);
    printf("Average = %.1f",Sum/4.0);
}


程序每次读入一个正3位数，然后输出按位逆序的数字。注意：当输入的数字含有结尾的0时，输出不应带有前导的0。比如输入700，输出应该是7。
#include<stdio.h>
main(){
    int number3;
    scanf("%d",&number3);
    int a[4];
    a[1] = number3 % 10;
    a[2] = (number3 % 100) /10;
    a[3] = number3 / 100;
    int result = a[1]*100 + a[2]*10 +a[3];
    printf("%d",result);
}


本题要求编写程序，计算华氏温度150°F对应的摄氏温度。计算公式：C=5×(F−32)/9，式中：C表示摄氏温度，F表示华氏温度，输出数据要求为整型。
本题目没有输入。
按照下列格式输出
fahr = 150, celsius = 计算所得摄氏温度的整数值
#include<stdio.h>
main(){
    int temp = 150;
    //scanf("%d",&temp);
    printf("fahr = %d, celsius = %d",temp,(5*(temp-32)/9));
}


这道超级简单的题目没有任何输入。
你只需要把这句很重要的话 —— I Love GPLT ——竖着输出就可以了。
所谓“竖着输出”，是指每个字符占一行（包括空格），即每行只能有1个字符和回车。
#include<stdio.h>
#define p(a) printf(a);\
            printf("\n");
main(){
    p("I")
    p(" ")
    p("L")
    p("o")
    p("v")
    p("e")
    p(" ")
    p("G")
    p("P")
    p("L")
    p("T")
}
