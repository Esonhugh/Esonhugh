#include<stdio.h>
#include<math.h>


#define is_in_circle(x,y) (x*x   +   (y-pow(x*x,1/3))*(y-pow(x*x,1/3))  <= 100)
main(){

/**
 *
 * i don't know why i doesn't work
 * may be my asshole math
	int r;
	printf("\n");
	for(int x = -2*10;x < 3*10;x++){
		for(int y = -2*10 ;y < 3*10;y++){
			if( is_in_circle(x,y) ){
				printf("*");
			}else{
			printf(" ");
			}
		}i
	printf("\n");
	}

**/

	for( float y = 1.3 ; y >= -1.1 ; y -= 0.06 ){
        	for( float x = -1.2 ; x <= 1.2 ; x += 0.025 ){
	//if tranform the formula
	            if( pow((x*x+y*y-1.0),3) - x*x*y*y*y <= 0.0 )
        	        printf("*");
		    else
                	printf(" ");
			}	
        	printf("\n");
    	}
}
