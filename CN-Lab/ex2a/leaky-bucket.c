//This is the implementation of the leaky bucket algorithm!

#include<stdio.h>
#include<stdlib.h>
#include<time.h>

#define MAXPACKETS 10

void leakybucket(int bufferMax, int outRate){

    int curr_packet; //We generate this randomly.
    int buffersize = 0; // The current buffersize(utilized) at each step when packet is sent

    srand(time(NULL));
    /*
        Lets break the above function and understand what is it doing.
        time(NULL) -- > This just returns the current time from Jan 1, 1970, C standard.
        when u wrap it inside srand(), what basically happens is 
                        -
                    -       -
                rand()      srand()
        rand() ->   This will generate the same sequence of numbers evertime the program is being run.
        srand() ->  The srand() function sets its argument as the seed for a  new  sequence of  pseudo-random  integers  to be returned by rand().  These sequences
                    are repeatable by calling srand() with the same seed value.  
     
            srand(time(NULL)) this will basically give unique values everytime. So, that we get different values whenever we run the program each time.
     */
    int pmax = bufferMax + 0.3*bufferMax; //Just a relation so that we can choose random packet size. We can do the same also with the randomize function, but book mein diya hai toh karlo.

    for(int i=0;i<MAXPACKETS;i++){
        printf("\n------------------------------------------");
        printf("\nIncoming packet size:\t");
        curr_packet = rand()%pmax + 10; //Random way to generate a random packet size. Better we can do using the random(1000) function!!

        printf("%d",curr_packet);

        //We will add this packet to the current buffer we maintain.
        if(curr_packet+buffersize > bufferMax) {
            //This is obviouly not a valid case, as we are exceeding the Maximum buffer size.
            //Basically, this is the case of overflow and we simply drop the packet!!
            printf("\nInsufficient space: Packet Dropped.");
        }

        else{
            printf("\nPackets Added with size: %d",curr_packet);
            //Adding that so that we know how much do we have in our current buffer.
            buffersize += curr_packet;
        }
        printf("\nSize of buffer now: %d\n",buffersize);

        //Till now all we have done is to randomly generate the packet and add it to the buffer.
        //Now we will continue sending it.
        printf("\n");
        //Consider that the buffer is empty, we don't need to send anything.
        if(!buffersize){
            printf("\nBuffer Empty!");
        }

        // This is if the rate is greater than the output rate, we will send in chunks.
        if(buffersize >= outRate){
            buffersize -= outRate;
            printf("\n%d bytes sent",outRate);
        }
        else{
            //obviouly we will send all, as this is less than the rate only.
            printf("%d bytes sent",buffersize);
            buffersize = 0;
        }
        printf("\n------------------------------------------\n");
    }

    //We are done with 10 packets adding and sending above as in the loop, but obviously there will be some buffer left, now as leaky bucket
    //promises the constant flow of packets, we will send the remainaing buffer according to the output rate one by one and so on..
 
    //We will do this till the buffersize is not zero.
    while(buffersize){
        if(buffersize >= outRate){
            //We decrease the buffer size.
            buffersize -= outRate;
            printf("\n%d bytes sent",outRate);
        }
        else{
            printf("\n%d bytes sent",buffersize);
            //As this will be the only data to send, and it is sent now, we will set it to zero.
            buffersize = 0;
        }
        //At every step, we will print the current buffer size.
        printf("\n Size of Buffer:%d",buffersize);
    }
    //Everything will be done now when it comes out of the loop, and we write as no more data.
    printf("\n No more data!!");
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