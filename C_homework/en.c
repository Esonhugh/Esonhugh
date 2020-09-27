#include<stdio.h>
#include<string.h>

#define MAXLINE 100

char *encrypt( char[] );

int main(){
	char str[200];
	
	printf("The source strings:");
	fgets(str,200,stdin);
	char *out;
//	encrypt(str);
	out = encrypt(str);
	printf("The final is %s",out);
	
	return 0;
}

char *encrypt(char strings[200]){
	int i=0;
	for (;strings[i] != '\0';i++){
		if(strings[i] == 'z'){
			strings[i] = 'a';
		}else{
			strings[i] = strings[i] + 1;
		}
	}
//	printf("%s\n",strings);
//	printf("%s in %p\n",strings[1],strings[1]);
//	printf("%s in %p\n",strings[0],strings[0]);
//	printf("The final is %s",strings);
	return strings;
}
