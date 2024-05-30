import 'package:flutter/cupertino.dart';

class PageViewUserDetailsProvider with ChangeNotifier{

  int _currentIndexPage = 0;

  int get currentIndexPage => _currentIndexPage;

  void setCurrentIndexPage(int index){
    _currentIndexPage = index;
    notifyListeners();

  }


}