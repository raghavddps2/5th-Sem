BEGIN{
    pdrop = 0;
}
{
    event = $1;
    if (event == "d"){
        pdrop++;
    }
}
END{
    printf("\n--------------------------------------------\n")
    printf("\nThe number of packets dropped are %d\n",pdrop);
    printf("\n--------------------------------------------\n")
}