#include<stdio.h>
#define is_in_circle(x,y,r) (x-r)*(x-r)+(y-r)*(y-r)/4.0<=r*r*1.0
#define is_in_circle2(x,y,r) (x-r)*(x-r)+(y-r)*(y-r)/4.0>=(r-1)*(r-1)*1.0

main(){
	int r;
	
	printf("r = ");
	scanf("%d",&r);
	printf("\n");

	for(int x = -2*r;x < 3*r;x++){
		for(int y = -2*r ;y < 3*r;y++){
			if( is_in_circle(x,y,r) && is_in_circle2(x,y,r) ){
				printf("*");
			}else{
			printf(" ");
			}
		}
	printf("\n");
	}
}
