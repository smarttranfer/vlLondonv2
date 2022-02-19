import 'dart:convert';
import 'dart:ui';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vl_ui/Globle/Config_G.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart';
import 'package:page_transition/page_transition.dart';
import 'package:passwordfield/passwordfield.dart';
import 'Homepage.dart';
import 'package:http/http.dart' as http;

class W_login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return login();
  }
}

class login extends State {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controlleruser = TextEditingController();
  static bool checks = false;
  static bool check_loadingbar = false;
  _callNumber() async {
    const number = '0335925341';
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }

  Future<bool> _makeGetRequest(String password) async {
    try {
      setState(() {
        check_loadingbar = true;
      });

      String url = 'http://103.161.16.61:27554/auth/login';
      var dio = Dio();
      var response = await dio
          .post(url, data: {'username': 'admin', 'password': '${password}'});
      var data = response;
      if (data.data["status"].toString() == "200") {
        setState(() {
          checks = true;
          Config_G.Token_app = data.data["data"]["token"].toString();
        });
        return true;
      } else {
        setState(() {
          checks = false;
        });
        return false;
      }
    } on Exception catch (e) {
      setState(() {
        checks = false;
      });
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      Config_G.Usernames = _controlleruser.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assest/background/bkapps.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 3,
                      ),
                      Row(
                        children: [
                          Center(
                            child: Text(
                                Config_G.check_lang ? "ĐĂNG NHẬP" : 'LOG IN',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                    fontSize: 30)),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 50),
                          PopupMenuButton(
                              shape: RoundedRectangleBorder(
                                  side:
                                      BorderSide(width: 2, color: Colors.green),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0))),
                              child: Padding(
                                padding: EdgeInsets.symmetric(),
                                child: Image.asset(
                                    "assest/IconBtn/translate.png",
                                    height: 30,
                                    fit: BoxFit.fill),
                              ),
                              itemBuilder: (context) => [
                                    PopupMenuItem(
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                Config_G.check_lang = true;
                                              });
                                            },
                                            child: Row(
                                              children: [
                                                IconButton(
                                                  icon: Image.asset(
                                                      "assest/IconBtn/vietnam.png"),
                                                  onPressed: () {
                                                    setState(() {});
                                                  },
                                                ),
                                                Text(
                                                  "Tiếng Việt",
                                                  style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 20,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )
                                              ],
                                            ))),
                                    PopupMenuItem(
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                Config_G.check_lang = false;
                                              });
                                            },
                                            child: Row(
                                              children: [
                                                IconButton(
                                                  icon: Image.asset(
                                                    "assest/IconBtn/kingdom.png",
                                                  ),
                                                  onPressed: () {},
                                                ),
                                                Text(
                                                  "English",
                                                  style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 20,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )
                                              ],
                                            )))
                                  ]),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 30,
                      ),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _controlleruser,
                                decoration: InputDecoration(
                                  hintText: Config_G.check_lang
                                      ? "Tài Khoản"
                                      : "Username",
                                  hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                            )
                          ]),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 100,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: PasswordField(
                              color: Colors.black54,
                              controller: _controller,
                              inputDecoration: PasswordDecoration(),
                              hintText:
                                  Config_G.check_lang ? "Mật khẩu" : 'Password',
                              border: PasswordBorder(
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.green,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.green,
                                  ),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.red),
                                ),
                              ),
                              errorMessage: '',
                            ),
                          )
                        ],
                      ),
                      Expanded(
                          child: SizedBox(
                        height: 10,
                      )),
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
                                bottom: 15) //content padding inside button
                            ),
                        onPressed: () async {
                          setState(() {
                            Config_G.Usernames = _controlleruser.text;
                          });

                          await _makeGetRequest(_controller.value.text);
                          if (checks == true) {
                            setState(() {
                              check_loadingbar = false;
                            });
                            Navigator.pushReplacement(
                                context,
                                PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    duration: Duration(
                                        milliseconds: Config_G.timeDruation),
                                    reverseDuration: Duration(
                                        milliseconds: Config_G.timeDruation),
                                    child: W_Home()));
                          } else {
                            AwesomeDialog(
                              context: context,
                              animType: AnimType.RIGHSLIDE,
                              dialogType: DialogType.ERROR,
                              body: Center(
                                child: Center(
                                    child: Text(
                                  Config_G.check_lang
                                      ? "Mật khẩu không đúng, check lại tài khoàn với VIHU hoăc call cho Support."
                                      : "The password is incorrect, please check your account with VIHU or call Support.",
                                  style: TextStyle(fontWeight: FontWeight.w900),
                                )),
                              ),
                              title: 'System Warning',
                              desc: 'This is also Ignored',
                              btnOkOnPress: () {},
                            )..show();
                          }
                        },
                        child: Text(Config_G.check_lang ? 'ĐĂNG NHẬP' : "Login",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20)),
                      ))),
                      Expanded(
                          flex: 0,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    _callNumber();
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.phone_in_talk_outlined,
                                        color: Colors.green,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                30,
                                      ),
                                      Text(
                                          Config_G.check_lang
                                              ? 'Hỗ trợ'
                                              : "Help",
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.green,
                                              fontSize: 15))
                                    ],
                                  ),
                                )
                              ])),
                      check_loadingbar
                          ? Center(
                              child: FutureBuilder(
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                  } else if (snapshot.hasError) {
                                    return Text("${snapshot.error}");
                                  }
                                  // By default, show a loading spinner
                                  return CircularProgressIndicator();
                                },
                              ),
                            )
                          : SizedBox(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 6,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
