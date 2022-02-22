class Information_Bill {
  late int id_shop;
  late int id_Custome;
  late int id_bill;
  late String namecustome;
  late String nameshop;
  late String date;
  late String code;
  late double money;
  late String note;

  int get information_id_shop {
    return id_shop;
  }

  void set information_id_shop(int id_shop) {
    this.id_shop = id_shop;
  }

  int get information_id_Custome {
    return id_Custome;
  }

  void set information_id_Custome(int id_Custome) {
    this.id_Custome = id_Custome;
  }

  int get information_id_bill {
    return id_bill;
  }

  void set information_id_bill(int id_bill) {
    this.id_bill = id_bill;
  }

  String get information_name {
    return namecustome;
  }

  void set information_name(String namecustome) {
    this.namecustome = namecustome;
  }

  String get information_nameshop {
    return nameshop;
  }

  void set information_nameshop(String nameshop) {
    this.nameshop = nameshop;
  }

  String get information_date {
    return date;
  }

  void set information_date(String date) {
    this.date = date;
  }

  String get information_code {
    return code;
  }

  void set information_code(String code) {
    this.code = code;
  }

  double get information_money {
    return money;
  }

  void set information_money(double money) {
    this.money = money;
  }

  String get information_note {
    return note;
  }

  void set information_note(String money) {
    this.note = note;
  }
}