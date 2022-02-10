import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:vl_ui/Globle/Config_G.dart';
import 'package:vl_ui/Widget/W_EditCustome.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';

final TextEditingController _controllershop = TextEditingController();
final TextEditingController _controlleruser = TextEditingController();
final TextEditingController _controllertelephone = TextEditingController();
final TextEditingController _controlleraddress = TextEditingController();

class ListViewsCustome extends StatelessWidget {
  const ListViewsCustome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            padding: const EdgeInsets.all(15),
            itemCount: Config_G.NameCustom.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  elevation: 50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  shadowColor: Colors.black54,
                  child: ListTile(
                    title: Text("${Config_G.NameCustom[index].namecustome}"),
                    subtitle: Text("${Config_G.NameShop[index].nameshop}"),
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
                                              "${Config_G.NameCustom[index].namecustome}",
                                          icon: Icon(Icons.person_pin_outlined),
                                          labelText: 'Name Custome',
                                        ),
                                        controller: _controlleruser
                                          ..text =
                                              ("${Config_G.NameCustom[index].namecustome}"),
                                      ),
                                      TextField(
                                        decoration: InputDecoration(
                                          hintText:
                                              "${Config_G.NameShop[index].telephone}",
                                          icon: Icon(Icons.phone),
                                          labelText: 'Telephone Custome',
                                        ),
                                        controller: _controllertelephone
                                          ..text =
                                              "${Config_G.NameCustom[index].telephone}",
                                      ),
                                      TextField(
                                        decoration: InputDecoration(
                                          hintText:
                                              "${Config_G.NameShop[index].nameshop}",
                                          icon: Icon(
                                              Icons.shopping_cart_outlined),
                                          labelText: 'Name Shop',
                                        ),
                                        controller: _controllershop
                                          ..text =
                                              "${Config_G.NameShop[index].nameshop}",
                                      ),
                                      TextField(
                                        decoration: InputDecoration(
                                          hintText:
                                              "${Config_G.NameShop[index].telephone}",
                                          icon: Icon(Icons.phone),
                                          labelText: 'Telephone Shop',
                                        ),
                                        controller: _controllertelephone
                                          ..text =
                                              "${Config_G.NameShop[index].telephone}",
                                      ),
                                      TextField(
                                        decoration: InputDecoration(
                                          hintText:
                                              "${Config_G.NameShop[index].address}",
                                          icon: Icon(
                                              Icons.add_location_alt_outlined),
                                          labelText: 'Adress shop',
                                        ),
                                        controller: _controlleraddress
                                          ..text =
                                              "${Config_G.NameShop[index].address}",
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
                                          Config_G.NameCustom[index]
                                                  .namecustome =
                                              _controlleruser.text.toString();
                                          Config_G.NameShop[index].nameshop =
                                              _controllershop.text.toString();
                                          Config_G.NameShop[index].telephone =
                                              _controllertelephone.text
                                                  .toString();
                                          Config_G.NameShop[index].address =
                                              _controlleraddress.text
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
                              Config_G.NameCustom.removeAt(index);
                              Config_G.NameShop.removeAt(index);
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
