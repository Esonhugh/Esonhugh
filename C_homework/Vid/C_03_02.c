#include<stdio.h>
#define is_in_circle(x,y,r) (x-r)*(x-r)+(y-r)*(y-r)<=r*r
main(){
	int r;
	printf("r = ");
	scanf("%d",&r);
	printf("\n");
	for(int x = 0;x<2*r;x++){
		for(int y =0;y<2*r;y++){
			if( is_in_circle(x,y,r) ){
				printf("*");
			}else{
			printf(" ");
			}
		}
	printf("\n");
	}
}
