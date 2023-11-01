import 'package:dsalg5/dsalg5.dart' as dsalg5;

void main(List<String> arguments) {
  //insert a few nodes onto the sll
  sll singlyList = sll();
  singlyList.insert(9);
  printFullList(singlyList.fullList);
  singlyList.insert(4);
  printFullList(singlyList.fullList);
  singlyList.insert(1);
  printFullList(singlyList.fullList);
  singlyList.insert(5);
  printFullList(singlyList.fullList);
  // testing the search method
  print(singlyList.search(1));
  print(singlyList.search(2));
  // testing the delete method
  singlyList.delete(4);
  printFullList(singlyList.fullList);
  singlyList.delete(2);
  // sort the list
  sortSLL(singlyList.fullList);
  // reverse the list
  reverseSLL(singlyList.fullList);
  // delete nth item from end of list
  int value = removeNth(2, singlyList.fullList);
  singlyList.delete(value);
  printFullList(singlyList.fullList);
  // merge 2 lists

}

class node{
  int value = 0;
  String nextItemIndex = '';
  node(this.value, this.nextItemIndex);
}

class sll {
  List<node> fullList = [];

  void insert(value) {
    // check if list is empty
    if (fullList.isEmpty) {
      fullList.add(node(value, ''));
    }
    else {
      int index = fullList.length;
      // append the last item in the list so that it correctly reflects the item just added
      fullList[fullList.length - 1] = node(fullList[fullList.length - 1].value, index.toString());
      // add a new node item onto the end of the list
      fullList.add(node(value, ''));
    }
  }

  bool search(valueToFind){
    bool found = false;
    for(var node in fullList){
      if(node.value == valueToFind){
        found = true;
      }
    }
    if(found == true){
      return true;
    }
    else{
      return false;
    }
  }

  void delete(valueToDelete){
    bool itemExists = false;
    int index = 0;
    for(var node in fullList){
      if(node.value == valueToDelete){
        itemExists = true;
        print(node.nextItemIndex);
        index = int.parse(node.nextItemIndex)-1;
      }
    }
    if(itemExists == true){
      fullList.remove(fullList[index]);
      for(int i=index;i<fullList.length-1;i++){
        int newIndex = int.parse(fullList[i].nextItemIndex)-1;
        fullList[i] = node(fullList[i].value, newIndex.toString());
      }
    }
    else{
      print('you cant delete that item because it doesnt exist');
    }
  }

}

// function to easily print the whole list
void printFullList(List<node> list) {
  for (var node in list) {
    print('Value: ${node.value}, Next Item Index: ${node.nextItemIndex}');
  }
}

void sortSLL(List<node> list){
  for(int i=0;i<list.length;i++){
    if(list[i].nextItemIndex == ''){
    }
    else{
      if(list[i].value > list[i+1].value){
        int hold = list[i].value;
        list[i].value = list[i+1].value;
        list[i+1].value = hold;
      }
    }
  }
  printFullList(list);
}

void reverseSLL(List<node> list) {
  for (int i = list.length - 1; i >= 0; i--) {
    print(list[i].value);
  }
}

int removeNth(indexFromEnd, List<node> list){
  int count = 0;
  int value = 0;
  for(int i=list.length-1;i>=0;i--){
    count += 1;
    if(count == indexFromEnd){
      value = list[i].value;
    }
  }
  return value;
}

// Design an algorithm to merge 2 sorted SLLs, where the output SLL is sorted containing all nodes/elements from the 2 input SLLs
void mergeLists(List<node> list1, List<node> list2, List<node> finalList){
  String totalItems = '';
  for(int i=0;i<list1.length-1;i++){
    totalItems += list1[i].value.toString();
  }
  for(int i=0;i<list2.length-1;i++){
    totalItems += list2[i].value.toString();
  }
  String sortedString = mergeSort(totalItems);
  sll sortedList = sll();
  for(int i=0;i>sortedString.length-1;i++){
    sortedList.insert(sortedString[i]);
  }
  printFullList(sortedList.fullList);
}

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
