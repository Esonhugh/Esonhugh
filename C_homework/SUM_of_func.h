double SUM_of_func(double (*funcptr)(double), double UP_size , double DOWN_size){
	
	//设置积分标志位
	int sign = 0;
	if(UP_size < DOWN_size){
		double temp;
		UP_size = temp;UP_size = DOWN_size;DOWN_size = temp; //swap UP and DOWN size
		sign = 1;
	}
	
	//初始化 间隔数 积分总和 每一块积分的dx
	double gap_num = 1000000;
	double sum = 0.0;
	double each_gap = (UP_size - DOWN_size)/gap_num/1.0;
	
	//积分开始
	for( double i = DOWN_size ; i < UP_size ; i += each_gap )
		sum += ( each_gap * ( funcptr(i) + funcptr(i+each_gap) )/2 );
	
	//func back
	if(sign){
		return(sum);
	}else{
		return(-sum);
	}

}

