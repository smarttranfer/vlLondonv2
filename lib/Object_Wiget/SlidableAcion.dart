import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:vl_ui/Globle/Config_G.dart';
import 'package:vl_ui/Widget/W_EditCustome.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';

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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            padding: const EdgeInsets.all(15),
            itemCount: Config_G.NameCustom_shop.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  elevation: 50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  shadowColor: Colors.black54,
                  child: ListTile(
                    title: Text("${Config_G.NameCustom_shop[index].namecustome}-${Config_G.NameCustom_shop[index].Nickname}"),
                    subtitle: Text("${Config_G.NameCustom_shop[index].nameshop}"),
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
                                      TextField(
                                        decoration: InputDecoration(
                                          hintText:
                                              "${Config_G.NameCustom_shop[index].namecustome}",
                                          icon: Icon(Icons.person_pin_outlined),
                                          labelText: 'Name Custome',
                                        ),
                                        controller: _controlleruser
                                          ..text =
                                              ("${Config_G.NameCustom_shop[index].namecustome}"),
                                      ),
                                      TextField(
                                        decoration: InputDecoration(
                                          hintText:
                                          "${Config_G.NameCustom_shop[index].namecustome}",
                                          icon: Icon(Icons.person_pin_outlined),
                                          labelText: 'Nick Name',
                                        ),
                                        controller: _controllernickname
                                          ..text =
                                          ("${Config_G.NameCustom_shop[index].Nickname}"),
                                      ),
                                      TextField(
                                        decoration: InputDecoration(
                                          hintText:
                                              "${Config_G.NameCustom_shop[index].telephone}",
                                          icon: Icon(Icons.phone),
                                          labelText: 'Telephone Custome',
                                        ),
                                        controller: _controllertelephone
                                          ..text =
                                              "${Config_G.NameCustom_shop[index].telephone}",
                                      ),
                                      TextField(
                                        decoration: InputDecoration(
                                          hintText:
                                              "${Config_G.NameCustom_shop[index].nameshop}",
                                          icon: Icon(
                                              Icons.shopping_cart_outlined),
                                          labelText: 'Name Shop',
                                        ),
                                        controller: _controllershop
                                          ..text =
                                              "${Config_G.NameCustom_shop[index].nameshop}",
                                      ),
                                      TextField(
                                        decoration: InputDecoration(
                                          hintText:
                                              "${Config_G.NameCustom_shop[index].telephone}",
                                          icon: Icon(Icons.phone),
                                          labelText: 'Telephone Shop',
                                        ),
                                        controller: _controllertelephone
                                          ..text =
                                              "${Config_G.NameCustom_shop[index].telephone}",
                                      ),
                                      TextField(
                                        decoration: InputDecoration(
                                          hintText:
                                          "${Config_G.NameCustom_shop[index].numberlocal}",
                                          icon: Icon(
                                              Icons.add_location_alt_outlined),
                                          labelText: 'Apartment number',
                                        ),
                                        controller: _controllernumber
                                          ..text =
                                              "${Config_G.NameCustom_shop[index].numberlocal}",
                                      ),
                                      TextField(
                                        decoration: InputDecoration(
                                          hintText:
                                          "${Config_G.NameCustom_shop[index].Postcodet}",
                                          icon: Icon(
                                              Icons.add_location_alt_outlined),
                                          labelText: 'Post code',
                                        ),
                                        controller: _controllerpostcode
                                          ..text =
                                              "${Config_G.NameCustom_shop[index].Postcodet}",
                                      ),
                                      TextField(
                                        decoration: InputDecoration(
                                          hintText:
                                              " ${Config_G.NameCustom_shop[index].stresst}",
                                          icon: Icon(
                                              Icons.add_location_alt_outlined),
                                          labelText: 'Stresst shop',
                                        ),
                                        controller: _controllerstresst
                                          ..text =
                                              "${Config_G.NameCustom_shop[index].stresst}",
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
                                        onPressed: () {
                                          Config_G.NameCustom_shop[index]
                                                  .namecustome =
                                              _controlleruser.text.toString();
                                          Config_G.NameCustom_shop[index]
                                              .Nickname =
                                              _controllernickname.text.toString();
                                          Config_G.NameCustom_shop[index].nameshop =
                                              _controllershop.text.toString();
                                          Config_G.NameCustom_shop[index].telephone =
                                              _controllertelephone.text
                                                  .toString();
                                          Config_G.NameCustom_shop[index].numberlocal =
                                              _controllernumber.text
                                                  .toString();
                                          Config_G.NameCustom_shop[index].Postcodet =
                                              _controllerpostcode.text
                                                  .toString();
                                          Config_G.NameCustom_shop[index].stresst =
                                              _controllerstresst.text
                                                  .toString();
                                          Fluttertoast.showToast(
                                              msg:
                                                  "Hủy bỏ giao dịch thành công ",
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
