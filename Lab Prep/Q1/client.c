#include<stdio.h>
#include<sys/socket.h>
#include<unistd.h>
#include<fcntl.h>
#include<string.h>
#include<stdlib.h>
#include<arpa/inet.h>
#include<netinet/in.h>

#define buffSize 1024
int main(){

    int clientSocket;
    char buffer[buffSize], fname[255];

    clientSocket = socket(PF_INET,SOCK_STREAM,0);
    struct sockaddr_in serverAddr;
    socklen_t addr_size;
    
    serverAddr.sin_family = AF_INET;
    serverAddr.sin_port = htons(5000);
    serverAddr.sin_addr.s_addr = inet_addr("127.0.0.1");
    memset(serverAddr.sin_zero,'\0',sizeof serverAddr.sin_zero);

    addr_size = sizeof serverAddr;
    connect(clientSocket,(struct sockaddr*)&serverAddr,addr_size);
    
    printf("\nEnter filename");
    scanf("%s",fname);

    send(clientSocket,fname,255,0);
    printf("\nResponse: ");

    while(recv(clientSocket,buffer,buffSize,0)>0){
        printf("%s",buffer);
    }
    printf("\n");
    printf("\nData Received");
    return close(clientSocket);

}