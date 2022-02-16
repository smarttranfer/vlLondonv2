import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vl_ui/Globle/Config_G.dart';

import 'W_DealManager.dart';

class OrderTitle extends StatelessWidget {
  const OrderTitle({
    Key? key,
    required this.date,
    required this.index,
  }) : super(key: key);

  final String date;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          Config_G.check_lang ? "Hóa đơn #${index}" : "Bill #${index}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        Text(
          '${date}',
          style: TextStyle(
            color: Color(0xffb6b2b2),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: PopupMenuButton(
              shape: RoundedRectangleBorder(
                  side: BorderSide(width: 2, color: Colors.green),
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              child: Padding(
                  padding: EdgeInsets.symmetric(),
                  child: Icon(Icons.arrow_drop_down_circle_outlined)),
              itemBuilder: (context) => [
                    PopupMenuItem(
                        child: Row(
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
                                      // controller: _controlleruser
                                      //   ..text =
                                      //   ("${Config_G.NameCustom_shop[index].namecustome}"),
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                        hintText:
                                            "${Config_G.NameCustom_shop[index].namecustome}",
                                        icon: Icon(Icons.person_pin_outlined),
                                        labelText: 'Nick Name',
                                      ),
                                      // controller: _controllernickname
                                      //   ..text =
                                      //   ("${Config_G.NameCustom_shop[index].Nickname}"),
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                        hintText:
                                            "${Config_G.NameCustom_shop[index].telephone}",
                                        icon: Icon(Icons.phone),
                                        labelText: 'Telephone Custome',
                                      ),
                                      // controller: _controllertelephone
                                      //   ..text =
                                      //       "${Config_G.NameCustom_shop[index].telephone}",
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                        hintText:
                                            "${Config_G.NameCustom_shop[index].nameshop}",
                                        icon:
                                            Icon(Icons.shopping_cart_outlined),
                                        labelText: 'Name Shop',
                                      ),
                                      // controller: _controllershop
                                      //   ..text =
                                      //       "${Config_G.NameCustom_shop[index].nameshop}",
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                        hintText:
                                            "${Config_G.NameCustom_shop[index].telephone}",
                                        icon: Icon(Icons.phone),
                                        labelText: 'Telephone Shop',
                                      ),
                                      // controller: _controllertelephone
                                      //   ..text =
                                      //       "${Config_G.NameCustom_shop[index].telephone}",
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                        hintText:
                                            "${Config_G.NameCustom_shop[index].numberlocal}",
                                        icon: Icon(
                                            Icons.add_location_alt_outlined),
                                        labelText: 'Apartment number',
                                      ),
                                      // controller: _controllernumber
                                      //   ..text =
                                      //       "${Config_G.NameCustom_shop[index].numberlocal}",
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                        hintText:
                                            "${Config_G.NameCustom_shop[index].Postcodet}",
                                        icon: Icon(
                                            Icons.add_location_alt_outlined),
                                        labelText: 'Post code',
                                      ),
                                      // controller: _controllerpostcode
                                      //   ..text =
                                      //       "${Config_G.NameCustom_shop[index].Postcodet}",
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                        hintText:
                                            " ${Config_G.NameCustom_shop[index].stresst}",
                                        icon: Icon(
                                            Icons.add_location_alt_outlined),
                                        labelText: 'Stresst shop',
                                      ),
                                      // controller: _controllerstresst
                                      //   ..text =
                                      //       "${Config_G.NameCustom_shop[index].stresst}",
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
                                        // Config_G.NameCustom_shop[index]
                                        //     .namecustome =
                                        //     _controlleruser.text.toString();
                                        // Config_G.NameCustom_shop[index]
                                        //     .Nickname =
                                        //     _controllernickname.text.toString();
                                        // Config_G.NameCustom_shop[index].nameshop =
                                        //     _controllershop.text.toString();
                                        // Config_G.NameCustom_shop[index].telephone =
                                        //     _controllertelephone.text
                                        //         .toString();
                                        // Config_G.NameCustom_shop[index].numberlocal =
                                        //     _controllernumber.text
                                        //         .toString();
                                        // Config_G.NameCustom_shop[index].Postcodet =
                                        //     _controllerpostcode.text
                                        //         .toString();
                                        // Config_G.NameCustom_shop[index].stresst =
                                        //     _controllerstresst.text
                                        //         .toString();
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
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        DealManagers()));
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
                          child: Text(
                            Config_G.check_lang ? "Sửa" : 'Edit',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    )),
                    PopupMenuItem(
                        child: Row(
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            Config_G.modelBill.removeAt(index);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        DealManagers()));
                          },
                          child: Text(
                            Config_G.check_lang ? "Xóa" : 'Delete',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ))
                  ]),
        )
      ],
    );
  }
}
