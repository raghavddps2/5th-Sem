
BEGIN{
    dcount = 0;
    rcount = 0;
}
{
    event = $1;
    if (event == "r"){
        rcount++;
    }
    if(event == "d"){
        dcount++;
    }
}
END{
    print("\n------------------------------------------\n");
    printf("\nThe packets received are %d",rcount);
    printf("\nThe packets dropped are %d\n",dcount);
    print("\n------------------------------------------\n");
}   