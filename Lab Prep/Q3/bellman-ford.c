#include<stdio.h>

int S;

int parent(int v,int p[20]){
    if(p[v] == S){
        return S;
    }
    printf("%d<-",p[v]);
    return parent(p[v],p);
}
int bf(int V,int G[20][20],int edge[20][2],int E){

    int i,j,u,v,k;
    int distance[20];
    int p[20];
    for(int i=0;i<V;i++){
        distance[i] = 1000;
        p[i] = -1;
    }

    printf("\nEnter source:\t");
    scanf("%d",&S);

    distance[S] = 0;
    for(i=0;i<V-1;i++){
        for(k=0;k<E;k++){
            u = edge[k][0];
            v = edge[k][1];

            if(distance[u]+G[u][v] < distance[v]){
                distance[v] = distance[u] + G[u][v];
                p[v] = u;
            }
        }
    }
    int flag = 1;
    for(k=0;k<E;k++){
        u = edge[k][0];
        v = edge[k][1];
        if(distance[u]+G[u][v] < distance[v]){
            flag = 0;
        }
    }

    if(flag){
        printf("Source is %d: \n",S);
        for(i=0;i<V;i++){
            printf("\n---------------------------\n");
            if(i != S){
                printf("Cost for vertex %d is %d",i,distance[i]);
                printf("\nPath: %d <-",i);
                printf("%d",parent(i,p));
            }
        }
    }

    return flag;

}

void main(){

    int V,k=0;
    int edge[20][2];
    int G[20][20];

    printf("\n Enter the number of vertices");
    scanf("%d",&V);

    printf("\n Enter the adjacency matrix");
    for(int i=0;i<V;i++){
        for(int j=0;j<V;j++){
            scanf("%d",&G[i][j]);
            if(G[i][j] != 0){
                edge[k][0] = i;
                edge[k++][1] = j;
            }
        }
    }

    if(bf(V,G,edge,k)){
        printf("\n No negative weight cycle");
    }
    else{
        printf("\n Negative weight cycle exists");
    }
}