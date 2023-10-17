void main(){
  print(iterativeFib(4));
  print(recursiveFib(6-1));
  // print(mergeSort('4183'));
  print(palindrome('Hannah'));
}

// 1
int iterativeFib(int n){
  bool achieved = false;
  int fib = 0;
  List<int> fibonacci=[0,1,1];
  int mostRecent = 0;
  while (achieved == false){
    int length = fibonacci.length - 1;
    if (length - 1 == n){
      achieved = true;
      fib = fibonacci[length - 2];
    }
    mostRecent = fibonacci[length] + fibonacci[length - 1];
    // print(mostRecent);
    fibonacci.add(mostRecent);
    // print(fibonacci);
  }
  return fib;
}
// 2
int recursiveFib(int n){
  int fib = 0;
    if (n <= 0) {
      return 0;
    } else if (n == 1) {
      return 1;
    } else {
      fib = recursiveFib(n - 1) + recursiveFib(n - 2);
    }
  return fib;
}
//3.
String mergeSort(String items){
  // split into single items,
  List<String> itemsList = [];
  for(int i=0;i<items.length;i++){
    itemsList.add(items[i]);
  }
// then compare 0 and 1, 2 and 3 etc
// then put 01, 23 etc as items
// then compare 0123 etc
  int listLength = itemsList.length - 1;
  while(listLength != 1){
    String currentList='';
    // keep comparing i and i+1, and combining them
    for (int i=0;i<itemsList.length-1;i++){
      if(int.parse(itemsList[i])<int.parse(itemsList[i+1])){
        currentList += itemsList[i+1] + itemsList[i];
      }
      else{
        currentList += itemsList[i] + itemsList[i+1];
      }
    }
    itemsList = [];
    for(int i=0;i<itemsList.length;i++){
      itemsList.add(currentList[i]);
    }
    currentList = '';
    listLength = itemsList.length - 1;
  }
  String sortedList = '';
  for(int i=0;i<items.length;i++){
    sortedList = (itemsList.toString());
  }
  return sortedList;
}
// 5.
bool palindrome(String value){
  value = value.toLowerCase();
  bool isPalindrome = false;
  String reversedValue = '';
  for(int i=value.length-1;i>=0;i--){
    reversedValue += value[i];
  }
  if(value == reversedValue){
    isPalindrome = true;
  }
  return isPalindrome;
}

