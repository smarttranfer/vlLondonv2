import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:vl_ui/DartJs/FuntionsAction.dart';
import 'package:vl_ui/Globle/Config_G.dart';
import 'package:vl_ui/Widget/W_EditCustome.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vl_ui/model/Information_Cutome.dart';

final TextEditingController _controllershop = TextEditingController();
final TextEditingController _controllernickname = TextEditingController();
final TextEditingController _controlleruser = TextEditingController();
final TextEditingController _controllertelephone = TextEditingController();
final TextEditingController _controllernumber = TextEditingController();
final TextEditingController _controllerpostcode = TextEditingController();
final TextEditingController _controllerstresst = TextEditingController();

class ListViewsCustome extends StatelessWidget {
  const ListViewsCustome({
    Key? key,
    required this.foundUsers,
  }) : super(key: key);

  bool check_shop(String nameShop) {
    if (nameShop.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  final List<Map<String, dynamic>> foundUsers;
  @override
  Widget build(BuildContext context) {
    final TextEditingController _controllershop = new TextEditingController();
    int indexshop = 0;
    return Scaffold(
        body: ListView.builder(
            padding: const EdgeInsets.all(15),
            itemCount: foundUsers.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  elevation: 50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  shadowColor: Colors.black54,
                  child: ListTile(
                    title: Text("${foundUsers[index]["name_nickname"]}"),
                    subtitle: Text("${foundUsers[index]["shop"]}"),
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
                                                            foundUsers[index]
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
                                                                  foundUsers[
                                                                          index]
                                                                      [
                                                                      "shop"])),
                                              ])),
                                      TextField(
                                        decoration: InputDecoration(
                                          hintText: foundUsers[index]["name"],
                                          icon: Icon(
                                            Icons.person_pin_outlined,
                                            color: Colors.green,
                                          ),
                                          labelText: 'Name Custome',
                                        ),
                                        controller: _controlleruser
                                          ..text = (foundUsers[index]["name"]),
                                      ),
                                      TextField(
                                        decoration: InputDecoration(
                                          hintText: foundUsers[index]
                                              ["phone_custom"],
                                          icon: Icon(
                                            Icons.phone,
                                            color: Colors.green,
                                          ),
                                          labelText: 'Telephone Custome',
                                        ),
                                        controller: _controllertelephone
                                          ..text =
                                              foundUsers[index]["phone_custom"],
                                      ),
                                      TextField(
                                        readOnly: check_shop(
                                            foundUsers[index]["shop"]),
                                        decoration: InputDecoration(
                                          icon: Icon(
                                            Icons.phone,
                                            color: Colors.green,
                                          ),
                                          labelText: 'Telephone Shop',
                                        ),
                                        controller: _controllertelephone
                                          ..text =
                                              foundUsers[index]["phone_shop"],
                                      ),
                                      TextField(
                                        readOnly: check_shop(
                                            foundUsers[index]["shop"]),
                                        decoration: InputDecoration(
                                          icon: Icon(
                                            Icons.add_location_alt_outlined,
                                            color: Colors.green,
                                          ),
                                          labelText: 'Apartment number',
                                        ),
                                        controller: _controllernumber
                                          ..text = foundUsers[index]
                                              ["Apartment_number"],
                                      ),
                                      TextField(
                                        readOnly: check_shop(
                                            foundUsers[index]["shop"]),
                                        decoration: InputDecoration(
                                          icon: Icon(
                                            Icons.local_post_office_outlined,
                                            color: Colors.green,
                                          ),
                                          labelText: 'Post code',
                                        ),
                                        controller: _controllerpostcode
                                          ..text =
                                              foundUsers[index]["Post_code"],
                                      ),
                                      TextField(
                                        readOnly: check_shop(
                                            foundUsers[index]["shop"]),
                                        decoration: InputDecoration(
                                          icon: Icon(
                                            Icons.edit_road_rounded,
                                            color: Colors.green,
                                          ),
                                          labelText: 'Stresst shop',
                                        ),
                                        controller: _controllerstresst
                                          ..text = foundUsers[index]["stresst"],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      ElevatedButton(
                                        child: Text("Thay ?????i",
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 20)),
                                        onPressed: () async {
                                          print(check_shop(
                                              foundUsers[index]["shop"]));
                                          if (check_shop(
                                                  foundUsers[index]["shop"]) ==
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
                                                    foundUsers[index]
                                                        ["customer_id"],
                                                    foundUsers[index]
                                                        ["id_chop"]);
                                          } else {
                                            await ActionJS.EditCustome_Custome(
                                                _controllertelephone.text,
                                                _controlleruser.text,
                                                foundUsers[index]
                                                    ["customer_id"]);
                                          }
                                          if (AnimeAppState
                                                  .checkdone_send_Custome__shop_edit ==
                                              true) {
                                            Fluttertoast.showToast(
                                                msg:
                                                    "S???a th??ng tin th??nh c??ng ",
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
                                            ? "Th??ng b??o h??? th???ng"
                                            : "System Notifications"),
                                        content: Text(check_shop(
                                                foundUsers[index]["shop"])
                                            ? (Config_G.check_lang
                                                ? 'B???n mu???n x??a kh??ch hang ${foundUsers[index]["name"]}?'
                                                : 'You want to delete Customer ${foundUsers[index]["name"]}?')
                                            : (Config_G.check_lang
                                                ? 'B???n mu???n x??a shop ${foundUsers[index]["shop"]}?'
                                                : 'You want to delete the shop ${foundUsers[index]["shop"]}?')),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: Text(Config_G.check_lang
                                                ? "????ng ??"
                                                : "YES"),
                                            onPressed: () async {
                                              check_shop(
                                                      foundUsers[index]["shop"])
                                                  ? await await ActionJS
                                                      .Deletes_Custome(
                                                          foundUsers[index]
                                                              ["customer_id"])
                                                  : await ActionJS.Deletes(
                                                      foundUsers[index]
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
                                                ? "H???y b???"
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
            }));
  }
}
