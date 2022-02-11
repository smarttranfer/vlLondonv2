import 'package:flutter/material.dart';
import 'package:vl_ui/Globle/Config_G.dart';
import 'New_Changer.dart';

class Bill with ChangeNotifier{

  bool checkEmty = false;

  getCheckBill()=> checkEmty;
  getBill() => Config_G.modelBill;

  void addBill(String name , String shop , String code ,String date ,String money,String note) {
    Information_Bill listmodelbill = new Information_Bill();
    listmodelbill.namecustome = name;
    listmodelbill.nameshop = shop;
    listmodelbill.code = code;
    listmodelbill.date = date;
    listmodelbill.money = money;
    listmodelbill.note = note;
    Config_G.modelBill.add(listmodelbill);
    checkEmty = true;
    notifyListeners();
  }


}