#include<stdio.h>
#include<stdlib.h>
int packets[10];
void main(){
	int orate = 2,capacity = 5,contain = 0,dropped=0;
	for (int i = 0; i < 5; ++i)
	{
		packets[i] = rand()%10;
	}

	printf("Iteration\tReceived\tSent\tDropped\tContains\n");
	for (int i = 0;contain || i < 5; ++i)
	{
		printf("%d",i );
		printf("\t\t%d",packets[i] );
		if(contain+packets[i]<orate)
			printf("\t\t%d",contain+packets[i] );//last iteration when the bucket is emptying with no incoming packets
		else
			printf("\t\t%d",orate);
		
		int incoming = contain+packets[i]-orate;
		if(incoming>0){
		
		if(incoming>capacity){
			contain = capacity;
			dropped = incoming - capacity;
		}
		else{
			contain = incoming;
			dropped = 0;
		}
	}
	else{
		dropped = 0;
		contain = 0;
	}
	printf("\t%d\t%d \n",dropped,contain);
	}
} 