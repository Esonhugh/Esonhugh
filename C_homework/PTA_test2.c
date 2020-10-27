
本题要求编写程序，计算序列 1 + 1/3 + 1/5 + ... 的前N项之和。

#include<stdio.h>
int main(){
    int input;
    scanf("%d",&input);
    int i = 0;
    double sum = 0.0;
    for(;i < input;i++){
        sum += 1.0/(2*i+1);
    }
    printf("sum = %.6f",sum);
    return 0;
}


input year in 21 century
逐行输出满足条件的所有闰年年份，即每个年份占一行。输入若非21世纪的年份则输出"Invalid year!"。若不存在任何闰年，则输出“None”
#include<stdio.h>

#define is_luna(year) ((year % 400 == 0)||((year % 100 != 0)&&(year % 4 == 0)  ))

int main(){
int end_year;
scanf("%d",&end_year);
int year = 2001;
if(2000 < end_year && end_year < 2101){
	for(;year <= end_year;year ++){
		if( is_luna(year) ){
		printf("%d\n",year);
        }
    }
    if(end_year < 2004){
    printf("None");
    }
}else{
printf("Invalid year!");
}

return 0;
}


本题要求编写程序，判断一个给定的三位数是否为水仙花数。三位水仙花数，即其个位、十位、百位数字的立方和等于该数本身。

如果N是水仙花数，则在一行中输出Yes，否则输出No。如果N不是三位数，则输出Invalid Value.。


#include<stdio.h>


int main(){

	int flower;
	scanf("%d",&flower);
	if( 100 <= flower && flower < 1000){
		int g = flower % 10;
		int s = ((int)flower / (int)10) % 10;
		int b = (int)flower / (int)100;
		g = g*g*g;
		s = s*s*s;
		b = b*b*b;
		if(flower == g+s+b){
			printf("Yes");
		}else{
			printf("No");
		}
	}else{

		printf("Invalid Value.");
	}

return 0;
}




在一行中将3个整数从小到大输出，其间以“->”相连。


#include<stdio.h>
#define swap(a,b) a=a+b;b=a-b;a=a-b;
/**
int main(){

	int num[3];
	scanf("%d%d%d",&num[0],&num[1],&num[2]);
	int max=num[0];
	int i=0;
	if(max > num[1]) max = num[1],i=1;
	if(max > num[2]) max = num[2],i=2;
	int min=num[0];
	int i1=0;
	if(max < num[1]) min = num[1],i1=1;
	if(max < num[2]) min = num[2],i1=2;
	int i2=0;
	int middle;
	for(;i2 < 3;i2++){
	if(i2 != i1 && i2 != i) middle=num[i2];
	}

	printf("%d->%d->%d\n",max,middle,min);



return 0;
}
**/

#include<stdio.h>

int main()
{
    int a,b,c,max,mid,min;
    scanf("%d %d %d",&a,&b,&c);
    if(a>b){
        max=a;
        min=b;
    }
    else{
        max = b;
        min = a;
    }
    if(c>max){
        mid = max;
        max = c;
    }
    if(c<max){
        if(c>min){
            mid = c;
        }
        else{
            mid = min;
            min = c;
        }
    }
    printf("%d->%d->%d",min,mid,max);
}


一元二次求根

根据系数情况，输出不同结果：

1)如果方程有两个不相等的实数根，则每行输出一个根，先大后小；

2)如果方程有两个不相等复数根，则每行按照格式“实部+虚部i”输出一个根，先输出虚部为正的，后输出虚部为负的；

3)如果方程只有一个根，则直接输出此根；

4)如果系数都为0，则输出"Zero Equation"；

5)如果a和b为0，c不为0，则输出"Not An Equation"。


#include<stdio.h>
#include<math.h>
#define swap(a,b) int temp;temp = a;a = b;b = temp
int main(){
	double a,b,c;
	scanf("%lf%lf%lf",&a,&b,&c);
	
	if(a != 0){
		double deta = b*b - 4*a*c;
		if(deta > 0){
			double x1 = (-b + sqrt(deta) )/(2*a/1.0);
			double x2 = (-b - sqrt(deta) )/(2*a/1.0);
			if(x1 < x2){
			swap(x1,x2);
			}
			printf("%.2f\n%.2f",x1,x2);
		}else if(deta == 0){
			double x = -b / (2.0*a);
			if(x == 0){
			x=fabs(x);
			}
			printf("%.2f",x);
		}else{
			double x = -b/(2.0*a);
			double ix = (sqrt(-deta))/(2.0*a);
            if(ix <= 0) ix=fabs(ix);
		    if(x == 0) x=fabs(x);
			printf("%.2f+%.2fi\n%.2f-%.2fi",x,ix,x,ix);
		}
	}else{
		if(b==0){
			if(c ==0){
				printf("Zero Equation");
			}else{
				printf("Not An Equation");
			}
		}else{
			printf("%.2f",-c/(b/1.0));
		}
	}

return 0;
}
