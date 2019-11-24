

#include<stdio.h>
#include<stdlib.h>


/*
    We have this function, it takees, the Graph G, the no of vertices V,
    the Number of edges E, and each edges starting and ending in tthe matrix edge.
 */

int S; //This will be the source.
//This will give the path recursively.
int parent(int v,int p[20]){

    if(p[v] == S){
        return S;
    }
    printf(" %d <-",p[v]);
    return parent(p[v],p); 
}

int bf(int G[20][20],int V,int E,int edge[20][2]){

    int i,j,u,v,k;
    int distance[20]; //This is for keeping the distance.
    int p[20]; //This is for the path it will help us.
    int flag = 1;
    //First thing we will do in case of belman ford is to assign the distance as infinity to all pther nodes.

    for(i=0;i<V;i++){
        distance[i] = 1000;
        p[i] = -1; //INitially as its just we started,
    }

    printf("Enter Source:\t");
    scanf("%d",&S);

    //We will calculate the distance as distance[u]+G[u][v] should be less than the laready distance distance[v]
    distance[S] = 0;
    for(i=0;i<V-1;i++){
        for(k=0;k<E;k++){
            u = edge[k][0];
            v = edge[k][1];
            
            if(distance[u]+G[u][v] < distance[v]){
                distance[v] = distance[u] + G[u][v];
                p[v] = u; //This will help us go to the path.
            }
        }
    }
    //When we are done with V-1 iterations, we will try for E times and even if now it changes, 
    // we will set the flag to 0.

    for(k=0;k<E;k++){
        u = edge[k][0];
        v = edge[k][1];
        if(distance[u]+G[u][v] < distance[v]){
            flag = 0;
        }
    }

    if(flag){
        printf("\nFrom source vertex %d to: \n",S);
        for(i=0;i<V;i++){
            if(i!=S){
                printf("Vertex %d -> cost = %d\n",i,distance[i]);
                printf("path: %d <-",i);
                printf("%d\n",parent(i,p));
            }
        }
    }

    return flag;
}   


void main(){

    int V; //This is for storing the number of vertices.
    int edge[20][2]; //Storing each edges u and v, so a 20X2 array.
    int G[20][20]; //We will use this to store the Adjacency matrix.

    int i,j,k=0; //This is for use in the program.

    printf("\nBellman Ford Algorithm (Negative weights are allowed)");
    printf("\nEnter the number of vertices");
    scanf("%d",&V);

    printf("\nEnter the graph in matrix form\n");
    for(i=0;i<V;i++){
        for(j=0;j<V;j++){
            scanf("%d",&G[i][j]);

            //If the entered is not 0, it means an edge exists.
            if(G[i][j] != 0){
                edge[k][0] = i; //Starting vertex of an edge. 
                edge[k++][1] = j; //Ending vertex of an edge.
            }
        }
    }

    //Belman ford algorithm, will return 1 if it finds the part, so matlab no negative weight cycle, awesome.
    if(bf(G,V,k,edge)){
        printf("\nNo negative weight cycle");
    }
    else{
        printf("\nNegative weight cycle exists\n");
    }
}