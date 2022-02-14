import 'package:vl_ui/Button/SignUpBtnButtom.dart';
import 'package:vl_ui/Button/SignupBtn.dart';
import 'package:vl_ui/Globle/Config_G.dart';
import 'package:vl_ui/Widget/Homepage.dart';
import 'package:vl_ui/Widget/W_signupCustome.dart';
import 'package:vl_ui/Widget/W_signupShop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'W_EditCustome.dart';

class W_Signupmanagee extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Signupmanagee();
  }
}

class Signupmanagee extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assest/background/bkr.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Container(
              child: Column(
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        duration: Duration(
                                            milliseconds:
                                                Config_G.timeDruation),
                                        reverseDuration: Duration(
                                            milliseconds:
                                                Config_G.timeDruation),
                                        child: W_Home()));
                              },
                              icon: Icon(Icons.arrow_back_ios_outlined),
                              color: Colors.white,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    height: 3,
                                    width: 20,
                                    margin:
                                        EdgeInsets.only(left: 20, right: 20),
                                  ),
                                  Text(
                                    Config_G.check_lang
                                        ? "LOẠI HÌNH ĐĂNG KÝ"
                                        : "TYPE OF REGISTRATION",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    height: 3,
                                    width: 20,
                                    margin:
                                        EdgeInsets.only(left: 20, right: 20),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 14),
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 100),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 10),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              duration:
                                  Duration(milliseconds: Config_G.timeDruation),
                              reverseDuration:
                                  Duration(milliseconds: Config_G.timeDruation),
                              child: W_SignUpCustom()));
                    },
                    child: SignupBtn(
                      Content: Config_G.check_lang
                          ? "ĐĂNG KÝ KHÁCH HÀNG "
                          : "REGISTER CUSTOMERS",
                      Subcontent: Config_G.check_lang
                          ? "Dành cho khách hàng đăng ký mở tài khoản"
                          : "For customers who register to open an account",
                      wights: MediaQuery.of(context).size.width / 1.2,
                      heights: 50,
                      colors: Colors.green.withOpacity(0.0),
                      path: "assest/background/userbtn.svg",
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              duration:
                                  Duration(milliseconds: Config_G.timeDruation),
                              reverseDuration:
                                  Duration(milliseconds: Config_G.timeDruation),
                              child: W_SignUpshop()));
                    },
                    child: SignupBtn(
                        Content: Config_G.check_lang
                            ? "THÊM CỬA HÀNG       "
                            : "ADD SHOP              ",
                        Subcontent: Config_G.check_lang
                            ? "Dành cho khách hàng đã có cửa hàng"
                            : "For customers who already have a store",
                        wights: MediaQuery.of(context).size.width / 1.2,
                        heights: 50,
                        colors: Colors.green.withOpacity(0.0),
                        path: "assest/background/shopbtn.svg"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              duration:
                                  Duration(milliseconds: Config_G.timeDruation),
                              reverseDuration:
                                  Duration(milliseconds: Config_G.timeDruation),
                              child: AnimeApp()));
                    },
                    child: SignupBtnIcon(
                        Content: Config_G.check_lang
                            ? "Chỉnh Sửa Thông Tin"
                            : "Edit Information         ",
                        Subcontent: Config_G.check_lang
                            ? "Dành cho khách hàng đã có tài khoản"
                            : "For customers who already have an account",
                        wights: MediaQuery.of(context).size.width / 1.2,
                        heights: 50,
                        colors: Colors.green.withOpacity(0.0),
                        path: "assest/background/info.svg"),
                  )
                ],
              ),
            )));
  }
}
