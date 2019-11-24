#include<stdio.h>
#include<stdlib.h>

int cost[20][20]; //This will store the cost matrix.
void dijkstra(int n, int source){

    //Here n will tell the number of nodes.
    //And source will tell the source node for the graph.
    int dis[20]; // This is to keep the distance of nodes from the source node.
    int visited[20]; //This is to keep track whether a node is visited or not.
    int count; //Just to keep a count for the loop.
    int min; //For simply storing the temp minimum at every step.
    int nextnode; //For storing the next node.
    int i,j; //variables for loop
    int pred[20]; //This is for keeping the path.

    // This loop will assign the distance of vertices from the source.
    for(i=0;i<n;i++){
        dis[i] = cost[source][i];
        visited[i] = 0; //Initially all the vertices are not visited.
        pred[i] = source; //INitial start path is the source only.
    }

    dis[source] = 0; //Distance of source from itself is 0.
    visited[source] = 1; //We will mark the source node as visited.
    count = 1; //1 node is visited(the source node)

    while(count < n){
        
        //Now, our first step would be to get the node at minimum distance.
        min = 999;
        for(i=0;i<n;i++){
            //We will update the min only if the distance of the next node that comes in loop is less than min and is not visited
            if(dis[i]<min && !visited[i]){
                min = dis[i];
                nextnode = i;
            }
        }
        //Once, the above is done, we mark the nextnode as visited.
        visited[nextnode] = 1;
        //Now, we will loop on to all the nodes with the next node as the ref.
        for(i=0;i<n;i++){
            if(!visited[i]){
                if(min + cost[nextnode][i] < dis[i]){
                    dis[i] = min + cost[nextnode][i];
                    pred[i] = nextnode; //This will just store the path.
                }
            }
        }
        count++; //Just to inc the count.
    }

    //Now, we will print the distance of each node along with the path.
    for(i=0;i<n;i++){
        if(i!=source){
            printf("\nDistance of node %d from %d = %d",i,source,dis[i]);
            printf("\nPath=%d",i);

            j = i; //Assign i to j and then go till it reaches the source.
            do{
                j = pred[j];
                printf("<-%d",j);
            }while(j != source); //We will do this till j doesn't reaches source.
        }
    }
}

int main(){

    int i,j,n,source;
    // get the number of vertices.
    printf("\nEnter the number of vertices");
    scanf("%d",&n);

    //get the cost matrix for the same.
    printf("\nEnter the cost matrix:\n");
    for(int i=0;i<n;i++){
        for(int j=0;j<n;j++){
            scanf("%d",&cost[i][j]);
            //If cost is 0 and its not the same i and j, we replace by INFINITY right.
            if(cost[i][j] == 0 && i != j){
                cost[i][j] = 999;
            }
        }
    }

    //get the starting node.
    printf("\nEnter tthe starting node: ");
    scanf("%d",&source);
    dijkstra(n,source); //Just call the dijkstra's function.
}
