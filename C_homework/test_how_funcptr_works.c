#include<stdio.h>

int foo(void){
	printf("qq\n");
	return 0;
}
main(){
	int (*pointer)() = foo; //int (*pointer)(void) = foo;
	printf("void \n");
	printf("%%d is %d \n",pointer);
	printf("%%p is %p \n",pointer);
	printf("%%x is %x \n",pointer);
	printf("%%X is %X \n",pointer);
	printf("%%d of func back is %d (fail one) \n",*pointer);
	printf("%d is really back \n",pointer());
	int x = pointer();
}
