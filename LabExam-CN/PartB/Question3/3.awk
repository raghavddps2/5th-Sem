BEGIN{
    tcpSent = 0;
    tcpLost = 0;
    tcpReceived = 0;

    udpSent = 0;
    udpLost = 0;
    udpReceived = 0;

    totalSent = 0;
    totalReceived = 0;
    totalLost = 0;
}
{
    packetType = $5
    event = $1

    if(packetType == "tcp")
    {
        if(event == "+")
        {
            tcpSent++;
        }
        else if(event == "r")
        {
            tcpReceived++;
        }
        else if(event == "d"){
            tcpLost++;
        }
    }   
    else if(packetType == "cbr")
    {

        if(event == "+")
        {
            udpSent++;
        }
        else if(event == "r")
        {
            udpReceived++;
        }
        else if(event == "d"){
            udpLost++;
        }
    }
}
END{
    totalSent = udpSent + tcpSent;
    totalLost = udpLost + tcpLost;

    printf("\nTCP Packets sent: %d\n",tcpSent);
    printf("\nTCP Packets Received: %d\n",tcpReceived);
    printf("\nTCP Packets Lost: %d\n",tcpLost);

    printf("\nUDP Packets sent: %d\n",udpSent);
    printf("\nUDP Packets Received: %d\n",udpReceived);
    printf("\nUDP Packets Lost: %d\n",udpLost);

    printf("\nTotal sent: %d\n",totalSent);
    printf("\nTotal Dropped: %d\n",totalLost);
}
