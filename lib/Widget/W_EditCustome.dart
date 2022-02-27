import 'dart:convert';
import 'package:vl_ui/Globle/Config_G.dart';
import 'package:vl_ui/Object_Wiget/SlidableAcion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';
import 'package:vl_ui/model/Information_Cutome.dart';
import 'package:vl_ui/model/Information_Shop.dart';
import 'W_Signupmanger.dart';

class AnimeApp extends StatefulWidget {
  AnimeApp({Key? key}) : super(key: key);

  @override
  AnimeAppState createState() => AnimeAppState();
}

class AnimeAppState extends State<AnimeApp> {
  static bool checkdone_send_shop_edit = false;
  static bool checkdone_send_Custome_edit = false;
  static bool checkdone_send_Custome__shop_edit = false;
  final List<Map<String, dynamic>> _allUsers = [];
  List<Map<String, dynamic>> _foundUsers = [];
  String searchString = "";
  bool checknull = false;
  bool check_loding_data = true;
  @override
  void initState() {
    Config_G.NameCustom_shop.clear();
    asyncMethod();
    if (Config_G.NameCustom_shop.isEmpty) {
      setState(() {
        checknull = true;
      });
    } else {
      setState(() {
        checknull = false;
      });
    }
    super.initState();
  }

  void asyncMethod() async {
    await GetInformation();
    for (Information_Cutome i in Config_G.NameCustom_shop) {
      if (i.nameshop.length > 0) {
        for (var shop in i.nameshop) {
          _allUsers.add({
            "customer_id": i.id,
            "id_chop": shop.id.toInt(),
            "name_nickname": "${i.namecustome}",
            "name": "${i.namecustome}",
            "shop": shop.nameshop,
            "phone_shop": "${shop.telephone}",
            "phone_custom": "${i.telephone}",
            "Apartment_number": "${shop.building_number}",
            "Post_code": "${shop.post_code}",
            "stresst": "${shop.address}",
          });
        }
      } else {
        _allUsers.add({
          "customer_id": i.id,
          "id_chop": "",
          "name_nickname": "${i.namecustome}",
          "name": "${i.namecustome}",
          "shop": "",
          "phone_shop": "",
          "phone_custom": "${i.telephone}",
          "Apartment_number": "",
          "Post_code": "",
          "stresst": "",
        });
      }
    }
    _foundUsers = _allUsers;
  }

  Future<void> GetInformation() async {
    try {
      var headers = {
        'Authorization': 'Bearer ${Config_G.Token_app}',
        'Content-Type': 'application/json'
      };
      var request = http.Request(
          'GET', Uri.parse('${Config_G.url}/customer/info/all'));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      Config_G.id_Custome_shop = await response.stream.bytesToString();
      if (json.decode(Config_G.id_Custome_shop)["status"].toString() == "200") {
        for (var i in json.decode(Config_G.id_Custome_shop)["data"]) {
          print(i);
          Information_Cutome s1 = new Information_Cutome();
          s1.id = i["id"];
          s1.namecustome = i["name"];
          s1.telephone = i["phone"];
          for (var shop in i["shops"]) {
            Information_Shop s0 = new Information_Shop();
            s0.id = shop["id"];
            s0.telephone = shop["phone"];
            s0.post_code = shop["post_code"];
            s0.building_number = shop["building_number"];
            s0.nameshop = shop["name"];
            s0.address = shop["street_name"];
            s1.nameshop.add(s0);
          }
          Config_G.NameCustom_shop.add(s1);
        }
        setState(() {
          check_loding_data = false;
        });
      } else {
        print(response.reasonPhrase);
      }
    } on Exception catch (e) {
      print("Exception" + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assest/background/bkr.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  duration: Duration(
                                      milliseconds: Config_G.timeDruation),
                                  reverseDuration: Duration(
                                      milliseconds: Config_G.timeDruation),
                                  child: W_Signupmanagee()));
                        },
                        icon: Icon(Icons.arrow_back_ios_outlined),
                        color: Colors.white,
                      ),
                      SizedBox(width: MediaQuery.of(context).size.height / 30),
                      Text(
                        Config_G.check_lang
                            ? "CHỈNH SỬA THÔNG TIN"
                            : "EDIT INFORMATION",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 14),
                    ],
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            searchString = value.toLowerCase();
                          });
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderRadius:
                                  BorderRadius.all(Radius.circular(80.0)),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Search',
                            suffixIcon: Icon(Icons.search)),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                      flex: 20,
                      child: SingleChildScrollView(
                          child: Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 1.3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 7.0, color: Colors.black)
                                  ]),
                              child: Card(
                                  elevation: 50,
                                  child: check_loding_data
                                      ? Center(
                                          child: FutureBuilder(
                                            builder: (context, snapshot) {
                                              if (snapshot.hasData) {
                                                for (Information_Cutome i
                                                    in Config_G
                                                        .NameCustom_shop) {
                                                  print(i.id);
                                                }
                                              } else if (snapshot.hasError) {
                                                return Text(
                                                    "${snapshot.error}");
                                              }
                                              // By default, show a loading spinner
                                              return CircularProgressIndicator(
                                                color: Colors.green,
                                              );
                                            },
                                          ),
                                        )
                                      : ListViewsCustome(
                                          foundUsers: _allUsers)))))
                ],
              ),
            )));
  }
}
