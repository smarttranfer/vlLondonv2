import 'package:flutter/material.dart';

class CounterModel with ChangeNotifier {
  double _counter = 0;

  getCounter() => _counter;

  setCounter(double counter) => _counter = counter;

  void incrementCounter(double money, double amount) {
    if(money.isNaN){
      _counter = amount;
      _counter-=0;
      notifyListeners();
    }else{
      _counter = amount;
      _counter-=money;
      notifyListeners();
    }

  }

  void decrementCounter() {
    _counter=0;
    notifyListeners();
  }


}