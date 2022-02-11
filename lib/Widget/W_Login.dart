import 'dart:convert';
import 'dart:ui';
import 'package:awesome_dialog/awesome_dialog.dart';
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
  // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controlleruser = TextEditingController();
  bool check = false;
  _callNumber() async {
    const number = '0335925341';
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }

  Future<bool> _makeGetRequest(String password) async {
    String url = 'http://192.168.1.10:8055/api/login';
    Request req = Request('POST', Uri.parse(url))
      ..body = json.encode({'username': 'admin1', 'password': '${password}'})
      ..headers.addAll({
        "Content-type": "application/json",
      });
    var res = await req.send();
    if (res.statusCode.toString() == "200") {
      setState(() {
        check = true;
      });
      return true;
    }
    setState(() {
      check = false;
    });
    return false;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      Config_G.Usernames = _controlleruser.text;
      // });
      // _firebaseMessaging.configure(
      //   onMessage: (Map<String, dynamic> message) async {
      //     print("onMessage: $message");
      //
      //   },
      //   // onBackgroundMessage: myBackgroundMessageHandler,
      //   onLaunch: (Map<String, dynamic> message) async {
      //     print("onLaunch: $message");
      //
      //   },
      //   onResume: (Map<String, dynamic> message) async {
      //     print("onResume: $message");
      //
      //   },
      // );
      // _firebaseMessaging.requestNotificationPermissions(
      //     const IosNotificationSettings(
      //         sound: true, badge: true, alert: true, provisional: true));
      // _firebaseMessaging.onIosSettingsRegistered
      //     .listen((IosNotificationSettings settings) {
      //   print("Settings registered: $settings");
      // });
      // _firebaseMessaging.getToken().then((String token) {
      //   assert(token != null);
      //   print("Push Messaging token: $token");
      // });
      // _firebaseMessaging.subscribeToTopic("matchscore");
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
                            child: Text('LOG IN',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                    fontSize: 30)),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 50),
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
                                  hintText: "Username",
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
                              hintText: 'Password',
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
                              errorMessage:
                                  '',
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
                        onPressed: () {
                            setState(() {
                              Config_G.Usernames = _controlleruser.text;
                            });
                          _makeGetRequest(_controller.value.text);
                          if (_controller.value.text == "admin") {
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
                                  "Mật khẩu không đúng, check lại tài khoàn với VIHU hoăc call cho Support.",
                                  style: TextStyle(fontWeight: FontWeight.w900),
                                )),
                              ),
                              title: 'System Warning',
                              desc: 'This is also Ignored',
                              btnOkOnPress: () {},
                            )..show();
                          }
                        },
                        child: Text('ĐĂNG NHẬP',
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
                                      Text('Hỗ trợ',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.green,
                                              fontSize: 15))
                                    ],
                                  ),
                                )
                              ])),
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
