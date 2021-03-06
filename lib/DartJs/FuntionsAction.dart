import 'dart:convert';
import 'package:vl_ui/Globle/Config_G.dart';
import 'package:vl_ui/Widget/Homepage.dart';
import 'package:vl_ui/Widget/W_CreateChanger.dart';
import 'package:vl_ui/Widget/W_EditCustome.dart';
import 'package:vl_ui/Widget/W_Payment.dart';
import 'package:vl_ui/Widget/W_Payment.dart';
import 'package:vl_ui/Widget/W_PaymentInvoice.dart';
import 'package:vl_ui/Widget/W_signupCustome.dart';
import 'package:http/http.dart' as http;
import 'package:vl_ui/Widget/W_signupShop.dart';
import 'package:vl_ui/model/Infomation_Custome_Bill.dart';
import 'package:vl_ui/model/Information_Invoices_owe.dart';
import 'package:vl_ui/model/New_Changer.dart';
import 'package:vl_ui/model/listinvoice.dart';

class ActionJS {
  static String splitString(String content) {
    if (content.length > 10) {
      return content.substring(0, 5) + "...";
    } else {
      return content + "";
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
      Config_G.check_done_edit_custome_shop = await response.stream.bytesToString();
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
      print('${Config_G.url}/customer/${id_custome}/shop/${id_shop}');
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
        "phone_shop": "${phone_shop}",
        "building_number": "${building_number}",
        "street_name": "${street_name}",
        "post_code": "${post_code}",
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
      var request_shop = http.Request(
          'DELETE', Uri.parse('${Config_G.url}/customer/${id_shop}'));
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

  static Future<bool> Create_transation(
      int id_shop, double Money, String Content, String Date) async {
    try {
      print(id_shop);
      var headers = {
        'Authorization': 'Bearer ${Config_G.Token_app}',
        'Content-Type': 'application/json'
      };
      var transation =
          http.Request('POST', Uri.parse('${Config_G.url}/invoice'));
      transation.body = json.encode({
        "name": "VL London BILL",
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

  static Future<void> Get_Voice() async {
    try {
      var headers = {
        'Authorization': 'Bearer ${Config_G.Token_app}',
        'Content-Type': 'application/json'
      };
      var Transation_Voice =
          http.Request('GET', Uri.parse('${Config_G.url}/invoice/info/all'));
      Transation_Voice.headers.addAll(headers);
      http.StreamedResponse Map_Voice = await Transation_Voice.send();
      Config_G.Get_Invoice = await Map_Voice.stream.bytesToString();
      if (json.decode(Config_G.Get_Invoice)["status"].toString() == "200") {
        Config_G.model_Custome_Bill.clear();
        print(json.decode(Config_G.Get_Invoice)["data"]);
        for (var i in json.decode(Config_G.Get_Invoice)["data"]) {
          Information_Custome_Bill In1 = new Information_Custome_Bill();
          In1.customer_id = i["customer_id"];
          In1.name_Custome = i["name"];
          In1.unallocated = i["unallocated"];
          if (i["owe"] == null) {
            In1.owe = 0.0;
          } else {
            In1.owe = i["owe"];
          }
          In1.total_owe = i["total_owe"];
          In1.total_pay = i["total_pay"];
          for (var k in i["invoices_owe"]) {
            Information_Invoices_owe In2 = new Information_Invoices_owe();
            In2.id_invoices = k["id"];
            In2.name_Bill = k["name"];
            In2.Content = k["content"];
            In2.original_amount = k["original_amount"];
            In2.user_id = k["user_id"];
            In2.shop_id = k["shop_id"];
            In2.create_date = k["create_date"];
            In1.list_invoices.add(In2);
          }
          Config_G.model_Custome_Bill.add(In1);
        }
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  static Future<void> Get_Transation_Map_Shop_Custome() async {
    try {
      var headers = {
        'Authorization': 'Bearer ${Config_G.Token_app}',
        'Content-Type': 'application/json'
      };
      var Transation_Map_Shop_Custome =
          http.Request('GET', Uri.parse('${Config_G.url}/invoice/all'));
      Transation_Map_Shop_Custome.headers.addAll(headers);
      http.StreamedResponse Map_Shop_Customes =
          await Transation_Map_Shop_Custome.send();
      Config_G.Response_Transation_Map_Shop_Custome = await Map_Shop_Customes.stream.bytesToString();
      print(Config_G.Response_Transation_Map_Shop_Custome);
      if (json.decode(Config_G.Response_Transation_Map_Shop_Custome)["status"].toString() == "200") {
        Home.data_Sum = true;
        for (var i in json
            .decode(Config_G.Response_Transation_Map_Shop_Custome)["data"]) {
          Home.sumMoney += i["original_amount"];
          var Infor_Shop = http.Request(
              'GET', Uri.parse('${Config_G.url}/shop/${i["shop_id"]}'));
          Infor_Shop.headers.addAll(headers);
          http.StreamedResponse Response_shop = await Infor_Shop.send();
          Config_G.Response_Shop = await Response_shop.stream.bytesToString();
          if (json.decode(Config_G.Response_Shop)["status"].toString() ==
              "200") {
            var Infor_Custome = http.Request(
                'GET',
                Uri.parse(
                    '${Config_G.url}/customer/${json.decode(Config_G.Response_Shop)["data"]["customer_id"]}'));
            Infor_Custome.headers.addAll(headers);
            http.StreamedResponse Response_Custome = await Infor_Custome.send();
            Config_G.Response_Custome =
                await Response_Custome.stream.bytesToString();
            Information_Bill listmodelbill = new Information_Bill();
            listmodelbill.id_shop = i["shop_id"];
            listmodelbill.id_Custome =
                json.decode(Config_G.Response_Shop)["data"]["customer_id"];
            listmodelbill.id_bill = i["id"];
            listmodelbill.namecustome = json
                .decode(Config_G.Response_Custome)["data"]["name"]
                .toString();
            listmodelbill.nameshop =
                json.decode(Config_G.Response_Shop)["data"]["name"].toString();
            listmodelbill.date = i["create_date"].toString();
            listmodelbill.code = i["name"].toString();
            listmodelbill.money = i["original_amount"];
            listmodelbill.note = i["content"].toString();
            Config_G.modelBill.add(listmodelbill);
          }
        }
      }
    } on Exception catch (e) {
      Home.data_Sum = false;
      Home.check_loding_data = true;
    }

  }
  static Future<bool> GetInforShop(int id_Custome) async {
    try {
      W_Payments.billShop.clear();
      W_Payments.allInfo_Shop.clear();
      print('${Config_G.url}/customer/info/${id_Custome}');
      var headers = {
        'Authorization': 'Bearer ${Config_G.Token_app}',
        'Content-Type': 'application/json'
      };
      var request_shop = http.Request(
          'GET', Uri.parse('${Config_G.url}/customer/info/${id_Custome}'));
      request_shop.headers.addAll(headers);
      http.StreamedResponse response_shop = await request_shop.send();
      String inforshop = await response_shop.stream.bytesToString();
      print(json.decode(inforshop)["data"]["phone"]);
      W_Payments.allInfo_Shop.add({
             "phone": json.decode(inforshop)["data"]["phone"]
            });
      for (var i in json.decode(inforshop)["data"]["shops"]) {
          W_Payments.billShop.add({
            "id": "${i["id"]}",
            "name": "${i["name"]}",
            "total_owe": "${i["original_amount"]-i["payment"]}",
          });
      }
      return true;
    } on Exception catch (e) {
      return false;
    }
  }
  static Future<bool> GetInforShop_bill(int id_shop) async {
    try {
      W_PaymentsInove.listbill.clear();
      print('${Config_G.url}/invoice/all_by_shop/${id_shop}');
      var headers = {
        'Authorization': 'Bearer ${Config_G.Token_app}',
        'Content-Type': 'application/json'
      };
      var request_shop = http.Request(
          'GET', Uri.parse('${Config_G.url}/invoice/all_by_shop/${id_shop}'));
      request_shop.headers.addAll(headers);
      http.StreamedResponse response_shop = await request_shop.send();
      String inforshop = await response_shop.stream.bytesToString();
      for (var i in json.decode(inforshop)["data"]["invoices"]) {
        print(json.decode(inforshop)["data"]["invoices"]);
        W_PaymentsInove.listbill.add({
          "id": "${i["id"]}",
          "name": "${i["name"]}",
          "content": "${i["content"]}",
          "total_owe": "${i["payment"]}",
          "original_amount" : '${i["original_amount"]}',
          "date" :"${i["create_date"]}",
          "id_custome":"${json.decode(inforshop)["data"]["customer_id"]}"
        });
      }
      return true;
    } on Exception catch (e) {
      return false;
    }
  }

  static Future<bool> Create_transation_payment(
      int id_Custome, double unallocated, List<listinvoice> listpayment) async {
    try {
      List<Map<String, dynamic>> invoicelist = [];
      for(var i in listpayment){
        invoicelist.add({
          "invoice_id": i.invoice_id,
          "payment": i.payment
        });
      }

      print(json.encode({
        "customer_id": id_Custome,
        "unallocated": unallocated,
        "invoices": invoicelist
      }));
      var headers = {
        'Authorization': 'Bearer ${Config_G.Token_app}',
        'Content-Type': 'application/json'
      };

      var transation =
      http.Request('POST', Uri.parse('${Config_G.url}/transaction'));
      transation.body = json.encode({
        "customer_id": id_Custome,
        "unallocated": unallocated,
        "invoices": invoicelist
      });
      transation.headers.addAll(headers);
      http.StreamedResponse response_transation = await transation.send();
      String responses = await response_transation.stream.bytesToString();
      print(responses);
      if (json.decode(responses)["status"].toString() == "200") {
        W_PaymentsInove.check_done = true;
      } else {
        W_PaymentsInove.check_done = false;
      }
      return true;
    } on Exception catch (e) {
      W_PaymentsInove.check_done = false;
      return false;
    }
  }

}
