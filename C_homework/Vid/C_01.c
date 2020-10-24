#include<stdio.h>
#include<string.h>

#define MAXLINE 200

//char *UP( char[] );
//char *DOWN( char[] );



//define to make code easy read;
#define is_uper(a)  (('A' <= a)&&(a <= 'Z'))
#define is_down(a)  (('a' <= a)&&(a <= 'z'))

char str[MAXLINE];

int main(){
	//get input
	printf("The source strings:");
	fgets(str,MAXLINE,stdin);
	printf("\n");
	
	//init 
	int number_of_uper = 0;
	int number_of_down = 0;
	
	//loop to check words number
	for(int counts = 0;counts <= 200;counts++){
		if( is_uper(str[counts]) ){
			number_of_uper ++;
		}else if( is_down(str[counts]) ){
			number_of_down ++;
		}
	}
	
	//printf for debug	
	printf("up is %d ""down is %d \n",number_of_uper,number_of_down);	
	
	//change words with different execute method
	if(number_of_uper < number_of_down){
		//downer process
		for(int i=0;str[i] != '\0';i--){
			if( is_uper(str[i]) ){
				str[i] = str[i] + 32;
			}
		}
	}else if(number_of_down <= number_of_uper){
		//upper process
		for (int i=0;str[i] != '\0';i++){
			if( is_down(str[i]) ){
				str[i] = str[i] - 32;
			}
		}
	}

	//process complete and get out put
	printf("The final is %s",str);
	return 0;
}


/**
char *UP(char strings[MAXLINE]){
	for (int i=1;strings[i] != '\0';i++){
		if(strings[i] <= && strings[i] >=){
			strings[i] = strings[i] + 32;
		}else{
		
		}
	}
	printf("The final is %s",strings);
	return strings;
}
char *DOWN(char strings[MAXLINE]){
	for(int i=1;strings[i] != '\0';i--){
		if(strings[i] <= && strings[i] ){
			strings[i] = strings[i] - 32;
		}else{
			
		}
	}
	printf("The final is %s\n");
	return strings;
}
**/
