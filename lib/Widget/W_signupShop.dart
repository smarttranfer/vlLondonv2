import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:vl_ui/Globle/Config_G.dart';
import 'package:vl_ui/Widget/W_Login.dart';
import 'package:vl_ui/model/CheckSameCustome.dart';
import 'package:vl_ui/model/Information_Cutome.dart';
import 'package:vl_ui/model/Information_Shop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:page_transition/page_transition.dart';

import 'Filter.dart';

class W_SignUpshop extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return W_SignUp();
  }
}

class W_SignUp extends State {
  final TextEditingController _NaneShop = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _Note = TextEditingController();
  final TextEditingController _phone = TextEditingController();

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 5),
            child: Container(
                padding: EdgeInsets.only(bottom: 2),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assest/background/bkapps.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: ListView(shrinkWrap: true, children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              35,
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.arrow_back_ios),
                                          splashColor: Colors.green,
                                          color: Colors.white,
                                          iconSize: 40,
                                          onPressed: () {
                                            Navigator.pop(
                                                context,
                                                PageTransition(
                                                    type: PageTransitionType
                                                        .rightToLeft,
                                                    duration: Duration(
                                                        milliseconds: Config_G
                                                            .timeDruation),
                                                    reverseDuration: Duration(
                                                        milliseconds: Config_G
                                                            .timeDruation),
                                                    child: W_login()));
                                          },
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          Config_G.title_SignupShop_vi,
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.green,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  30),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              25,
                                    ),
                                    Card(
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: TextField(
                                            autocorrect: true,
                                            decoration: InputDecoration(
                                              hintText: 'Tên chủ khách hàng *',
                                              prefixIcon: Icon(
                                                Icons.supervised_user_circle_outlined,
                                                color: Colors.green,
                                              ),
                                              hintStyle: TextStyle(
                                                  color: Colors.green),
                                              filled: true,
                                              fillColor: Colors.white70,
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(12.0)),
                                                borderSide: BorderSide(
                                                    color: Colors.green,
                                                    width: 2),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0)),
                                                borderSide: BorderSide(
                                                    color: Colors.green,
                                                    width: 2),
                                              ),
                                            ),
                                            readOnly:
                                                true, //set it true, so that user will not able to edit text
                                            onTap: () async {
                                              return showBarModalBottomSheet(
                                                expand: true,
                                                context: context,
                                                builder: (context) => Filter(),
                                              );
                                            })),
                                    Card(
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child: TextFormField(
                                        controller: _NaneShop,
                                        decoration: InputDecoration(
                                          hintText: 'Tên Shop*',
                                          prefixIcon: Icon(
                                            Icons.shopping_cart_outlined,
                                            color: Colors.green,
                                          ),
                                          hintStyle:
                                              TextStyle(color: Colors.green),
                                          filled: true,
                                          fillColor: Colors.white70,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            borderSide: BorderSide(
                                                color: Colors.green, width: 2),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            borderSide: BorderSide(
                                                color: Colors.green, width: 2),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child: TextFormField(
                                        controller: _address,
                                        decoration: InputDecoration(
                                          hintText: 'D/c Shop*',
                                          prefixIcon: Icon(
                                            Icons.location_on_outlined,
                                            color: Colors.green,
                                          ),
                                          hintStyle:
                                              TextStyle(color: Colors.green),
                                          filled: true,
                                          fillColor: Colors.white70,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            borderSide: BorderSide(
                                                color: Colors.green, width: 2),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            borderSide: BorderSide(
                                                color: Colors.green, width: 2),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child: TextFormField(
                                        controller: _address,
                                        decoration: InputDecoration(
                                          hintText: 'Tên Đường*',
                                          prefixIcon: Icon(
                                            Icons.add_road,
                                            color: Colors.green,
                                          ),
                                          hintStyle:
                                              TextStyle(color: Colors.green),
                                          filled: true,
                                          fillColor: Colors.white70,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            borderSide: BorderSide(
                                                color: Colors.green, width: 2),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            borderSide: BorderSide(
                                                color: Colors.green, width: 2),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child: TextFormField(
                                        controller: _address,
                                        decoration: InputDecoration(
                                          hintText: 'Post Code*',
                                          prefixIcon: Icon(
                                            Icons.code_off_outlined,
                                            color: Colors.green,
                                          ),
                                          hintStyle:
                                              TextStyle(color: Colors.green),
                                          filled: true,
                                          fillColor: Colors.white70,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            borderSide: BorderSide(
                                                color: Colors.green, width: 2),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            borderSide: BorderSide(
                                                color: Colors.green, width: 2),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              40,
                                    ),
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                              flex: 2,
                                              child: IntlPhoneField(
                                                controller: _phone,
                                                decoration: InputDecoration(
                                                    labelText: 'Phone Number',
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Colors
                                                                    .green))),
                                                initialCountryCode: 'GB',
                                                onChanged: (phone) {},
                                              ))
                                        ]),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: HexColor("#237401"),
                                          //background color of button
                                          elevation: 3,
                                          //elevation of button
                                          shape: RoundedRectangleBorder(
                                              //to set border radius to button
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          padding: EdgeInsets.only(
                                              left: 30,
                                              right: 30,
                                              top: 15,
                                              bottom:
                                                  15) //content padding inside button
                                          ),
                                      onPressed: () {
                                        if (_phone.text.isEmpty |
                                            _address.text.isEmpty |
                                            _NaneShop.text.isEmpty |
                                            _Note.text.isEmpty) {
                                          Fluttertoast.showToast(
                                              msg: "Chưa nhập đủ thông tin.",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.CENTER,
                                              timeInSecForIosWeb: 2,
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                        } else {
                                          Fluttertoast.showToast(
                                              msg:
                                                  "Thêm thông tin shop thành công.",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.CENTER,
                                              timeInSecForIosWeb: 2,
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                          Information_Shop s2 =
                                              new Information_Shop();
                                          s2.nameshop = _NaneShop.text;
                                          s2.telephone = _phone.text;
                                          s2.address = _address.text;
                                          Config_G.NameShop.add(s2);
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: const Text('Đồng ý',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 20)),
                                    ),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        textStyle: const TextStyle(
                                            fontSize: 15, color: Colors.green),
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        'Designed & Powered by Vihu.uk',
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              10,
                                    ),
                                  ],
                                ),
                              ])),
                        )
                      ],
                    ),
                  ),
                ))));
  }
}
