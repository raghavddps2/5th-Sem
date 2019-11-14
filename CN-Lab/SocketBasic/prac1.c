#include<stdio.h>
#include<stdlib.h>
#include<sys/types.h>
#include<sys/socket.h>

// For all the header files we need
#include<netinet/in.h>

int main(){

    //creating a socket!
    int network_socket;
    network_socket = socket(AF_INET,SOCK_STREAM,0);

    //Connecting with other socket, specifying an address for the socket.
    struct sockaddr_in server_address;
    server_address.sin_family = AF_INET;
    server_address.sin_port = htons(9002); //This function converts the port number to correct format.
    server_address.sin_addr.s_addr = INADDR_ANY;

    //Now, we will just use the connect function.
    int connection_status = connect(network_socket,(struct sockaddr *) &server_address,sizeof(server_address));

    //check for error with the connection.
    if (connection_status == -1){
        printf("There was an error making connection to the remote server\n\n");
    }

    //receive data from the server.
    char server_response[256];
    recv(network_socket,&server_response,sizeof(server_response),0);


    //Print out the data that we got from server.
    printf("The server sent the data %s\n",server_response);


    //we will close the socket, as soon as we receive the data.
    close(network_socket);
    return 0;
}
