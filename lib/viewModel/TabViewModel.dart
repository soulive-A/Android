//모델분석 결과를 위한 viewmodel

import 'package:flutter/cupertino.dart';

class TabViewModel extends ChangeNotifier{
  int _selectedTab = 0;
  int get selectedTab => _selectedTab;

  void selectTab(int index){
    _selectedTab = index;
    notifyListeners();
  }
}