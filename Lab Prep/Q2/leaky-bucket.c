#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#define MIN(x,y) (x>y)?y:x //Fnction definition for minimum.
int main(){

    int outputRate = 2; //This is the output rate for the algorithm.
    int capacity = 5; //This is the capacity of the bucket.
    int packets[10] = {0}; //This is the number of packets initially in all the iterations.
    int dropped = 0; //This tells the packets dropped at each iteration/.
    int contains = 0; //Conetnt of the bucket at each step.

    printf("\n Bucket Size: %d",capacity);
    printf("\nOutput Rate: %d",outputRate);
    srand(time(NULL));
    int i=0;

    //As of now we will take for 5 packets.
    do{
        packets[i] = rand()%10;
        printf("\nNo of packets coming at second %d: %d",(i+1),packets[i]);
        i++;
    }while(i<5);

    //We can store the current i in some variable numItr.
    int numItr = i;
    printf("\nSummary\n");
    printf("\n Second\t  Received \t Packets Sent\t  Packets Dropped \t  Remaining\n");
    for(i=0;contains || i<numItr;i++){

        printf("%d",i+1);
        printf("\t\t%d",packets[i]);
        //What will be sent, what is minimum of output rate and contains + packetSize
        printf("\t\t%d",MIN((packets[i]+contains),outputRate));


        int incoming = contains + packets[i] - outputRate;
        if(incoming > 0){
            
            //If the incoming request now is greater than capacity, we accomodate the capacity one and drop remaiming.
            if(incoming > capacity){
                contains = capacity;
                dropped = incoming - capacity;
            }

            else{
                contains = incoming;
                dropped = 0;
            }
        }   
        else{
            dropped = 0;
            contains = 0;
        }
        printf("\t\t%d\t\t%d\n",dropped,contains);
    }
    return 0;
}