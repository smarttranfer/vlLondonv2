import 'dart:convert';
import 'package:vl_ui/Globle/Config_G.dart';
import 'package:vl_ui/Widget/W_EditCustome.dart';
import 'package:vl_ui/Widget/W_signupCustome.dart';
import 'package:http/http.dart' as http;
import 'package:vl_ui/Widget/W_signupShop.dart';

class ActionJS {
  static String splitString(String content) {
    if (content.length > 15) {
      return content.substring(0, 13) + "...";
    } else {
      return content + "         ";
    }
  }

  static Future<String> SignCustome(
      String namecustome,
      String nickname,
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
      var request = http.Request(
          'POST', Uri.parse('http://103.161.16.61:27554/customer/register'));
      request.body = json.encode({
        "full_name": "${namecustome}",
        "username": "${nickname}",
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
      print('"name": "${name_shop}","building_number": "${building_number}","street_name": "${street_name}","phone": "${phone}","post_code": "${post_code}","customer_id": ${id_Custome}');
      var headers = {
        'Authorization': 'Bearer ${Config_G.Token_app}',
        'Content-Type': 'application/json'
      };
      var request =
          http.Request('POST', Uri.parse('http://103.161.16.61:27554/shop'));
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
      var request = http.Request(
          'PUT', Uri.parse('http://103.161.16.61:27554/shop/${id_shop}'));
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
      String phone, String name, String username, int id_custome) async {
    try {
      var headers = {
        'Authorization': 'Bearer ${Config_G.Token_app}',
        'Content-Type': 'application/json'
      };
      var request = http.Request('PUT',
          Uri.parse('http://103.161.16.61:27554/customer/${id_custome}'));
      request.body = json.encode({
        "full_name": "${name}",
        "phone": "${phone}",
        "username": "${username}"
      });
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      Config_G.check_done_edit_custome = await response.stream.bytesToString();
      if (json.decode(Config_G.check_done_edit_custome)["status"].toString() ==
          "200") {
        AnimeAppState.checkdone_send_Custome_edit = true;
        print(Config_G.check_done_edit_custome);
      } else {
        print(Config_G.check_done_edit_custome);
        AnimeAppState.checkdone_send_Custome_edit = false;
      }
      return false;
    } on Exception catch (e) {
      print("Exception" + e.toString());
      AnimeAppState.checkdone_send_Custome_edit = false;
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
      print('"full_name": "${name}", "username": "${username}", "phone_customer": "${phone}", "name_shop": "${name_shop}", "phone_shop": "${phone}", "building_number": "${building_number}", "street_name": "${street_name}", "post_code": "${post_code}"');
      var headers = {
        'Authorization': 'Bearer ${Config_G.Token_app}',
        'Content-Type': 'application/json'
      };
      var request = http.Request(
          'PUT',
          Uri.parse(
              'http://103.161.16.61:27554/customer/${id_custome}/shop/${id_shop}'));
      request.body = json.encode({
      "full_name": "${name}",
      "username": "${username}",
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
      if (json.decode(Config_G.check_done_edit_custome_shop)["status"].toString() ==
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

  static Future<bool> Deletes(int id_shop) async {
    try {
      var headers = {
        'Authorization': 'Bearer ${Config_G.Token_app}',
        'Content-Type': 'application/json'
      };
      var request_shop = http.Request(
          'DELETE', Uri.parse('http://103.161.16.61:27554/shop/${id_shop}'));
      request_shop.headers.addAll(headers);
      http.StreamedResponse response_shop = await request_shop.send();
      return true;
    } on Exception catch (e) {
      return false;
    }
  }
}
