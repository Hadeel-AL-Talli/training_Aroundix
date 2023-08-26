import 'package:flutter/material.dart';


class SelectedPageProvider extends ChangeNotifier{

  int selectedPage; 
  SelectedPageProvider({
    this.selectedPage= 0
  });

  void changePage(newValue){
    selectedPage = newValue;
    notifyListeners();

  }
}