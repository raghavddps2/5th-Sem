BEGIN{
    telnetPackets = 0;
    ftpPackets = 0;
    telnetPacketSize = 0;
    ftpPacketSize = 0;
    totalTelnet = 0;
    totalFtp = 0; 
}
{
    event = $1;
    fromnode = $9;
    tonode = $10;
    pkttype = $5;
    pktsize = $6;

    if(event == "r" && pkttype == "tcp" && fromnode == "0.0" && tonode == "3.0"){
        ftpPackets++;
        ftpPacketSize = pktsize;
    }

    if(event == "r" && pkttype == "tcp" && fromnode == "1.0" && tonode == "3.1"){
        telnetPackets++;
        telnetPacketSize = pktsize;
    }
}
END{
    totalFtp = ftpPacketSize*ftpPackets*8;
    totalTelnet = telnetPacketSize*telnetPackets*8;

    print("\n----------------------------------------\n")
    print("\nThe throughput of FTP application is %d\n",totalFtp/24);
    print("\nThe throughput of TELNET application is %d\n",totalTelnet/24);
    print("\n----------------------------------------\n")
}