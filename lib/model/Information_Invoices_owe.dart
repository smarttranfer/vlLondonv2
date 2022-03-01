import 'dart:ffi';

class Information_Invoices_owe {
  late int _id_invoices;
  late String _name_Bill;
  late String _Content;
  late double _original_amount;
  late int _user_id;
  late int _shop_id;
  late String _create_date;

  int get id_invoices => _id_invoices;

  set id_invoices(int value) {
    _id_invoices = value;
  }
  String get name_Bill => _name_Bill;

  set name_Bill(String value) {
    _name_Bill = value;
  }

  String get Content => _Content;

  set Content(String value) {
    _Content = value;
  }

  double get original_amount => _original_amount;

  set original_amount(double value) {
    _original_amount = value;
  }

  int get user_id => _user_id;

  set user_id(int value) {
    _user_id = value;
  }

  int get shop_id => _shop_id;

  set shop_id(int value) {
    _shop_id = value;
  }

  String get create_date => _create_date;

  set create_date(String value) {
    _create_date = value;
  }
}