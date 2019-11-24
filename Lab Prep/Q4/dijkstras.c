#include<stdio.h>

int cost[20][20];

void dijkstras(int n,int source){

    int distance[20];
    int nextnode;
    int i,j;
    int count,min;
    int visited[20];
    int pred[20];

    //First loop for putting the initial distance.
    for(int i=0;i<n;i++){
        distance[i] = cost[source][i];
        visited[i] = 0;
        pred[i] = source;
    }

    //Now, some initail tasks.
    visited[source] = 1;
    distance[source] = 0;
    count = 1;

    while(count < n){
        min = 999;
        //get the minimum first.
        for(int i=0;i<n;i++){
            if(distance[i] < min && !visited[i]){
                min = distance[i];
                nextnode = i; //will be used to mark it as visited.
            }
        }

        //then calculate the minum distances and put it and form the back track array. pred..
        visited[nextnode] = 1;
        for(int i=0;i<n;i++){
            if(!visited[i]){
                //If min + cost[nextnode][i] is less than the distance[i]
                if(min + cost[nextnode][i] < distance[i]){
                    distance[i] = min + cost[nextnode][i];
                    pred[i] = nextnode;
                }
            }
        }
        count++;
    }

    //Simply print the distance and the path.
    for(int i=0;i<n;i++){
        printf("\n---------------------------------");
        if(i != source){
            printf("\nDistance of %d is %d",i,distance[i]);
            printf("\nPath= %d",i);

            int j = i;
            do{
                j = pred[j];
                printf("<-%d ",j);
            }while(j != source);
        }
    }

}

void main(){

    int n;
    printf("\n ENter the number of vertices");
    scanf("%d",&n);

    printf("\n ENter the cost matrix");
    for(int i=0;i<n;i++){
        for(int j=0;j<n;j++){
            scanf("%d",&cost[i][j]);
            if(cost[i][j] == 0 && i != j){
                cost[i][j] = 999;
            }
        }
    }
    int s;
    printf("\n Enter the srarting node:\t");
    scanf("%d",&s);
    dijkstras(n,s);
}
// 0 10 0 30 100
// 10 0 50 0 0
// 0 50 0 20 10
// 30 0 20 0 60
// 100 0 10 60 0