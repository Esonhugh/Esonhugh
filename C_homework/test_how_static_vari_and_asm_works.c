#include<stdio.h>
int sub_func(){
	static int a = 1;
	a ++;
	return a;
}

main(){
	printf("%d\n",sub_func());
	__asm__("nop\n\t"
		"nop\n\t"
		"nop");
	printf("%d\n",sub_func());
	printf("%d\n",sub_func());

}
