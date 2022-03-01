import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vl_ui/DartJs/FuntionsAction.dart';
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
  final TextEditingController _controllernickname = TextEditingController();
  final TextEditingController _controlleruser = TextEditingController();
  final TextEditingController _controllertelephone = TextEditingController();
  final TextEditingController _controllertelephoneC = TextEditingController();
  final TextEditingController _controllernumber = TextEditingController();
  final TextEditingController _controllerpostcode = TextEditingController();
  final TextEditingController _controllerstresst = TextEditingController();
  final TextEditingController _controllershop = new TextEditingController();
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


  bool check_shop(String nameShop) {
    if (nameShop.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
          user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundUsers = results;
    });
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
            if(shop["phone"] == null){
              s0.telephone = "";
            }else{
              s0.telephone = shop["phone"];
            }
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
                          return _runFilter(value);
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
                                      : Scaffold(
                                      body: ListView.builder(
                                          padding: const EdgeInsets.all(15),
                                          itemCount: _foundUsers.length,
                                          itemBuilder: (BuildContext context, int index) {
                                            return Card(
                                                elevation: 50,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(15.0),
                                                ),
                                                shadowColor: Colors.black54,
                                                child: ListTile(
                                                  title: Text("${_foundUsers[index]["name_nickname"]}"),
                                                  subtitle: Text("${_foundUsers[index]["shop"]}"),
                                                  trailing: Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      IconButton(
                                                          onPressed: () {
                                                            AwesomeDialog(
                                                              padding: EdgeInsets.only(left: 10, right: 10),
                                                              context: context,
                                                              animType: AnimType.RIGHSLIDE,
                                                              dialogType: DialogType.SUCCES,
                                                              body: Container(
                                                                child: Column(
                                                                  children: <Widget>[
                                                                    Padding(
                                                                        padding: EdgeInsets.only(),
                                                                        child: new Row(
                                                                            mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                            children: <Widget>[
                                                                              new Expanded(
                                                                                  child: new TextField(
                                                                                      readOnly: check_shop(
                                                                                          _foundUsers[index]
                                                                                          ["shop"]),
                                                                                      // focusNode: FocusNode(),
                                                                                      decoration:
                                                                                      InputDecoration(
                                                                                        icon: Icon(
                                                                                          Icons
                                                                                              .shopping_cart_outlined,
                                                                                          color: Colors.green,
                                                                                        ),
                                                                                        labelText:
                                                                                        'Name Shop',
                                                                                      ),
                                                                                      controller:
                                                                                      _controllershop
                                                                                        ..text =
                                                                                        _foundUsers[
                                                                                        index]
                                                                                        [
                                                                                        "shop"])),
                                                                            ])),
                                                                    TextField(
                                                                      decoration: InputDecoration(
                                                                        hintText: _foundUsers[index]["name"],
                                                                        icon: Icon(
                                                                          Icons.person_pin_outlined,
                                                                          color: Colors.green,
                                                                        ),
                                                                        labelText: 'Name Customer',
                                                                      ),
                                                                      controller: _controlleruser
                                                                        ..text = (_foundUsers[index]["name"]),
                                                                    ),
                                                                    TextField(
                                                                      decoration: InputDecoration(
                                                                        hintText: _foundUsers[index]
                                                                        ["phone_custom"],
                                                                        icon: Icon(
                                                                          Icons.phone,
                                                                          color: Colors.green,
                                                                        ),
                                                                        labelText: 'Phone Customer',
                                                                      ),
                                                                      controller: _controllertelephoneC
                                                                        ..text =
                                                                        _foundUsers[index]["phone_custom"],
                                                                    ),
                                                                    TextField(
                                                                      readOnly: check_shop(
                                                                          _foundUsers[index]["phone_shop"]),
                                                                      decoration: InputDecoration(
                                                                        icon: Icon(
                                                                          Icons.phone,
                                                                          color: Colors.green,
                                                                        ),
                                                                        labelText: 'Phone Shop',
                                                                      ),
                                                                      controller: _controllertelephone
                                                                        ..text =
                                                                        _foundUsers[index]["phone_shop"],
                                                                    ),
                                                                    TextField(
                                                                      readOnly: check_shop(
                                                                          _foundUsers[index]["shop"]),
                                                                      decoration: InputDecoration(
                                                                        icon: Icon(
                                                                          Icons.add_location_alt_outlined,
                                                                          color: Colors.green,
                                                                        ),
                                                                        labelText: 'Apartment number',
                                                                      ),
                                                                      controller: _controllernumber
                                                                        ..text = _foundUsers[index]
                                                                        ["Apartment_number"],
                                                                    ),
                                                                    TextField(
                                                                      readOnly: check_shop(
                                                                          _foundUsers[index]["shop"]),
                                                                      decoration: InputDecoration(
                                                                        icon: Icon(
                                                                          Icons.local_post_office_outlined,
                                                                          color: Colors.green,
                                                                        ),
                                                                        labelText: 'Post code',
                                                                      ),
                                                                      controller: _controllerpostcode
                                                                        ..text =
                                                                        _foundUsers[index]["Post_code"],
                                                                    ),
                                                                    TextField(
                                                                      readOnly: check_shop(
                                                                          _foundUsers[index]["shop"]),
                                                                      decoration: InputDecoration(
                                                                        icon: Icon(
                                                                          Icons.edit_road_rounded,
                                                                          color: Colors.green,
                                                                        ),
                                                                        labelText: 'Stresst',
                                                                      ),
                                                                      controller: _controllerstresst
                                                                        ..text = _foundUsers[index]["stresst"],
                                                                    ),
                                                                    SizedBox(
                                                                      height: 10,
                                                                    ),
                                                                    ElevatedButton(
                                                                      child: Text("Thay đổi",
                                                                          style: TextStyle(
                                                                              fontFamily: 'Poppins',
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Colors.white,
                                                                              fontSize: 20)),
                                                                      onPressed: () async {
                                                                        print(check_shop(
                                                                            _foundUsers[index]["shop"]));
                                                                        if (check_shop(
                                                                            _foundUsers[index]["shop"]) ==
                                                                            false) {
                                                                          await ActionJS
                                                                              .EditCustome_Custome_Shop(
                                                                              _controllertelephone.text,
                                                                              _controlleruser.text,
                                                                              _controllernickname.text,
                                                                              _controllershop.text,
                                                                              _controllernumber.text,
                                                                              _controllerstresst.text,
                                                                              _controllertelephone.text,
                                                                              _controllerpostcode.text,
                                                                              _foundUsers[index]
                                                                              ["customer_id"],
                                                                              _foundUsers[index]
                                                                              ["id_chop"]);
                                                                        } else {
                                                                          await ActionJS.EditCustome_Custome(
                                                                              _controllertelephone.text,
                                                                              _controlleruser.text,
                                                                              _foundUsers[index]
                                                                              ["customer_id"]);
                                                                        }
                                                                        if (AnimeAppState
                                                                            .checkdone_send_Custome__shop_edit ==
                                                                            true) {
                                                                          Fluttertoast.showToast(
                                                                              msg:
                                                                              "Sửa thông tin thành công ",
                                                                              toastLength: Toast.LENGTH_SHORT,
                                                                              gravity: ToastGravity.BOTTOM,
                                                                              timeInSecForIosWeb: 2,
                                                                              backgroundColor: Colors.green,
                                                                              textColor: Colors.white,
                                                                              fontSize: 16.0);
                                                                          Navigator.of(context).pop();
                                                                          Navigator.pushReplacement(
                                                                              context,
                                                                              PageTransition(
                                                                                  type: PageTransitionType
                                                                                      .rightToLeft,
                                                                                  duration: Duration(
                                                                                      milliseconds: 0),
                                                                                  reverseDuration: Duration(
                                                                                      milliseconds: Config_G
                                                                                          .timeDruation),
                                                                                  child: AnimeApp()));
                                                                        } else {
                                                                          Fluttertoast.showToast(
                                                                              msg: json.decode(Config_G
                                                                                  .check_done_edit_shop)[
                                                                              "data"] +
                                                                                  json.decode(Config_G
                                                                                      .check_done_edit_shop)[
                                                                                  "message"],
                                                                              toastLength: Toast.LENGTH_SHORT,
                                                                              gravity: ToastGravity.BOTTOM,
                                                                              timeInSecForIosWeb: 10,
                                                                              backgroundColor: Colors.red,
                                                                              textColor: Colors.white,
                                                                              fontSize: 16.0);
                                                                        }
                                                                      },
                                                                      style: ElevatedButton.styleFrom(
                                                                        primary: Colors.green,
                                                                        side: BorderSide(
                                                                          width: 5.0,
                                                                          color: Colors.green,
                                                                        ),
                                                                        minimumSize: Size(150, 48),
                                                                        maximumSize: Size(200, 50),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 10,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ).show();
                                                          },
                                                          icon: Icon(Icons.edit)),
                                                      IgnorePointer(
                                                          ignoring: Config_G.ROLE_ADMIN,
                                                          child: IconButton(
                                                              onPressed: () {
                                                                showDialog(
                                                                  context: context,
                                                                  builder: (BuildContext context) {
                                                                    return AlertDialog(
                                                                      title: Text(Config_G.check_lang
                                                                          ? "Thông báo hệ thống"
                                                                          : "System Notifications"),
                                                                      content: Text(check_shop(
                                                                          _foundUsers[index]["shop"])
                                                                          ? (Config_G.check_lang
                                                                          ? 'Bạn muốn xóa khách hang ${_foundUsers[index]["name"]}?'
                                                                          : 'You want to delete Customer ${_foundUsers[index]["name"]}?')
                                                                          : (Config_G.check_lang
                                                                          ? 'Bạn muốn xóa shop ${_foundUsers[index]["shop"]}?'
                                                                          : 'You want to delete the shop ${_foundUsers[index]["shop"]}?')),
                                                                      actions: <Widget>[
                                                                        FlatButton(
                                                                          child: Text(Config_G.check_lang
                                                                              ? "Đông ý"
                                                                              : "YES"),
                                                                          onPressed: () async {
                                                                            check_shop(
                                                                                _foundUsers[index]["shop"])
                                                                                ? await await ActionJS
                                                                                .Deletes_Custome(
                                                                                _foundUsers[index]
                                                                                ["customer_id"])
                                                                                : await ActionJS.Deletes(
                                                                                _foundUsers[index]
                                                                                ["id_chop"]);
                                                                            Navigator.of(context).pop();
                                                                            Navigator.pushReplacement(
                                                                                context,
                                                                                PageTransition(
                                                                                    type: PageTransitionType
                                                                                        .rightToLeft,
                                                                                    duration: Duration(
                                                                                        milliseconds: 0),
                                                                                    reverseDuration: Duration(
                                                                                        milliseconds: Config_G
                                                                                            .timeDruation),
                                                                                    child: AnimeApp()));
                                                                          },
                                                                        ),
                                                                        FlatButton(
                                                                          child: Text(Config_G.check_lang
                                                                              ? "Hủy bỏ"
                                                                              : "CANCEL"),
                                                                          onPressed: () {
                                                                            //Put your code here which you want to execute on Cancel button click.
                                                                            Navigator.of(context).pop();
                                                                          },
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                              icon: Icon(Icons.delete)))
                                                    ],
                                                  ),
                                                ));
                                          }))))))
                ],
              ),
            )));
  }
}
