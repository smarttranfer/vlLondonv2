import 'dart:convert';
import 'package:vl_ui/DartJs/FuntionsAction.dart';
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

class W_SignUpCustom extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return W_SignUp();
  }
}

class W_SignUp extends State<W_SignUpCustom> {
  static bool check = false;
  bool checkcolor = true;
  bool checklabel = true;
  bool checkcolorNickname = true;
  bool checklabelNickname = true;
  bool checkdone = false;
  bool post_numberloacl_label = true;
  bool post_numberloacl_color = true;

  final TextEditingController _Name = TextEditingController();
  final TextEditingController _shop = TextEditingController();
  final TextEditingController _numberlocal = TextEditingController();
  final TextEditingController _stresst = TextEditingController();
  final TextEditingController _postcode = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _nickname = TextEditingController();
  List<CheckSameCustome> modelCustome = [];
  @override
  void initState() {
    for (Information_Cutome i in Config_G.NameCustom_shop) {
      CheckSameCustome modelchek = new CheckSameCustome();
      modelchek.information_name = i.namecustome.toString();
      modelchek.information_nickname = i.Nickname.toString();
      modelCustome.add(modelchek);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assest/background/bkapps.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
              physics: ScrollPhysics(),
              padding: EdgeInsets.only(bottom: 5),
              child: Container(
                padding: EdgeInsets.only(bottom: 2),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 35,
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
                                                  milliseconds:
                                                      Config_G.timeDruation),
                                              reverseDuration: Duration(
                                                  milliseconds:
                                                      Config_G.timeDruation),
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
                                    Config_G.check_lang
                                        ? "Đăng ký tài khoản"
                                        : "Register for an account",
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                30),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 45,
                              ),
                              Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                            flex: 2,
                                            child: Center(
                                                child: IntlPhoneField(
                                              controller: _phone,
                                              decoration: InputDecoration(
                                                labelText: Config_G.check_lang
                                                    ? 'Số Điện Thoại *'
                                                    : 'Phone Number *',
                                                prefixIcon: Icon(
                                                  Icons.phone_iphone_outlined,
                                                  color: Colors.green,
                                                ),
                                                hintStyle: TextStyle(
                                                    color: Colors.green),
                                                filled: true,
                                                fillColor: Colors.white70,
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              12.0)),
                                                  borderSide: BorderSide(
                                                      color: Colors.green,
                                                      width: 2),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              10.0)),
                                                  borderSide: BorderSide(
                                                      color: Colors.green,
                                                      width: 2),
                                                ),
                                              ),
                                              initialCountryCode: 'GB',
                                              onChanged: (phone) {
                                                print(phone.completeNumber);
                                              },
                                            )))
                                      ])),
                              Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          onChanged: (newText) {
                                            for (CheckSameCustome checkname
                                                in modelCustome) {
                                              if (checkname.information_name ==
                                                  newText) {
                                                setState(() {
                                                  checkcolor = false;
                                                  checklabel = false;
                                                  checkdone = false;
                                                });
                                              } else {
                                                setState(() {
                                                  checkdone = true;
                                                });
                                              }
                                            }
                                          },
                                          controller: _Name,
                                          decoration: InputDecoration(
                                            labelText: Config_G.check_lang
                                                ? (checklabel
                                                    ? "Họ và tên  *"
                                                    : "${_Name.text} đã tồn tại trong dữ liệu")
                                                : (checklabel
                                                    ? "First and last name  *"
                                                    : "${_Name.text} already exists in the data"),
                                            labelStyle: TextStyle(
                                                color: checkcolor
                                                    ? Colors.green
                                                    : Colors.red),
                                            prefixIcon: Icon(
                                              Icons
                                                  .supervised_user_circle_outlined,
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
                                                  color: checkcolor
                                                      ? Colors.green
                                                      : Colors.red),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                              borderSide: BorderSide(
                                                  color: Colors.green,
                                                  width: 2),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                              Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          onChanged: (newText) {
                                            if (modelCustome.isEmpty) {
                                              setState(() {
                                                checkdone = true;
                                              });
                                            } else {
                                              for (CheckSameCustome checkname
                                                  in modelCustome) {
                                                if (checkname
                                                            .information_name ==
                                                        _Name.text &&
                                                    checkname
                                                            .information_nickname ==
                                                        newText) {
                                                  setState(() {
                                                    checklabelNickname = false;
                                                    checkcolorNickname = false;
                                                    checkcolor = false;
                                                    checklabel = false;
                                                    checkdone = false;
                                                  });
                                                } else {
                                                  setState(() {
                                                    checklabelNickname = true;
                                                    checkcolorNickname = true;
                                                    checkcolor = true;
                                                    checklabel = true;
                                                    checkdone = true;
                                                  });
                                                }
                                              }
                                            }
                                          },
                                          controller: _nickname,
                                          decoration: InputDecoration(
                                            labelText: Config_G.check_lang
                                                ? (checklabelNickname
                                                    ? "Bí Danh  *"
                                                    : " ${_Name.text} ${_nickname.text} đã tồn tại trong dữ liệu")
                                                : (checklabelNickname
                                                    ? "NickName  *"
                                                    : " ${_Name.text} ${_nickname.text} already exists in the data"),
                                            labelStyle: TextStyle(
                                                color: checkcolor
                                                    ? Colors.green
                                                    : Colors.red),
                                            prefixIcon: Icon(
                                              Icons.workspaces_outline,
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
                                                  color: checkcolor
                                                      ? Colors.green
                                                      : Colors.red),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                              borderSide: BorderSide(
                                                  color: Colors.green,
                                                  width: 2),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                              Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          controller: _shop,
                                          decoration: InputDecoration(
                                            labelText: Config_G.check_lang
                                                ? 'Tên Shop *'
                                                : 'Name Shop.',
                                            labelStyle:
                                                TextStyle(color: Colors.green),
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
                                        ),
                                      )
                                    ],
                                  )),
                              Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          controller: _numberlocal,
                                          decoration: InputDecoration(
                                            labelText: Config_G.check_lang
                                                ? (post_numberloacl_color
                                                    ? 'Số tòa nhà *'
                                                    : '${_numberlocal.text}${_postcode.text} đã tồn tại.')
                                                : (post_numberloacl_color
                                                    ? 'Building number *'
                                                    : '${_numberlocal.text}${_postcode.text} already exist.'),
                                            labelStyle: TextStyle(
                                                color: post_numberloacl_color
                                                    ? Colors.green
                                                    : Colors.red),
                                            prefixIcon: Icon(
                                              Icons.home_outlined,
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
                                        ),
                                      )
                                    ],
                                  )),
                              Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          controller: _stresst,
                                          decoration: InputDecoration(
                                            labelText: Config_G.check_lang
                                                ? 'Tên Đường *'
                                                : "Street *",
                                            labelStyle:
                                                TextStyle(color: Colors.green),
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
                                        ),
                                      )
                                    ],
                                  )),
                              Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          controller: _postcode,
                                          decoration: InputDecoration(
                                            labelText: Config_G.check_lang
                                                ? (post_numberloacl_label
                                                    ? 'Post Code *'
                                                    : "${_numberlocal.text}${_postcode.text} đã tồn tại.*")
                                                : (post_numberloacl_label
                                                    ? 'Post Code *'
                                                    : "${_numberlocal.text}${_postcode.text} đalready exist."),
                                            labelStyle: TextStyle(
                                                color: post_numberloacl_color
                                                    ? Colors.green
                                                    : Colors.red),
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
                                        ),
                                      )
                                    ],
                                  )),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 40,
                              ),
                              Center(
                                  child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: HexColor(
                                        "#237401"), //background color of button
                                    elevation: 3, //elevation of button
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
                                onPressed: () async {
                                  if (_Name.text.isEmpty |
                                      _nickname.text.isEmpty |
                                      _shop.text.isEmpty |
                                      _postcode.text.isEmpty |
                                      _numberlocal.text.isEmpty |
                                      _stresst.text.isEmpty |
                                      _phone.text.isEmpty) {
                                    Fluttertoast.showToast(
                                        msg: Config_G.check_lang
                                            ? "Bạn cần điền đầy đủ thông tin"
                                            : "You need to fill in all the information",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 2,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  } else {
                                    if (checkdone == true) {
                                      await ActionJS.SignCustome(
                                          _Name.text,
                                          _nickname.text,
                                          _phone.text,
                                          _shop.text,
                                          _numberlocal.text,
                                          _stresst.text,
                                          _postcode.text);
                                      if (check == true) {
                                        Information_Shop  s0 = new Information_Shop();
                                        s0.id = json.decode(Config_G.id_Custome_shop)["data"]["shop_id"];
                                        s0.post_code = _postcode.text;
                                        s0.building_number = _numberlocal.text;
                                        s0.nameshop = _shop.text;
                                        s0.address = _stresst.text;
                                        Information_Cutome s1 =
                                            new Information_Cutome();
                                        s1.id = json.decode(Config_G.id_Custome_shop)["data"]["customer_id"];
                                        s1.namecustome = _Name.text;
                                        s1.telephone = _phone.text;
                                        s1.Nickname = _nickname.text;
                                        s1.nameshop.add(s0);
                                        Config_G.NameCustom_shop.add(s1);
                                        CheckSameCustome modelchek =
                                            new CheckSameCustome();
                                        modelchek.information_name = _Name.text;
                                        modelchek.information_nickname =
                                            _nickname.text;
                                        Config_G.modelCustome.add(modelchek);
                                        Fluttertoast.showToast(
                                            msg: Config_G.check_lang
                                                ? "Tạo Thông tin thành công"
                                                : "Create Success Info",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 2,
                                            backgroundColor: Colors.green,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                        Navigator.pop(context);
                                      } else {
                                        Fluttertoast.showToast(
                                            msg: Config_G.check_lang
                                                ? "${json.decode(Config_G.id_Custome_shop)["data"]} - ${json.decode(Config_G.id_Custome_shop)["message"]}"
                                                : "${json.decode(Config_G.id_Custome_shop)["data"]} - ${json.decode(Config_G.id_Custome_shop)["message"]}",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIosWeb: 10,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      }
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: Config_G.check_lang
                                              ? "${json.decode(Config_G.id_Custome_shop)["data"]} - ${json.decode(Config_G.id_Custome_shop)["message"]}"
                                              : "${json.decode(Config_G.id_Custome_shop)["data"]} - ${json.decode(Config_G.id_Custome_shop)["message"]}",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 10,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    }
                                  }
                                },
                                child: Text(
                                    Config_G.check_lang ? 'Đồng ý ' : 'Confirm',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20)),
                              )),
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle: const TextStyle(
                                      fontSize: 15, color: Colors.green),
                                ),
                                onPressed: () {
                                  // if()
                                },
                                child: Text(
                                  Config_G.check_lang
                                      ? 'Thiết kế & Vận hành bởi Vihu.uk'
                                      : 'Designed & Powered by Vihu.uk',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ))),
    );
  }
}
