#include<stdio.h>
#include<stdlib.h>

#include<sys/socket.h>
#include<sys/types.h>

#include<netinet/in.h>

int main(){

    //Define the message we wanna send.
    char server_message[256] = "You reached the server xD!";
    
    //creating the server socket.
    int server_socket;
    server_socket = socket(AF_INET,SOCK_STREAM,0);

    //define the server address.
    struct sockaddr_in server_address;
    server_address.sin_family = AF_INET;
    server_address.sin_port = htons(9002);
    server_address.sin_addr.s_addr = INADDR_ANY;

    //Bind the socket to the specified the IP and port
    bind(server_socket,(struct sockaddr*) &server_address,sizeof(server_address));

    //Listen the connection, we will specify the client number as 5, consider 5 clients.
    listen(server_socket,5);

    //When we start listening, we get the client socket.
    int client_socket;
    client_socket = accept(server_socket,NULL,NULL);

    //Data we are sending to the socket.
    send(client_socket,server_message,sizeof(server_message),0);
    
    //we can now close the socket.
    // close(server_socket);
    return 0;
}