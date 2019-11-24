#include<stdio.h>
#include<time.h>
#include<stdlib.h>
#define MAX_PACKETS 10
void leakybucket(int bufferMax,int outputRate){

    int curr_pack_size = 0;
    int buffer_size = 0;

    int pmax = bufferMax + 0.3*bufferMax;
    srand(time(NULL));
    for(int i=0;i<MAX_PACKETS;i++){
        
        printf("\n--------------Packet %d -------------------------\n",(i+1));
        curr_pack_size = rand()%pmax + 10;
        printf("\n Packet size: %d",curr_pack_size);
        if(curr_pack_size + buffer_size > bufferMax){
            printf("\n Insufficient space, packet dropped");
        }
        else{
            buffer_size += curr_pack_size;
            printf("\nPackets added with size:\t%d",curr_pack_size);
        }
        printf("\nSize of buffer till now:\t%d",buffer_size);

        if(!buffer_size){
            printf("\nBuffer is empty");
        }
        if(buffer_size > outputRate){
            buffer_size -= outputRate;
            printf("\n%d bytes sent and %d bytes left\n",outputRate,buffer_size);
        }
        else{
            printf("\n%d bytes sent and buffer is empty now.\n",buffer_size);
            buffer_size = 0;
        }
    }

    //Paxckets are genrated but some buffer will be there.
    while(buffer_size){

        printf("\n --------------------------------------------------------\n");
        if(buffer_size >= outputRate){
            buffer_size -= outputRate;
            printf("\n%d bytes sent and %d bytes left",outputRate,buffer_size);
        }
        else{
            printf("%d bytes sent and buffer is empty now",buffer_size);
            buffer_size = 0;
        }

        printf("\nSize of buffer: %d",buffer_size);

    }
    printf("\n\nNo more data\n");
}

int main(){

    int bufferMax; //This is the Maximum allowed buffer size we have.
    int outRate; //This is the output flow rate we want to achieve.

    printf("\nEnter the Maximum Buffer:\t");
    scanf("%d",&bufferMax);

    printf("\nEnter the Output Rate:\t");
    scanf("%d",&outRate);

    //We just now pass the Maximum buffer allowed and the outPut rate to the leaky bucket algorithm function and it shows how the data is transferred.
    leakybucket(bufferMax,outRate);

    return 0;
}