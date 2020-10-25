#include<stdio.h>

void blank_print(int);
void star_print(int);

main(){
	int tr_side_length;
	scanf("%d",&tr_side_length);
	int line_num = ( tr_side_length + 1 )/2;
	for(int current_line = 0 ; current_line < line_num ; current_line ++){
		blank_print( (tr_side_length - (2*current_line+1) )/2 );
		star_print( 2*current_line + 1 );
		blank_print( (tr_side_length - (2*current_line+1) )/2 );
		printf("\n");
	}

}





void blank_print(int num){
	for(int i = 0;i < num;i++){
		printf(" ");
	}

}

void star_print(int num){
	for(int i = 0;i < num;i++){
		printf("*");
	}
}
