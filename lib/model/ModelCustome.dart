import 'package:flutter/material.dart';
import 'package:vl_ui/Globle/Config_G.dart';
import 'New_Changer.dart';

class Bill with ChangeNotifier{
  int _counter = 0;
  bool checkEmty = true;
  getCheckBill()=> checkEmty;
  getCustomeBill(int indext) => Config_G.modelBill[indext].namecustome;
  getShopBill(int indext) => Config_G.modelBill[indext].nameshop;
  getMoneyBill(int indext) => Config_G.modelBill[indext].money;
  getCounter() => _counter;
  void addBill(String name , String shop , String code ,String date ,String money,String note) {
    Information_Bill listmodelbill = new Information_Bill();
    listmodelbill.namecustome = name;
    listmodelbill.nameshop = shop;
    listmodelbill.code = code;
    listmodelbill.date = date;
    listmodelbill.money = money;
    listmodelbill.note = note;
    Config_G.modelBill.add(listmodelbill);
    Config_G.modelBill.length;
    checkEmty = false;
    notifyListeners();
  }
  void incrementCounter() {
    _counter++;
    notifyListeners();
  }


}