#include<stdio.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<string.h>
#include<stdlib.h>
#include<unistd.h>
#include<arpa/inet.h>
#include<fcntl.h>

#define bufsize 1024

int main(){

    int serverSocket, newSocket; //New socket is basically the new attached client socket.
    char buffer[bufsize];
    char fname[255];
    int fd,n;
    struct sockaddr_in serverAddr;
    struct sockaddr_storage serverStorage;
    socklen_t addr_size;
    //Again as samw, we first create the socket.
    serverSocket = socket(PF_INET,SOCK_STREAM,0);

    //We will configure the settings as in the client file.
    serverAddr.sin_family = AF_INET;
    serverAddr.sin_port = htons(7891);
    serverAddr.sin_addr.s_addr = inet_addr("127.0.0.1");
    memset(serverAddr.sin_zero,'\0',sizeof serverAddr.sin_zero);
    //We need to bind the address struct to the socket, so that it can listen.
    bind(serverSocket,(struct sockaddr *) &serverAddr,sizeof serverAddr);

    //We will set the connection limit to 5
    //The listen function returns zero on success of connection.
    
    if(listen(serverSocket,5) == 0){
        printf("Listening!\n");
    }
    else{
        printf("\nError");
    }

    /*
        We will now accept the call to create a new socket for the incoming client.
        The accept() function shall extract the first connection on the queue of pending connections, create a new socket with the same socket type
         protocol and address family as the specified socket, and allocate a new file descriptor for that socket.
        Their will be a queue(max size specified as 5) out of which one connection will be chosen.
         Upon success, this will return non negative file descriptor of the accepted socket.
     */
    addr_size = sizeof serverStorage;
    newSocket = accept(serverSocket,(struct sockaddr *) &serverStorage,&addr_size);

    /*
        we will receive the name of the file.
     */
    recv(newSocket,fname,255,0);
    fd = open(fname,O_RDONLY);

    //The if here tells that the file wasn't found.
    if(fd == -1){
        strcpy(buffer,"No file found!");
        n = strlen(buffer); //We will just store length of the above string.
    }
    else{
        n = read(fd,buffer,bufsize);
    }

    //Now we will send the data to the new connected socket.
    send(newSocket,buffer,n,0);
    close(newSocket);
    return close(serverSocket); //We wil close this socket connection as well.
}