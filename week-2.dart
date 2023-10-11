void main(){
  List<int> items = [1,3,2,5];
  print('Insertion sort: ');
  print(insertionSort(items));
  List<int> items2 = [1,3,2,5];
  print('Selection sort: ');
  print(selectionSort(items2));
  List<int> items3 = [1,3,2,5];
  print('Bubble sort: ');
  print(bubbleSort(items3));
  print('Linear Search: ');
  print(linearSearch(items, 5));
  print('Binary search');
  print(binarySearch(items, 5));
}

List<int> selectionSort(List items){
  List<int> sortedItems = [];
  int smallestItem = 0;
  while(items.isNotEmpty){
    smallestItem = items[0];
    for(int i=0;i<items.length;i++){
      if (items[i]<smallestItem){
        smallestItem = items[i];
      }
    }
    sortedItems.add(smallestItem);
    items.remove(smallestItem);
  }
  return sortedItems;
}

List<int> insertionSort(List<int> items){
  for(int i=0;i<items.length-1;i++){
    int itemToInsert = items[i];
    int indexHole = i;
    while (indexHole>0 && items[indexHole-1]>itemToInsert){
      items[indexHole] = items[indexHole-1];
      indexHole=indexHole-1;
    }
    items[indexHole]=itemToInsert;
  }
  return items;
}

List<int> bubbleSort(List<int>items){
  for(int i=0;i<items.length-1;i++){
    if(i>=items.length-1){}
    else{
      if(items[i]>items[i+1]){
        int carryVariable = items[i];
        items[i] = items[i+1];
        items[i+1] = carryVariable;
      }
    }
  }
  return items;
}

int linearSearch(List<int>items, int itemSearchingFor){
  int itemPosition = 0;
  for(int i=0;i<items.length;i++){
    if (items[i]==itemSearchingFor){
      itemPosition = i+1;
    }
  }
  return itemPosition;
}

// iterative version of binary search
int binarySearch(List<int>items, int itemSearchingFor){
  int half = ((items.length) /2).floor();
  int itemPosition = 0;
  bool itemFound = false;
  bool itemExistsInList = true;
  while (itemFound == false || itemExistsInList == true){
    if(items[half] == itemSearchingFor){
      itemPosition = half;
      itemFound = true;
      return itemPosition+1;
    }
    else if(itemSearchingFor > items[half]){
      half = half + (half/2).floor();
    }
    else{
      half = half - (half/2).floor();
    }
    if(half <=1){
      itemExistsInList = false;
    }
  }
  return -1;
}

