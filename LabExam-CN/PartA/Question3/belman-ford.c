#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<time.h>

int S;
int parent(int v,int p[20]){

    if(p[v] == S){
        return S;
    }
    printf("%d <- ",p[v]);
    return parent(p[v],p);
}

int bf(int G[20][20],int edge[20][2],int V,int E){

    int distance[20]; //For storing distance for all the vertices.
    int p[20]; //For marking as to what is visited and what is not.

    //First work we will do is set all of it to infinity.
  
    for(int i=0;i<V;i++){
        distance[i] = 1000;
        p[i] = -1;
    }
    printf("\n Enter the source vertex:\t");
    scanf("%d",&S);

    //Now, as we got the source, we can mark it as visited and the distance of that as 0.
    distance[S] = 0;

    //Now, we can iterate V-1 times on all the edges.
    for(int i=0;i<V-1;i++){
        for(int j=0;j<E;j++){

            //We need  to get he two vertices for the edge.
            int u = edge[j][0];
            int v = edge[j][1];

            if(distance[u]+G[u][v] < distance[v]){
                distance[v] = distance[u]+G[u][v];
                p[v] = u; //This simply stores the path.
            }
        }
    }
    int flag = 1; //If this becomes zzero, it means negative cycle present.
    //Now, if even after this iteration anything changes, it means it has a negative weight cycle,
    for(int k=0;k<E;k++){

        int u = edge[k][0];
        int v = edge[k][1];

        if(distance[u]+G[u][v] < distance[v]){
            flag = 0;
        }
    }

    if(flag){

        for(int i=0;i<V;i++){

            if(i!=S){
                printf("\n The distance of the vertex %d from %d is %d",i,S,distance[i]);
                printf("\nPath ======> %d <- ",i);
                //We send the entire track we maintain till now.
                printf("%d",parent(i,p));
            }
        }
    }

    return flag;
}


void main(){


    int G[20][20]; //For storing the adjacency matric for graph.
    int edge[20][2]; //For keeping track of all the edges.
    int V; //For the number of vertices.
    int k=0; //For kepping track of edges.
    printf("\n Enter the number of vertices:\t");
    scanf("%d",&V);

    printf("\n Enter the graph:\n");
    for(int i=0;i<V;i++){
        for(int j=0;j<V;j++){
            scanf("%d",&G[i][j]);

            if(G[i][j] != 0){
                edge[k][0] = i;
                edge[k++][1] = j;
            }
        }
    }

    if(bf(G,edge,V,k)){
        printf("\n No negative weight cycle exists\n");
    }
    else{
        printf("\n Negative weight cycle exists\n");
    }
}