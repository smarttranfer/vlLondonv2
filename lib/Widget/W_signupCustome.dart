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
  bool checkcolor = true;
  bool checklabel = true;
  bool checkcolorNickname = true;
  bool checklabelNickname = true;
  bool checkdone = false;
  final TextEditingController _Name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _nickname = TextEditingController();
  List<CheckSameCustome> modelCustome = [];
  @override
  void initState() {
    for (Information_Cutome i in Config_G.NameCustom) {
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
              padding: EdgeInsets.only(bottom: 5),
              child: Container(
                padding: EdgeInsets.only(bottom: 2),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 14,
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
                                            type:
                                                PageTransitionType.rightToLeft,
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
                            Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  Config_G.title_SignupCustom_vi,
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
                              height: MediaQuery.of(context).size.height / 25,
                            ),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: IntlPhoneField(
                                        controller: _phone,
                                        decoration: InputDecoration(
                                          labelText: 'Phone Number *',
                                        ),
                                        initialCountryCode: 'GB',
                                        onChanged: (phone) {
                                          print(phone.completeNumber);
                                        },
                                      ))
                                ]),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    onChanged: (newText) {
                                      for(CheckSameCustome checkname in modelCustome){
                                        if(checkname.information_name==newText){
                                          setState(() {
                                            checkcolor = false;
                                            checklabel = false;
                                            checkdone = false;
                                          });
                                        }else{
                                          setState(() {
                                            checkdone = true;
                                          });
                                        }
                                      }
                                    },
                                    controller: _Name,
                                    decoration: InputDecoration(
                                        labelText: checklabel
                                            ? "Họ và tên  *"
                                            : "${_Name.text} đã tồn tại trong dữ liệu",
                                        labelStyle: TextStyle(
                                            color: checkcolor
                                                ? Colors.green
                                                : Colors.red),
                                        fillColor: Colors.green,
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: checkcolor
                                                    ? Colors.green
                                                    : Colors.red))),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    onChanged: (newText) {
                                      if(modelCustome.isEmpty){
                                        setState(() {
                                          checkdone = true;
                                        });
                                      }else{
                                        for(CheckSameCustome checkname in modelCustome){
                                          if(checkname.information_name==_Name.text && checkname.information_nickname==newText){
                                            setState(() {
                                              checklabelNickname = false;
                                              checkcolorNickname = false;
                                              checkcolor = false;
                                              checklabel = false;
                                              checkdone = false;
                                            });
                                          }else{
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
                                        labelText: checklabelNickname
                                            ? "NickName  *"
                                            : " ${_Name.text} ${_nickname.text} đã tồn tại trong dữ liệu",
                                        labelStyle: TextStyle(
                                            color: checkcolorNickname
                                                ? Colors.green
                                                : Colors.red),
                                        fillColor: Colors.green,
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: checkcolorNickname
                                                    ? Colors.green
                                                    : Colors.red))),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: _email,
                                    decoration: InputDecoration(
                                        labelStyle:
                                            TextStyle(color: Colors.green),
                                        labelText: "Email",
                                        fillColor: Colors.green,
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.green))),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 40,
                            ),
                            Expanded(
                                child: Center(
                                    child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: HexColor(
                                      "#237401"), //background color of button
                                  elevation: 3, //elevation of button
                                  shape: RoundedRectangleBorder(
                                      //to set border radius to button
                                      borderRadius: BorderRadius.circular(15)),
                                  padding: EdgeInsets.only(
                                      left: 30,
                                      right: 30,
                                      top: 15,
                                      bottom:
                                          15) //content padding inside button
                                  ),
                              onPressed: () {
                                if (_Name.text.isEmpty |_nickname.text.isEmpty|
                                    _phone.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "Bạn cần điền đầy đủ thông tin",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 2,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                } else {
                                  if (checkdone == true) {
                                    Fluttertoast.showToast(
                                        msg: "Tạo Thông tin thành công",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 2,
                                        backgroundColor: Colors.green,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                    Information_Cutome s1 =
                                        new Information_Cutome();
                                    s1.namecustome = _Name.text;
                                    s1.telephone = _phone.text;
                                    s1.Nickname = _nickname.text;
                                    Config_G.NameCustom.add(s1);
                                    CheckSameCustome modelchek = new CheckSameCustome();
                                    modelchek.information_name = _Name.text;
                                    modelchek.information_nickname = _nickname.text;
                                    Config_G.modelCustome.add(modelchek);
                                    Navigator.pop(context);
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: "không thể đăng ký được account",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 2,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  }
                                }
                              },
                              child: const Text('Đồng ý ',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20)),
                            ))),
                            Expanded(
                                child: TextButton(
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(
                                    fontSize: 15, color: Colors.green),
                              ),
                              onPressed: () {
                                // if()
                              },
                              child: const Text(
                                'Designed & Powered by Vihu.uk',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            )),
                            Expanded(
                                child: SizedBox(
                              height: MediaQuery.of(context).size.height / 10,
                            )),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ));
  }
}
