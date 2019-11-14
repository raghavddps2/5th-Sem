#include<stdio.h>
#include<sys/socket.h>
#include<netinet/in.h> //This is ued to define the INADDR-ANY macro.
#include<string.h>
#include<stdlib.h>
#include<unistd.h> //This is a standard header file that is used to provide access to the POSIX operating system API.
#include<fcntl.h> //This is used for file control.
#include<arpa/inet.h> // The <arpa/inet.h> header makes available the type in_port_t and the type in_addr_t as defined in the description of <netinet/in.h>. 


#define bufsize 1024 //we define the buffer size here.

int main(){

    int clientSocket; //we basically store the client socket in this integer. 
    char buffer[1024],fname[255]; //Two character array variables we define for the filename and the buffer.
    struct sockaddr_in serverAddr; // sockaddr-in is the address family.
    socklen_t addr_size;
    /*
        While creating the server, we have the following steps
        1. Create the socket.
        2. send a connection request.
        3. Send data(filename ) and receive data(content of the filename)
     */

    /*
        Definition for socket. 
        int socket(int domain,int type,int protocol)
        The socket function basically creates an endpoint for the communication and returnas a descriptor(integer) taht refers to that endpoint.

        Domain: THe domain argument specifies the communication domain. This selects the protocol family, jo hume communication ke liye use karna hai.
                Iska examples ho sakta hai AF_INET, AF_APPLETALK etc kuch bhi..
        
        Type: This basically tells the communication sematics, matlab ki ki reliable ya unreliable hai, two-way hai, ya fixed length kemessages allow karta hai etc..

        Protocol: This specifies the particular protocol type jo huume use karna hai, iska default value zero.

        -- The above function will return file descriptor if everything OK, otherwise -1 return karega.
     */  
    clientSocket = socket(PF_INET,SOCK_STREAM,0); //PF for the protocol family which tells abt the connection.

    /*
        After we define the socket, the next step will be to configure settings of server address struct.
        1. Address family: Internet.
        2. Port number: We use the htons (host to network), this converts the unsigned short integer from host to network byte order.
        3. IP addr set as: localhost.
        4.size_ We know in the packet format, we have the padding field as well. We set all the bits to zero.
        
        void *memset(void *s,int c,size_t n);

        We have the memset function, memset function fills the first n bytes of memory area pointed to by s with constant byte c.
     */

    serverAddr.sin_family = AF_INET;
    serverAddr.sin_port = htons(8000); //use any valid port.
    serverAddr.sin_addr.s_addr = inet_addr("127.0.0.1");
    memset(serverAddr.sin_zero,'\0',sizeof serverAddr.sin_zero);

    /*
        After this, hamara next step is to connect the socket to the server using the address struct.
        connect function:
        
        int connect(int sockfd, const struct sockaddr* addr, socklen_t addrlen);  
        sockfd = file descriptor of socket.
        addrlen = size of address.

  */
    addr_size = sizeof serverAddr;
    connect(clientSocket,(struct sockaddr *)&serverAddr,addr_size);
    //Now, we ask the user for the filename.
    printf("\nEnter filename: ");
    scanf("%s",fname);

    //NOw, we will send the filename to the server.
    /*
        send(int sockfd,data_to_send,length,flags);
     */
    send(clientSocket,fname,255,0);
    printf("\nResponse:\n");

    /*
        Now, we will read the message received from the server into the buffer.
        Hum, ab isme recv() function use karte hai!.
        recv(sockfd,jahan_store_karna_hai,length,flags);
        we will get the recv data in chunks, so we use the loop till the received bytes are greater than 0.
     */

    while(recv(clientSocket,buffer,bufsize,0)>0){
        printf("%s",buffer);
    }
    printf("\n");

    printf("Data Recived!!\n");
    //Now we will close the connection.
    //close(clientSocket), this will return 0 on success and -1 if an error occurs.
    return close(clientSocket);

}   

