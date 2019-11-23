
/*
    @Author: Raghav M.
    @Information sc, MSRIT.
    
     In this program, the goal is to show the error detection technique for data transfer in unreliable network 
    using CRC (Cyclic Redundancy Check technique) 

    Enter the data:	10011101000

    Generating Polynomial:	 1001
    Padded data is: 10011101000000
    
    Checksum is 100
    
    Final codeword is 10011101000100
    
    Want to test error detection. Press 0 for yes and 1 for no:	0
    
    Enter the position where you want to insert the error.:	6
    
    Erroneous data: 10011001000100
    
    Error detected



 */

#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include<time.h>

#define N strlen(g)  //We define it to get the number of digits in the divisor, because according to the CRC method, we will then add N-1 zeros.

char td[30]; //This is a character array that stores the dataword.
char cs[30]; //This basically stores the checksum.

char g[] = "1001"; //This is the generator polynomial.
int a; //We will use this to store the length of the dataword.
int e,c ; //Both these variables we will use in our loops.

void xor(){

    //All this function is doing is, it is performing the xor operation from the index 1 to N-1.
    for(c=1;c<N;c++){
        cs[c] = ((cs[c] == g[c]) ? '0' : '1');
        /* The above is very simple if the value (corresponsing) in generating poly and the cs is same. We get a zero, otherwise we get a 1.
            o ^ 0 = 0
            1 ^ 1 = 0
            0 ^ 1 = 1
            1 ^ 0 = 1
        */ 
    }
}


void crc(){
    /*
        All this function will do is divide the dataword by the generating polynomial and then store the final checksum
        in the CS. That is the aim of this function. Following steps may be the perfect explanation for the code.

        1. Copy n digits of the dataword with padding to the cs, so that it can be xored by the Generating polynomial.
        2. After this is done, if the first digit is 1, simply xor it and then shift the digits one by one to the as we do in usual division.
        3. After shifting, as now 0th position will be held by 1st one and so on, we add one more word from the original dataword. 
        4. We continue on doing the same till we reach the end of the data word.
        
        ** Ab ek important baat, if pehla digit zero hai, it just means skipping xor and going forward with the procedure.
     */

    for(e=0;e<N;e++){
        cs[e] =  td[e]; //This is just doing the Step 1. (Copying N digits to the cs)
    }
    //Now, we have to repeatedly do the XOR operation, so obviously we will use a loop. A do while loop, because 
    //Obviously, it will run at least once.
    do{
        if(cs[0] == '1'){
            xor(); //Calling the function, this will just xor digits from index 1 to n.
        }
        //The below for loop will just shift the bits in the cs array.
        for(c=0;c<N-1;c++){
            cs[c] = cs[c+1];
        }
        //As we pushed element at the 0th place out, let's add the last bit from the dataword.
        cs[c] = td[e++];
    }while(e <= a+N-1); //We will do this, till we have reached the last of the data with the padding.

}

int main(){
    
    //The first step, we will od is take the dataword.
    printf("\nEnter the data:\t");
    scanf("%s",td); //We will get the data in td.

    printf("\nGenerating Polynomial:\t %s",g); //We can even take this at even run time from the user.
    
    a = strlen(td); //This is used to store the length of the dataword.

    //Now, as we know in the method, we append (N-1) zero's to the dataword, where N is the length of the Generating polynomial.
    //We will start from a(last index of td) and will go on till (a+N-1) as we want to add n-1 zeros.

    for(e=a;e<a+N-1;e++){
        td[e] = '0';
    }

    //The above step will give us the data with the padding added. So, we can write the codeword as.
    printf("\nPadded data is: %s",td);

    //Now, after we have the padded data, hmara agla step is to basically, calculate the checksum and all we have to do is, call the 
    //crc function we created.
    crc(); //This step will calculate the checksum.All we have to do is implement that division logic in this function.

    //Now, we can print that checksum.
    printf("\nChecksum is %s",cs);

    //So, as the usual step we perform, all we do is change the data we padded with the checksum we received.
    //We will do that with the following for loop. Again we will start from a and end at a+N-1 as described above.

    for(e=a;e<a+N-1;e++){
        td[e] = cs[e-a]; //We are just putting the checksum we have in place of the padding we had put earlier in td(data).
    }

    //After doing the above step, we get the final codeword. Lets just print it.
    printf("\nFinal codeword is %s",td);

    /*
        Now, the process of generating the codeword is done. Now, we have to check for the error detection.

        1. First we will insert an error into the final codeword we get.
            -- We will basically ask the user to enter the position where he wanna add the error, We will just flip the 
                bits at that location.
        2. After we insert the error, we again call the checksum function and just check if the checksum after the data modification(Data sent in rela sense)
            -- If the checksum differs, it means the error is detected, else if we get all zero's now, this implies, that
                the data is transferred correctly and no more modifications needs to be done.
    */

   printf("\nWant to test error detection. Press 0 for yes and 1 for no:\t");
    scanf("%d",&e);

    if(e == 0){
        //We will ask the user where to insert the faulty bit till he gives a number between 0 and a+n-1.
        
        srand(time(0));
        int pos=rand()%a;
        td[pos] = ((td[pos] == '0') ? '1' : '0'); //Here, we simply change the bit to 0 if it is 1 and to 1 if it is 0. 

        printf("\n Erroneous data: %s",td); //We will just print the erroneous data.
    }

    crc(); //We will simply call the CRC functionand again calculate the checksum for the new modified word.
            //If it results in all 0's, no error, otherwise we have an error.

    //Now, we will check the checksum, it should have all zero's as mentioned above.
    //If it has, we will keep on incrementing the value of e, and as soon as we encounter a value of 1, we come out of loop (If this is the case, e value won't reach N-1 right, as beech mein hi bahar aa gye.)

    for(e=0;(e<N-1) && (cs[e] != '1');e++){
        printf("\n Checking... "); //It won't enter the loop if it encounters a 1.
    }

    if(e<N-1){
        printf("\nError detected\n\n");
    }
    else{
        printf("\n No error detected.");
    }
    return 0;
    
}   
