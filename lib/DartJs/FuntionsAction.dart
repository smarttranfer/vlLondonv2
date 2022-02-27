import 'dart:convert';
import 'package:vl_ui/Globle/Config_G.dart';
import 'package:vl_ui/Widget/Homepage.dart';
import 'package:vl_ui/Widget/W_CreateChanger.dart';
import 'package:vl_ui/Widget/W_EditCustome.dart';
import 'package:vl_ui/Widget/W_signupCustome.dart';
import 'package:http/http.dart' as http;
import 'package:vl_ui/Widget/W_signupShop.dart';
import 'package:vl_ui/model/New_Changer.dart';

class ActionJS {
  static String splitString(String content) {
    if (content.length > 10) {
      return content.substring(0, 5) + "...";
    } else {
      return content+ " ";
    }
  }
  static int show_transation(int lengs) {
    if (lengs > 10) {
      return 10;
    } else {
      return lengs;
    }
  }
  static Future<String> SignCustome(
      String namecustome,
      String phone,
      String name_shop,
      String building_number,
      String street_name,
      String post_code) async {
    try {
      var headers = {
        'Authorization': 'Bearer ${Config_G.Token_app}',
        'Content-Type': 'application/json'
      };
      var request =
          http.Request('POST', Uri.parse('${Config_G.url}/customer/register'));
      request.body = json.encode({
        "name_customer": "${namecustome}",
        "phone_customer": "${phone}",
        "name_shop": "${name_shop}",
        "phone_shop": "${phone}",
        "building_number": "${building_number}",
        "street_name": "${street_name}",
        "post_code": "${post_code}"
      });
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      Config_G.id_Custome_shop = await response.stream.bytesToString();
      print(Config_G.id_Custome_shop);
      if (json.decode(Config_G.id_Custome_shop)["status"].toString() == "200") {
        W_SignUp.check = true;
        return Config_G.id_Custome_shop;
      } else {
        W_SignUp.check = false;
        return response.reasonPhrase.toString();
      }
    } on Exception catch (e) {
      print("Exception" + e.toString());
      W_SignUp.check = false;
      return e.toString();
    }
  }

  static Future<bool> Signshope(
      String phone,
      String name_shop,
      String building_number,
      String street_name,
      String post_code,
      int id_Custome) async {
    try {
      print(
          '"name": "${name_shop}","building_number": "${building_number}","street_name": "${street_name}","phone": "${phone}","post_code": "${post_code}","customer_id": ${id_Custome}');
      var headers = {
        'Authorization': 'Bearer ${Config_G.Token_app}',
        'Content-Type': 'application/json'
      };
      var request = http.Request('POST', Uri.parse('${Config_G.url}/shop'));
      request.body = json.encode({
        "name": "${name_shop}",
        "building_number": "${building_number}",
        "street_name": "${street_name}",
        "phone": "${phone}",
        "post_code": "${post_code}",
        "customer_id": id_Custome
      });
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      Config_G.check_done_reshop = await response.stream.bytesToString();
      if (json.decode(Config_G.check_done_reshop)["status"].toString() ==
          "200") {
        W_SignUp_shopo.checkdone_send_shop = true;
        print(Config_G.check_done_reshop);
      } else {
        print(Config_G.check_done_reshop);
        W_SignUp_shopo.checkdone_send_shop = false;
      }
      return false;
    } on Exception catch (e) {
      print("Exception" + e.toString());
      W_SignUp_shopo.checkdone_send_shop = false;
      return false;
    }
  }

  static Future<bool> EditCustome_shop(String name_shop, String building_number,
      String street_name, String phone, String post_code, int id_shop) async {
    try {
      var headers = {
        'Authorization': 'Bearer ${Config_G.Token_app}',
        'Content-Type': 'application/json'
      };
      var request =
          http.Request('PUT', Uri.parse('${Config_G.url}/shop/${id_shop}'));
      request.body = json.encode({
        "name": "${name_shop}",
        "building_number": "${building_number}",
        "street_name": "${street_name}",
        "phone": "${phone}",
        "post_code": "${post_code}"
      });
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      Config_G.check_done_edit_shop = await response.stream.bytesToString();
      if (json.decode(Config_G.check_done_edit_shop)["status"].toString() ==
          "200") {
        AnimeAppState.checkdone_send_shop_edit = true;
        print(Config_G.check_done_edit_shop);
      } else {
        print(Config_G.check_done_edit_shop);
        AnimeAppState.checkdone_send_shop_edit = false;
      }
      return false;
    } on Exception catch (e) {
      print("Exception" + e.toString());
      AnimeAppState.checkdone_send_shop_edit = false;
      return false;
    }
  }

  static Future<bool> EditCustome_Custome(
      String phone, String name, int id_customer) async {
    try {
      var headers = {
        'Authorization': 'Bearer ${Config_G.Token_app}',
        'Content-Type': 'application/json'
      };
      var request = http.Request(
          'PUT', Uri.parse('${Config_G.url}/customer/${id_customer}'));
      request.body = json.encode({
        "name": "${name}",
        "phone": "${phone}",
      });
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      Config_G.check_done_edit_custome_shop =
          await response.stream.bytesToString();
      print(Config_G.check_done_edit_custome_shop);
      if (json
              .decode(Config_G.check_done_edit_custome_shop)["status"]
              .toString() ==
          "200") {
        AnimeAppState.checkdone_send_Custome__shop_edit = true;
        print(Config_G.check_done_edit_custome_shop);
      } else {
        print(Config_G.check_done_edit_custome_shop);
        AnimeAppState.checkdone_send_Custome__shop_edit = false;
      }
      return false;
    } on Exception catch (e) {
      print("Exception" + e.toString());
      AnimeAppState.checkdone_send_Custome__shop_edit = false;
      return false;
    }
  }

  static Future<bool> EditCustome_Custome_Shop(
      String phone,
      String name,
      String username,
      String name_shop,
      String building_number,
      String street_name,
      String phone_shop,
      String post_code,
      int id_custome,
      int id_shop) async {
    try {
      var headers = {
        'Authorization': 'Bearer ${Config_G.Token_app}',
        'Content-Type': 'application/json'
      };
      var request = http.Request('PUT',
          Uri.parse('${Config_G.url}/customer/${id_custome}/shop/${id_shop}'));
      request.body = json.encode({
        "name_customer": "${name}",
        "phone_customer": "${phone}",
        "name_shop": "${name_shop}",
        "phone_shop": "${phone}",
        "building_number": "${building_number}",
        "street_name": "${street_name}",
        "post_code": "${post_code}",
      });
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      Config_G.check_done_edit_custome_shop = await response.stream.bytesToString();
      print(Config_G.check_done_edit_custome_shop);
      if (json
              .decode(Config_G.check_done_edit_custome_shop)["status"]
              .toString() ==
          "200") {
        AnimeAppState.checkdone_send_Custome__shop_edit = true;
      } else {
        AnimeAppState.checkdone_send_Custome__shop_edit = false;
      }
      return false;
    } on Exception catch (e) {
      print("Exception" + e.toString());
      AnimeAppState.checkdone_send_Custome__shop_edit = false;
      return false;
    }
  }

  static Future<bool> Deletes(int id_shop) async {
    try {
      var headers = {
        'Authorization': 'Bearer ${Config_G.Token_app}',
        'Content-Type': 'application/json'
      };
      var request_shop =
          http.Request('DELETE', Uri.parse('${Config_G.url}/shop/${id_shop}'));
      request_shop.headers.addAll(headers);
      http.StreamedResponse response_shop = await request_shop.send();
      return true;
    } on Exception catch (e) {
      return false;
    }
  }
  static Future<bool> Deletes_Custome(int id_shop) async {
    try {
      var headers = {
        'Authorization': 'Bearer ${Config_G.Token_app}',
        'Content-Type': 'application/json'
      };
      var request_shop =
      http.Request('DELETE', Uri.parse('${Config_G.url}/customer/${id_shop}'));
      request_shop.headers.addAll(headers);
      http.StreamedResponse response_shop = await request_shop.send();
      return true;
    } on Exception catch (e) {
      return false;
    }
  }

  static Future<bool> Delete_transaction(int id_transaction) async {
    try {
      print('${Config_G.url}/transaction/${id_transaction}');
      var headers = {
        'Authorization': 'Bearer ${Config_G.Token_app}',
        'Content-Type': 'application/json'
      };
      var request_shop = http.Request(
          'DELETE', Uri.parse('${Config_G.url}/transaction/${id_transaction}'));
      request_shop.headers.addAll(headers);
      http.StreamedResponse response_shop = await request_shop.send();
      print(await response_shop.stream.bytesToString());

      return true;
    } on Exception catch (e) {
      return false;
    }
  }

  static Future<bool> Create_transation(int id_shop,
        Money, String Content, String Date) async {
    try {
      print(id_shop);
      var headers = {
        'Authorization': 'Bearer ${Config_G.Token_app}',
        'Content-Type': 'application/json'
      };
      var transation =
          http.Request('POST', Uri.parse('${Config_G.url}/invoice'));
      transation.body = json.encode({
        "name": "${Content}",
        "original_amount": Money,
        "content": "${Content}",
        "create_date": "${Date}",
        "shop_id": id_shop
      });
      transation.headers.addAll(headers);
      http.StreamedResponse response_transation = await transation.send();
      Config_G.Create_Transation =
          await response_transation.stream.bytesToString();
      if (json.decode(Config_G.Create_Transation)["status"].toString() ==
          "200") {
        CreateChange.check_done_transation = true;
      } else {
        CreateChange.check_done_transation = false;
      }
      return true;
    } on Exception catch (e) {
      CreateChange.check_done_transation = false;
      print(e);
      return false;
    }
  }

  static Future<void> Get_Transation_Map_Shop_Custome() async {
    try {
      var headers = {
        'Authorization': 'Bearer ${Config_G.Token_app}',
        'Content-Type': 'application/json'
      };
      var Transation_Map_Shop_Custome = http.Request('GET', Uri.parse('${Config_G.url}/invoice/all'));
      Transation_Map_Shop_Custome.headers.addAll(headers);
      http.StreamedResponse Map_Shop_Customes = await Transation_Map_Shop_Custome.send();
      Config_G.Response_Transation_Map_Shop_Custome = await Map_Shop_Customes.stream.bytesToString();
      print(Config_G.Response_Transation_Map_Shop_Custome);
      if (json.decode(Config_G.Response_Transation_Map_Shop_Custome)["status"].toString() == "200") {
        Home.data_Sum = true;
        for (var i in json.decode(Config_G.Response_Transation_Map_Shop_Custome)["data"]) {
          Home.sumMoney += i["original_amount"];
          var Infor_Shop = http.Request('GET', Uri.parse('${Config_G.url}/shop/${i["shop_id"]}'));
          Infor_Shop.headers.addAll(headers);
          http.StreamedResponse Response_shop = await Infor_Shop.send();
          Config_G.Response_Shop = await Response_shop.stream.bytesToString();
          if (json.decode(Config_G.Response_Shop)["status"].toString() == "200") {
            var Infor_Custome = http.Request('GET', Uri.parse('${Config_G.url}/customer/${json.decode(Config_G.Response_Shop)["data"]["customer_id"]}'));
            Infor_Custome.headers.addAll(headers);
            http.StreamedResponse Response_Custome = await Infor_Custome.send();
            Config_G.Response_Custome = await Response_Custome.stream.bytesToString();
            Information_Bill listmodelbill = new Information_Bill();
            listmodelbill.id_shop = i["shop_id"];
            listmodelbill.id_Custome = json.decode(Config_G.Response_Shop)["data"]["customer_id"];
            listmodelbill.id_bill = i["id"];
            listmodelbill.namecustome = json.decode(Config_G.Response_Custome)["data"]["name"].toString();
            listmodelbill.nameshop = json.decode(Config_G.Response_Shop)["data"]["name"].toString();
            listmodelbill.date = i["create_date"].toString();
            listmodelbill.code = i["name"].toString();
            listmodelbill.money = i["original_amount"];
            listmodelbill.note = i["content"].toString();
            Config_G.modelBill.add(listmodelbill);
          }
        }
      }
    } on Exception catch (e) {
      print(e.toString());
      Home.check_loding_data = true;
    }
  }
}
