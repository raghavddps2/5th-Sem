#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<time.h>


char data[100];

int generateChecksum(int mode,int checksum){

    int n;
    if(strlen(data)%2 == 0){
        n = strlen(data)/2;
    }
    else{
        n = (strlen(data)+1)/2;
    }
    int temp=0;
    int sum =0;

    for(int i=0;i<n;i++){
        temp = data[i*2];
        temp = temp*256 + data[i*2+1];
        printf("\n%x",temp);
        sum += temp;
    }

    if(mode == 1){
        printf("\n%x",checksum);
        sum += checksum;
    }

    if(sum%65536 != 0){
        n = sum%65536;
        sum = (sum/65536) + n;
    }
    printf("\nThe granearted sum is %x",sum);
    sum = 65535-sum;
    printf("\n THe checksum is %x",sum);
    return sum;
}
void main(){

    int sum1;
    int sum2;

    printf("\nEnter the string data you wanna send:\t");
    scanf("%s",data);

    sum1 = generateChecksum(0,0);

    printf("\n Press 1 if you want to introduce an error, else press 0");
    int ch;
    scanf("%d",&ch);
    srand(time(NULL));
    if(ch == 1){
        int pos = rand()%strlen(data);
        data[pos]++;
        sum2 = generateChecksum(1,sum1);

        if(sum2 == 0){
            printf("\n No error detected");
        }
        else{
            printf("\n Error detected");
        }
    }
    else{
        sum2 = generateChecksum(1,sum1);
        if(sum2 == 0){
            printf("\n NO error detected");
        }
        else{
            printf("\n Error detected");
        }
    }

}
//String to send: Forouzan