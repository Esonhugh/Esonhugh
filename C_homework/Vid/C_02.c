#include<stdio.h>


#define angle_h (360/12)
#define angle_l (360/60)

main(){
	int start_h; //钟表时间（小时）
	int start_l; //（分钟）

	int now_h; //现在时间（小时）
	int now_l; //（分钟）

	scanf("%2d:%2d %2d:%2d",&start_h,&start_l,&now_h,&now_l);

	printf("starting time is %2d:%2d\n",start_h,start_l);
	printf("now time is %2d:%2d\n",now_h,now_l);
/**
	//calc angle
	int h_angle = 0;
	int l_angle = 0;
	if(now_h >= start_h)
		h_angle = (now_h - start_h)*angle_h;
	else
		h_angle = 

	if(now_l >= start_l)
		l_angle = (now_l - start_l)*angle_h;
	
	printf("%d %d",h_angle,l_angle);
**/
	if(now_h < start_h){
	now_h += 12;
	}
	if(now_l < start_l){
	now_l += 60;
	}
	int h_angle_result = (now_h - start_h)*angle_h;
	int l_angle_result = (now_l - start_l)*angle_l;
	
	printf("%d %d\n",h_angle_result,l_angle_result);


}
