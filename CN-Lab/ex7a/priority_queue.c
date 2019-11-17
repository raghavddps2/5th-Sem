/*
    Packets  from  different  flows  arrive  at  a  switch  or  router  for  processing.
    A good  scheduling  technique  treats  the  different  flows  in  a  fair  and  appropriate manner. 
    Implement  priority  queuing  as  a  technique  to  improve  Quality  of Service.

    We just have to implement the priority queue.
 */

#include<stdio.h>
#include<stdlib.h>

#define MAX 5 //We define the max size of the queue as 5.

//We define the definition for various functions here.
void insert_by_priority(int); //This is to insert in the priority queue.
void delete_by_priority(int); //This is to delete from the priority queue.
void create();  //This is to create an empty priority queue.
void check(int); 
void display_pqueue(); //This is just to display the priority queue.

int pri_que[MAX]; //This creates an array for a queue of size 5.
int front; //Just to keep track of the front end of queue.
int rear; //Just to keep track of the rear end of the queue.

void main(){

    int n,ch;
    printf("\n1. Insert an element into the queue");
    printf("\n2. Delete an element from the queue");
    printf("\n3. Display the queue elements.");
    printf("\n4. Exit!");

    create(); //This will initialize front and rear values.
    
    while(1){

        printf("\n Enter your choice");
        scanf("%d",&ch);

        switch(ch){
            case 1:
                printf("\n Enter the value to be inserted:\t");
                scanf("%d",&n);
                insert_by_priority(n); //Inserting (The value represents the priority)
                break;
            
            case 2:
                printf("\n Enter the value to delete:\t");
                scanf("%d",&n);
                delete_by_priority(n);
                break;
            
            case 3:
                display_pqueue();
                break;

            case 4:
                exit(0);
            
            default:
                printf("\n Choice is incorrect! Please enter the correct choice.");
        }
    }
}

//This is simply to initialize the value of front and rear.
void create(){
    rear = -1;
    front = -1;
}

//This function is to insert value into the priority queue.
void insert_by_priority(int data){

    //If rear is equal to greater than max, means queue is full.
    if(rear >= MAX-1){
        printf("\nQueue overflow, no more elements can be inserted.");
        return;
    }
    //If the entered element is the first element in the queue, we simply add the element at the first place.
    if((front == -1) && (rear == -1)){
        front++;
        rear++;
        pri_que[front] = data;
        return;
    }
    //The below executes if queue has some elemnents.
    else{
        check(data); //This will check the priority and place.
    }
    rear++;
}

void check(int data){

    //Here, the priority is decided by the value of the data. More the value, more will be the priority 
    // and hence we will shift the data accordingly.
/*
     ---------------
    |  |  |  |  |  |
    ----------------
      |
      V
      front/rear (Initial case.)

    Suppose, we have the queue like this, with just one value 6.
     ---------------
    | 6 |  |  |  |  |
    ----------------
    Now, we have a data that comes with value 5. As the value is less, it will simply be added after 6 and the rear value will be incremented.
     ---------------
    | 6 | 5 |  |  |  |
    ----------------
    Now, suppose, a data comes with a value of 10. NOw, rear points to 1 and front to 0, and we have to insert this value.
    clearly, it has the highest priority. So, we will shift elements 
    1. We will start with i=0, now data is greater than q[0] . This will shift all elements one by one.
     ---------------
    |  | 6 | 5 |  |  |
    ----------------
    2. Now, the data value will be inseted at position i.
     ------------------
    | 10 | 6 | 5 |  |  |
    --------------------
    In this case, we will return here. But there will be cases, when it lies in between or something, so we will enclose the code with a loop from i=0 to rear.   


*/

    int i,j;
    for(i=0;i<=rear;i++){
        //If the below true, then only we need to use the shift loop.
        if(data >= pri_que[i]){
            for(j=rear+1;j>i;j--){
                pri_que[j] = pri_que[j-1]; //Shifting elements.
            }

            pri_que[i] = data; //Setting up the data at the posiiton i.
            //If the above is done, we placed the data, we can simply return.
            return;
        }
    }
    //After the loop is done and still the posiiton isn't found, it means the element has the least priority. SO, we will place it at end as told by the value of i.
    pri_que[i] = data;
}

void display_pqueue(){

    //If both front and rear are -1, this simply implies that queue is empty!
    if((front == -1) && (rear == -1)){
        printf("\n Queue is empty!!");
        return;
    }
    else{
        for(int k = front;k<=rear;k++){
            printf("%d ",pri_que[k]); //We will print the elements of the queue one by one.
        }
        printf("\n");
    }
}


void delete_by_priority(int data){
    /*
        Basically we have 3 cases here.
        1. The queue is empty.
        2. The element asked to delete des not exist.
        3. Element to be deleted.
    

    Suppose, we have the state of the queue as the app below.
     -----------------
    | 5 | 6 | 7 |  |  |
    ------------------

    Suppose we wanna delete 6.
    It goes for the first iteration when i is 0, doesn't find anything.. starts from i = 1
    Now, shiftng will occur basically.
     -----------------
    | 5 | 7 | 7 |  |  |
    ------------------
    We will decrement rear and replace the 7 at the end by some randomvalue, say -999.
     --------------------
    | 5 | 7 | -999 |  |  |
    ---------------------
    Now, rear points to 7.
    */

   int i;
   if((front == -1) && (rear == -1)){
       printf("\nQueue is empty, so we have no elements to delete.");
       return;
   }
   //We will check in the queue now.
    for(i=0;i<=rear;i++){
        if(data == pri_que[i]){
            for(;i<rear;i++){
                pri_que[i] = pri_que[i+1]; //We will shift to left.
            }
            //The value at the ith location will be hanged to -999.
            pri_que[i] = -999;
            rear--; //We will decrement the rear value.

            //If the element to be deleted was the only element, it means we should set back front to -1.
            if(rear == -1){
                front = -1;
            }
            return; //This will be done only if data is found.
        }
    }
    //The below line to be printed if data mila hi ni.
    printf("%d not found in the queue to delete",data);
}