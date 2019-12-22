BEGIN{
    tcpPackets = 0;
    udpPackets = 0;
}
{
    pkttype = $5;

    if(pkttype == "cbr"){
        udpPackets++;
    }
    if(pkttype == "tcp"){
        tcpPackets++;
    }
}
END{
    printf("\nNumber of packets sent in TCP: %d\n",tcpPackets);
    printf("\nNumber of packets sent in UDP: %d\n",udpPackets);
}