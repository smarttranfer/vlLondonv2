import 'dart:convert';
import 'package:vl_ui/Globle/Config_G.dart';
import 'package:vl_ui/Widget/W_signupCustome.dart';
import 'package:http/http.dart'as http;

class ActionJS {
  static String splitString(String content) {
    if (content.length > 15) {
      return content.substring(0, 13) + "...";
    } else {
      return content + "         ";
    }
  }
  static Future<bool> SignCustome(String namecustome , String nickname , String phone , String name_shop , String building_number , String street_name , String post_code) async {
    try {
      var headers = {
        'Authorization': 'Bearer ${Config_G.Token_app}',
        'Content-Type': 'application/json'
      };
      var request = http.Request('POST', Uri.parse('http://103.161.16.61:27554/customer/register'));
      request.body = json.encode({
        "full_name": "${namecustome}",
        "username": "${nickname}",
        "phone": "${phone}",
        "name_shop": "${name_shop}",
        "building_number": "${building_number}",
        "street_name": "${street_name}",
        "post_code": "${post_code}"
      });
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 500) {
        print(await response.stream.bytesToString());
      }
      else {
        print(response.reasonPhrase);
      }
      return false;
    } on Exception catch (e) {
      print("Exception"+e.toString());
      W_SignUp.check = false;
      return false;
    }
  }
}
