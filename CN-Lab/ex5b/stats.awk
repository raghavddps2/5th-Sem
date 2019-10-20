BEGIN {
    tcpPacketsReceived = 0;
    tcpPacketsDropped = 0;
    udpPacketsReceived = 0;
    udpPacketsDropped = 0;
}
{
    event = $1;
    packetType = $5;

    if(event == "r"){
        if(packetType == "tcp"){
            tcpPacketsReceived++;
        }
        else if(packetType == "cbr"){
            udpPacketsReceived++;
        }
    }   
    else if(event == "d"){

        if(packetType == "tcp"){
            tcpPacketsDropped++;
        }
        else if(packetType == "cbr"){
            udpPacketsDropped++;
        }
    }
}
END {
    printf("\nTCP: Received: %d, Dropped: %d",tcpPacketsReceived,tcpPacketsDropped);
    printf("\nUDP: Received: %d, Dropped: %d\n",udpPacketsReceived,udpPacketsDropped);
}