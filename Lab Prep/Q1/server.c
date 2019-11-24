#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<fcntl.h>
#include<sys/socket.h>
#include<arpa/inet.h>
#include<netinet/in.h>
#include<unistd.h>

#define bufSize 1024

int main(){


    // socket,memset,bind,accept,recv,send
    int serverSocket;
    char fname[255];
    char buffer[bufSize];
    int fd;

    struct sockaddr_in serverAddr;
    struct sockaddr_storage serverStorage;
    socklen_t addr_size;
    
    serverSocket = socket(PF_INET,SOCK_STREAM,0);

    serverAddr.sin_family = AF_INET;
    serverAddr.sin_port = htons(5000);
    serverAddr.sin_addr.s_addr = inet_addr("127.0.0.1");
    memset(serverAddr.sin_zero,'\0',sizeof serverAddr.sin_zero);

    //Now, one important method to bind the address to the socket.
    bind(serverSocket,(struct sockaddr *)&serverAddr,sizeof(serverAddr));
    if(listen(serverSocket,5) == 0){
        printf("jjj");
    }
    else{
        printf("\nQueue is full");
    }

    int newSocket;
    addr_size = sizeof serverStorage;
    newSocket = accept(serverSocket,(struct sockaddr*)&serverStorage,&addr_size);
    recv(newSocket,fname,255,0);
    fd = open(fname,O_RDONLY);

    int n;
    if(fd == -1){
        strcpy(buffer,"No file found");
        n = strlen(buffer);
    }
    else{
        n = read(fd,buffer,bufSize);
    }
    //NOw, we can send.
    send(newSocket,buffer,n,0);
    close(newSocket);
    return close(serverSocket);    
}