#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include<time.h>

#define N strlen(g)
char td[30]; ///This is for storing the dataword.
char cs[30]; //This stores the codeword.
char g[] = "1001"; //This is for the genrating polynomial.
int a; //This tells the length of the dataword.
int e,c; //These are some variables used with lops.

//This simply performs an xor operation 
void xor() {
;
    for(int i=1;i<N;i++){
        cs[i] = ((cs[i] == g[i]) ? '0' :'1');
    }
}

void crc() {


    //What this function will do is basically extract the 4 digitd from the sent dataword firstand put it in cs.
    for(int e=0;e<N;e++){
        cs[e] = td[e];
    }
    
    //NOw, when we got this, we need to perform the division.
    do{

        if(cs[0] == '1'){
            xor();
        }

        for(c=0;c<N-1;c++){
            cs[c] = cs[c+1];
        }
        cs[c] = td[e++];
    }while(e<=a+N-1);
}

int main(){

    printf("\n Enter the dataword:\t");
    scanf("%s",td);

    a = strlen(td);

    for(int i=a;i<a+N-1;i++){
        td[i] = '0';
    }
    printf("\n The padded data is  is %s",td);

    crc();

    for(int i=a;i<a+N-1;i++){
        td[i] = cs[i-a];
    }
    printf("\n The CRC is %s",cs);
    printf("\n The data that is sent is %s",td);

    printf("\n Enter 1 if you want to introduce an error or press 0");
    int ch;
    scanf("%d",&ch);

    if(ch == 1){

        srand(time(NULL));
        int pos = rand()%a;
        td[pos] = ((td[pos] == '0') ? '1' : '0');
    }
    crc();
    int i=0;
    for(i=0;i<N-1 && (cs[i] != '1');i++){
        printf("\n checking...");
    }
    if(i<N-1){
        printf("\nError detected!");
    }
    else{
        printf("\n No error detected");
    }
    return 0;
}