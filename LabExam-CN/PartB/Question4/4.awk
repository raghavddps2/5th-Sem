BEGIN{
    count = 0;
}
{
    event = $1;
    if(event == "d"){
        count++;
    }
}
END{
    printf("\nThe number of packets dropped are %d\n",count);
}