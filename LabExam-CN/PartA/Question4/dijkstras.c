#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<time.h>

void dijkstras(int G[20][20],int S, int V){

    int distance[20];
    int visited[20];
    int p[20]; //This is what is used for keeping track of the path.

    //Here, first step will be to Assign all the distances as infinite.
    //And mark all the nodes as unvisited.
    //And mark the starting for all the points as S.

    for(int i=0;i<V;i++){
        distance[i] = G[S][i];
        visited[i] = 0;
        p[i] = S;
    }

    //Now, as source will obviously be visited..
    distance[S] = 0;
    visited[S] = 1;
    //As one is visited now, we can set tthe count to 1.
    int count = 1;
    int nextnode;
    while(count < V){

        //First we will get the minimum every time.
        int min = 999;
        

        for(int i=0;i<V;i++){
            //If it is not visited and the distance[i] is less than min.
            if(distance[i] < min && !visited[i]){
                min = distance[i];
                nextnode = i;
            }
        }
        visited[nextnode] = 1;

        //Once we have refernece to the min, we will loop on all the vertices and update the distances.
        for(int i=0;i<V;i++){
            if(!visited[i] && distance[i]>min+G[nextnode][i]){
                distance[i] = min+G[nextnode][i];
                p[i] = nextnode;
            }
        }
        //And everytime this is done, we will increase the count.
        count++;
    }
    for(int i=0;i<V;i++){
        if(i!=S){
            printf("\nThe distance from %d to %d is %d",i,S,distance[i]);
            printf("\nPath===========> %d",i);

            int j = i; //We need to know the current, so that we can track back, till it goes back to the source.
            do{ 
                j = p[j];
                printf("<- %d ",j);
            }while(j != S);
        }
        printf("\n");
    }

}

void main(){


    int G[20][20];//This is for the graph.
    int S; //This is for the source.
    int V; //Foor the number of vertices.

    printf("\n Enter the number of vertices:\t");
    scanf("%d",&V);

    printf("\n Enter the Adjacency matrix");
    for(int i=0;i<V;i++){
        for(int j=0;j<V;j++){
            scanf("%d",&G[i][j]);

            if(i != j && G[i][j] == 0){
                G[i][j] = 999;
            }
        }
    }

    printf("\n Enter the source node:\t");
    scanf("%d",&S);

    dijkstras(G,S,V);    
}

// 0 4 0 0 8 0 0 0 0
// 4 0 8 0 11 0 0 0 0
// 0 8 0 7 0 0 4 0 2
// 0 0 7 0 0 0 4 0 2
// 8 11 0 0 0 1 0 0 7
// 0 0 0 0 1 0 2 0 6
// 0 0 4 14 0 0 0 10 0
// 0 0 0 9 0 0 10 0 0
// 0 0 2 0 7 6 0 0 0

// 0 10 5 0 0
// 0 0 0 1 0
// 0 3 0 9 2
// 0 0 0 0 0
// 2 0 0 6 0