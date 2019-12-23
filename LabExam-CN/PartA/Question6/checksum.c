#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#include<string.h>

char str[100];

int generate(int mode,int checksum){

    int temp=0;
    int sum=0;
    int n;

    if(strlen(str)%2 != 0){
        n = (strlen(str)+1)/2;
    }
    else{
        n = strlen(str)/2;
    }

    for(int i=0;i<n;i++){
        temp = str[i*2];
        temp = temp*256 + str[i*2+1];
        printf("\n %x",temp);
        sum = sum + temp;
    }

    if(mode == 1){
        printf("\n THe checksum  is %x",checksum);
        sum = sum + checksum;
    }

    if(sum/65536 != 0){
        n = sum%65536;
        sum = sum/65536 + n;
    }
    printf("\n The sum is %x",sum);
    sum = 65535 - sum;
    printf("\n THe complemented data is %x",sum);
    return sum;
}
void main(){

    printf("\n ----------------------Senders side -------------------");
    printf("\n Enter the data you want to send:\t");
    scanf("%s",str);

    int sum1 = generate(0,0);
    int ch;
    printf("\n------------------------Receivers side-------------------");
    printf("\n Press 1 if you want to introduce an error and send data");
    scanf("%d",&ch);
    
    if(ch == 1){

        srand(time(NULL));
        int pos = rand()%strlen(str);
        str[pos]++;
        printf("\n Corrupted data is %s",str);
        int sum2 = generate(1,sum1);

        if(sum2 == 0){
            printf("\n No error deteced");
        }
        else{
            printf("\n Error detected");
        }
    }

    else{
        int sum2 = generate(1,sum1);
        if(sum2 == 0){
            printf("\n No error detected");
        }
        else{
            printf("\n Error detected");
        }
    }
    printf("\n");
}