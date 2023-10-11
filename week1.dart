void main(){
  // Testing the queue
  Queue queue1 = Queue();
  queue1.enQueue('Hello');
  queue1.enQueue('Hello2');
  queue1.enQueue('Hello3');
  queue1.deQueue();
  queue1.enQueue('Hello4');
  queue1.deQueue();
  print(queue1.peek());
  print(queue1.length());
  // Testing the stack
  Stack stack1 = Stack();
  stack1.push('Hello');
  stack1.push('Hello2');
  stack1.push('Hello3');
  stack1.pop();
  print(stack1.peek());
  print(stack1.length());

  // design an algorithm the reverse a queue using a queue and a stack
  List<String> queue2 = ['1','4','7'];
  print(stackReverse(queue2));

  // design an algorithm that checks if brackets are completed
  print(completeBrackets('()'));
}

class Queue{
  List<String> queueList = [];

  void enQueue(newItem){
    queueList.add(newItem);
    print(queueList);
  }

  void deQueue(){
    queueList.remove(queueList[0]);
    for(int i=0;i<queueList.length-1;i++){
      if(i==0){}
      else{
        queueList[i-1] = queueList[i];
      }
    }
    print(queueList);
  }

  String peek(){
    String item = '';
    item = queueList[0];
    return item;
  }

  int length(){
    return queueList.length;
  }
}

class Stack{
  List<String> stackList = [];

  void push(newItem){
    stackList.add(newItem);
    print(stackList);
  }

  void pop(){
    stackList.remove(stackList[stackList.length-1]);
    print(stackList);
  }

  String peek(){
    return stackList[stackList.length-1];
  }

  int length(){
    return stackList.length;
  }
}

// reverse a queue using a stack
List<String> stackReverse(queue){
  List<String> reversedQueue = [];
  Stack newQueue = Stack();
  for(int i=0;i<queue.length;i++){
    newQueue.push(queue[i]);
  }
  for(int i=0;i<queue.length;i++){
    reversedQueue.add(newQueue.peek());
    newQueue.pop();
  }
  return reversedQueue;
}

// check if any brackets used in a string are complete eg ()=true but (()=false
bool completeBrackets(input){
  // peek each item, if () then add to counter, pop after peeking?
  int openBracketsCounter = 0;
  int closedBracketsCounter = 0;
  Stack inputStack = Stack();
  for(int i=0;i<input.length;i++){
    inputStack.push(input[i]);
  }

  for(int i=0;i<input.length;i++){
    String currentValue = inputStack.peek();
    if (currentValue == '(' || currentValue == '['){
      openBracketsCounter += 1;
    }
    else if(currentValue == ')' || currentValue == ']'){
      closedBracketsCounter += 1;
    }
    inputStack.pop();
  }

  if (openBracketsCounter == closedBracketsCounter){
    return true;
  }
  else{
    return false;
  }
}
