import 'Information_Shop.dart';

class Information_Cutome {
  late int id;
  late String namecustome;
  late String telephone;
  late String Nickname;
  late List<Information_Shop> nameshop =[];



  String get information_name {
    return namecustome;
  }

  void set information_name(String namecustome) {
    this.namecustome = namecustome;
  }

  String get information_telephone {
    return telephone;
  }

  void set information_telephone(String telephone) {
    this.telephone = telephone;
  }

  String get information_Nickname {
    return Nickname;
  }

  void set information_Nickname(String Nickname) {
    this.Nickname = Nickname;
  }

  List<Information_Shop> get information_nameshops {
    return nameshop;
  }

  void set information_nameshop(String nameshop) {
    this.nameshop = nameshop as List<Information_Shop>;
  }
}
