#include<stdio.h>
#include<math.h>
#include<strings.h>

double c_convert_i(char x){
	int back;
	switch(x){
	case '1':back = 1;break;
	case '2':back = 2;break;
	case '3':back = 3;break;
	case '4':back = 4;break;
	case '5':back = 5;break;
	case '6':back = 6;break;
	case '7':back = 7;break;
	case '8':back = 8;break;
	case '9':back = 9;break;
	case 'a':back = 10;break;
	case 'b':back = 11;break;
	case 'c':back = 12;break;
	case 'd':back = 13;break;
	case 'e':back = 14;break;
	case 'f':back = 15;break;
	default :back = 0;break;
	}
	double back_1 = back*1.0;
	return (back_1);
}

char num_in[3][10];
main(){
	scanf("%s + %s = %s",num_in[0],num_in[1],num_in[2]);
	//printf("%s + %s = %s",num_in[0],num_in[1],num_in[2]);

	//debug 
	//printf("%c",num_in[0][0]);
	//tranf string to int
	
	for(int digit = 2 ; digit < 17 ; digit ++){
		
		int sum[3];
		//porcess
		//the x number
		for(int num_locx = 0;num_locx <3;num_locx++){
			sum[num_locx] = 0;
			
			int num_len = strlen(num_in[num_locx]);
			
			//debug
			//printf("%d is length %d \n",num_locx,num_len);
			
			//the y word and go sum
			for(int num_locy = 0;num_locy <10;num_locy++){
				
				double each_num = c_convert_i(num_in[num_locx][num_locy]);
				if(each_num >= digit) each_num = 0;
				each_num *= pow(digit, num_len - num_locy);
				
				//debug
				//printf("%dth word in %d number is %lf in mode %d \n",num_locy,num_locx,each_num,digit);

				sum[num_locx] += each_num;
			}
		}
		if( sum[0] + sum[1] == sum[2] ){
			printf("key is %d mode \n",digit);
		}
	}

}




/**	
	for(int digit = 2 ; digit <= 16 ; digit ++){
		
		int after[3];
		
		for(int num_loc = 0 ; num_loc < 3 ; num_loc++){
		after[num_loc] = To_DEC ( num_loc , digit , num_in[num_loc] );
		printf("%d %d \n",num_loc,after[num_loc]);
		}
		
		if(after[0] + after[1] == after[2]){
			printf("key is %d mode",digit);
		}
	}
**/



