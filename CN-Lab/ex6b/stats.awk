BEGIN {
    ftpPackets = 0;
    ftpSize = 0;
    cbrSize = 0;
    totalFtp = 0;
    totalCbr = 0;
    cbrPackets = 0;
}
{
    event = $1;
    pkttype = $5;
    pktsize = $6;

    if(event == "r" && pkttype =="cbr"){
        cbrPackets++;
        cbrSize = pktsize;
    }
    if(event == "r" && pkttype == "tcp"){
        ftpPackets++;
        ftpSize = pktsize;
    }
}
END{

    totalFtp = ftpPackets*ftpSize;
    totalCbr = cbrPackets*cbrSize

    printf("\nThe throughput of FTP application is %d Bytes per sec\n",totalFtp/123.0);
    printf("The throughput of CBR application is %d Bytes per sec\n",totalCbr/124.4);
}