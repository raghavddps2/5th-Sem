#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#include<string.h>
#define N strlen(g)

char td[20];
char cs[20];
char g[] = "1001";
int a;
void xor(){

    for(int k=1;k<N;k++){
        cs[k] = ((cs[k] == g[k]) ? '0' : '1');
    }
}

void crc(){ 

    int i,e;

    //step 1, we will copy the first 4 to cs.
    for(e=0;e<N;e++){
        cs[e] = td[e];
    }
    
    do{
        if(cs[0] == '1'){
            xor();
        }


        for(i=0;i<N-1;i++){
            cs[i] = cs[i+1]; 
        }
        cs[i] = td[e++];
    }while(e<=a+N-1);
    

}

int main(){

    printf("\nEnter the data you want to send");
    scanf("%s",td);

    printf("\nOriginal data is %s",td);
    a = strlen(td);
    //We will add n-1 zero's to the dataword.
    for(int e=a;e<a+N-1;e++){
        td[e] = '0';
    }
    printf("\nPadded data is %s",td);
    //We can call the crc method now.
    crc();
    printf("\nThec checksum is %s",cs);
    //We will get the checksum now in cs.
    for(int e=a;e<a+N-1;e++){
        td[e] = cs[e-a];
    }
    printf("\nThe modified data word is %s",td);

    printf("\nPress 0 if you want to intoduce an error");
    int ch;
    scanf("%d",&ch);

    if(ch == 0){
        srand(time(0));
        int pos = rand()%a;
        td[pos] = (td[pos] == '0') ? '1' : '0';
        printf("\n Erroneous data %s",td);
    }

    crc();
    printf("\n Checksum now: %s",cs); //should be zero in case of no error.
    int e;
    for( e=0;(e<N-1 && cs[e] != '1');e++){
        printf("\n Checking..");
    }

    if(e<N-1){
        printf("\nError detected");
    }
    else{
        printf("\n NO error detected");
    }
    return 0;
}