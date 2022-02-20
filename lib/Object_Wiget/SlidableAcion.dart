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

  final List<Map<String, dynamic>> foundUsers;
  @override
  Widget build(BuildContext context) {
    final TextEditingController _controllershop = new TextEditingController();
    int indexshop = 0;
    print(foundUsers.length);
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
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              foundUsers[index]
                                                                  ["shop"],
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
                                              ["nickname"],
                                          icon: Icon(
                                            Icons.person_pin_outlined,
                                            color: Colors.green,
                                          ),
                                          labelText: 'Nick Name',
                                        ),
                                        controller: _controllernickname
                                          ..text =
                                              foundUsers[index]["nickname"],
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
                                        decoration: InputDecoration(
                                          hintText: foundUsers[index]
                                              ["phone_shop"],
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
                                        decoration: InputDecoration(
                                          hintText: foundUsers[index]
                                              ["Apartment_number"],
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
                                        decoration: InputDecoration(
                                          hintText: foundUsers[index]
                                              ["Post_code"],
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
                                        decoration: InputDecoration(
                                          hintText: foundUsers[index]
                                              ["stresst"],
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
                                        child: Text("Thay đổi",
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 20)),
                                        onPressed: () async {
                                          await ActionJS.EditCustome_shop(
                                              foundUsers[index]["shop"],
                                              foundUsers[index]
                                                  ["Apartment_number"],
                                              foundUsers[index]["stresst"],
                                              foundUsers[index]["phone_shop"],
                                              foundUsers[index]["Post_code"],
                                              foundUsers[index]["id_chop"]
                                                  );
                                          await ActionJS.EditCustome_Custome( foundUsers[index]["phone_custom"], foundUsers[index]["name"], foundUsers[index]["nickname"],foundUsers[index]["customer_id"]);
                                          if(AnimeAppState.checkdone_send_shop_edit == true && AnimeAppState.checkdone_send_Custome_edit == true){
                                            Fluttertoast.showToast(
                                                msg: "Sửa thông tin thành công ",
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
                                                    duration:
                                                    Duration(milliseconds: 0),
                                                    reverseDuration: Duration(
                                                        milliseconds: Config_G
                                                            .timeDruation),
                                                    child: AnimeApp()));

                                          }else{
                                            Fluttertoast.showToast(
                                                msg: json.decode(Config_G.check_done_edit_shop)["data"] + json.decode(Config_G.check_done_edit_shop)["message"] ,
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
                        IconButton(
                            onPressed: () {
                              ActionJS.Deletes( foundUsers[index]["id_chop"],foundUsers[index]["customer_id"]);
                              Config_G.NameCustom_shop.removeAt(index);
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      duration: Duration(milliseconds: 0),
                                      reverseDuration: Duration(
                                          milliseconds: Config_G.timeDruation),
                                      child: AnimeApp()));
                            },
                            icon: Icon(Icons.delete)),
                      ],
                    ),
                  ));
            }));
  }
}
