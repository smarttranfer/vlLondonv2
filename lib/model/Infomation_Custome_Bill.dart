

import 'dart:ffi';

import 'package:vl_ui/model/Information_Invoices_owe.dart';

class Information_Custome_Bill {
  late int _customer_id;
  late String _name_Custome;
  late double _unallocated;
  late double _owe;
  late int _total_owe;
  late int _total_pay;
  late List<Information_Invoices_owe> _list_invoices = [];

  int get customer_id => _customer_id;

  set customer_id(int value) {
    _customer_id = value;
  }

  String get name_Custome => _name_Custome;

  set name_Custome(String value) {
    _name_Custome = value;
  }

  double get unallocated => _unallocated;

  set unallocated(double value) {
    _unallocated = value;
  }

  double get owe => _owe;

  set owe(double value) {
    _owe = value;
  }

  int get total_owe => _total_owe;

  set total_owe(int value) {
    _total_owe = value;
  }

  int get total_pay => _total_pay;

  set total_pay(int value) {
    _total_pay = value;
  }

  List<Information_Invoices_owe> get list_invoices => _list_invoices;

  set list_invoices(List<Information_Invoices_owe> value) {
    _list_invoices = value;
  }
}