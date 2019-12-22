BEGIN{
    ftpPackets = 0;
    ftpSize = 0;
    cbrPackets = 0;
    cbrSize = 0;
    totalFtp = 0;
    totalCbr = 0;
}
{
    event = $1;
    pkttype = $5;
    pktsize = $6;

    if(event == "r" && pkttype == "cbr"){
        cbrPackets++;
        cbrSize = pktsize;
    }
    if(event == "r" && pkttype == "tcp"){
       ftpPackets++;
       ftpSize = pktsize; 
    }
}
END{
    totalCbr = cbrPackets*cbrSize;
    totalFtp = ftpPackets*ftpSize;

    printf("\n The throughput of the FTP application is %d bytes per second",totalFtp/124.0)
    printf("\n The throughput of the CBR application is %d bytes per second",totalCbr/124.0)
    
}