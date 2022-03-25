import 'dart:convert';

import 'package:vl_ui/Button/DetailBtn.dart';
import 'package:vl_ui/Button/OptionButton.dart';
import 'package:vl_ui/DartJs/FuntionsAction.dart';
import 'package:vl_ui/Globle/Config_G.dart';
import 'package:vl_ui/Object_Wiget/ListBill.dart';
import 'package:vl_ui/Widget/W_Login.dart';
import 'package:vl_ui/Widget/W_Signupmanger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vl_ui/model/Information_Cutome.dart';
import 'TimeLineLog.dart';
import 'W_CreateChanger.dart';
import 'W_DealManager.dart';
import 'W_Payment.dart';
import 'W_static.dart';
import 'package:http/http.dart' as http;



class W_Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Home();
  }
}

class Home extends State<W_Home> {
  static String Statemonet =  '';
  bool checkdataToday = false;
  bool checkdataYesterday = false;
  static bool check_loding_data = true;
  static bool data_Sum = false;
  static double sumMoney = 0.0;
  @override
  void initState() {
    super.initState();
    sumMoney = 0.0;
    Config_G.modelBill.clear();
    asyncMethod();
  }

  void asyncMethod() async {
    Statemonet =  'Please wait …';
    await ActionJS.Get_Transation_Map_Shop_Custome();
    if (data_Sum == true) {
      setState(() {
        check_loding_data = false;
      });
    }else{
      setState(() {
        check_loding_data = false;
        Statemonet = Config_G.check_lang?"Không thể lấy được dữ liệu . kiểm tra lại Network ":"Cant not get data. Please check Network";
      });
    }
  }

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
              child: Column(children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height / 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          PopupMenuButton(
                              shape: RoundedRectangleBorder(
                                  side:
                                      BorderSide(width: 2, color: Colors.green),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0))),
                              child: Padding(
                                padding: EdgeInsets.symmetric(),
                                child: SvgPicture.asset(
                                    "assest/IconBtn/btndraw.svg"),
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
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 14),
                          Text(
                            Config_G.check_lang
                                ? Config_G.Tilte_vis
                                : Config_G.Tilte_eng,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 14),
                          PopupMenuButton(
                              shape: RoundedRectangleBorder(
                                  side:
                                      BorderSide(width: 2, color: Colors.green),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0))),
                              child: Padding(
                                  padding: EdgeInsets.symmetric(),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green.withOpacity(0.5),
                                    ),
                                    child: Center(
                                        child: CircleAvatar(
                                      backgroundColor: Colors.lightGreenAccent
                                          .withOpacity(0.6),
                                      child: Text("AD"),
                                    )),
                                  )),
                              itemBuilder: (context) => [
                                    PopupMenuItem(
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                Config_G.check_lang = false;
                                              });
                                            },
                                            child: InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      PageTransition(
                                                          type:
                                                              PageTransitionType
                                                                  .rightToLeft,
                                                          duration: Duration(
                                                              milliseconds: Config_G
                                                                  .timeDruation),
                                                          reverseDuration: Duration(
                                                              milliseconds: Config_G
                                                                  .timeDruation),
                                                          child:
                                                              PackageDeliveryTrackingPage()));
                                                },
                                                child: Row(
                                                  children: [
                                                    IconButton(
                                                      icon: Image.asset(
                                                        "assest/IconBtn/history.png",
                                                      ),
                                                      onPressed: () {},
                                                    ),
                                                    Text(
                                                      Config_G.check_lang
                                                          ? "Lich sử"
                                                          : "History",
                                                      style: TextStyle(
                                                        color: Colors.green,
                                                        fontSize: 20,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    )
                                                  ],
                                                )))),
                                    PopupMenuItem(
                                      child: InkWell(
                                          onTap: () {
                                            Config_G.NameCustom_shop.clear();
                                            setState(() {
                                              Config_G.ROLE_ADMIN = false;
                                              Config_G.ROLE_MODERATOR = false;
                                              Config_G.ROLE_USER = false;
                                              login.check_loadingbar = false;
                                              check_loding_data = true;
                                            });
                                            Navigator.pushReplacement(
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
                                          child: Row(
                                            children: [
                                              IconButton(
                                                icon: Image.asset(
                                                    "assest/IconBtn/logout.png"),
                                                onPressed: () {
                                                  setState(() {});
                                                },
                                              ),
                                              Text(
                                                Config_G.check_lang
                                                    ? "Thoát"
                                                    : "Log Out",
                                                style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 20,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            ],
                                          )),
                                    )
                                  ]),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height / 100),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        duration: Duration(
                                            milliseconds:
                                                Config_G.timeDruation),
                                        reverseDuration: Duration(
                                            milliseconds:
                                                Config_G.timeDruation),
                                        child: W_CreateChange()));
                              },
                              child: OptionBtn(
                                path: "assest/IconBtn/createTranfer.svg",
                                namebtn: Config_G.check_lang
                                    ? "TẠO GD"
                                    : "CREATE DEAL",
                                wights: MediaQuery.of(context).size.width / 7,
                                heights:
                                    MediaQuery.of(context).size.height / 14,
                                colors: Colors.green.withOpacity(0.5),
                              )),
                          InkWell(
                              onTap: () async {
                                await ActionJS.Get_Voice();
                                Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        duration: Duration(
                                            milliseconds:
                                                Config_G.timeDruation),
                                        reverseDuration: Duration(
                                            milliseconds:
                                                Config_G.timeDruation),
                                        child: W_Payment()));
                              },
                              child: OptionBtn(
                                path: "assest/IconBtn/manager.svg",
                                namebtn: Config_G.check_lang
                                    ? "QUẢN LÝ BILL"
                                    : "MANAGER BILL",
                                wights: MediaQuery.of(context).size.width / 7,
                                heights:
                                    MediaQuery.of(context).size.height / 14,
                                colors: Colors.green.withOpacity(0.5),
                              )),
                          InkWell(
                            splashColor: Colors.black12,
                            child: OptionBtn(
                              path: "assest/IconBtn/Statistical.svg",
                              namebtn: Config_G.check_lang
                                  ? "THỐNG KÊ"
                                  : "STATISTICAL",
                              wights: MediaQuery.of(context).size.width / 7,
                              heights: MediaQuery.of(context).size.height / 14,
                              colors: Colors.green.withOpacity(0.5),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      duration: Duration(
                                          milliseconds: Config_G.timeDruation),
                                      reverseDuration: Duration(
                                          milliseconds: Config_G.timeDruation),
                                      child: StatsPage()));
                            },
                          ),
                          InkWell(
                            splashColor: Colors.black12,
                            child: OptionBtn(
                              path: "assest/IconBtn/SignUp.svg",
                              namebtn: Config_G.check_lang
                                  ? "ĐĂNG KÝ"
                                  : "REGISTRATION",
                              wights: MediaQuery.of(context).size.width / 7,
                              heights: MediaQuery.of(context).size.height / 14,
                              colors: Colors.green.withOpacity(0.5),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      duration: Duration(
                                          milliseconds: Config_G.timeDruation),
                                      reverseDuration: Duration(
                                          milliseconds: Config_G.timeDruation),
                                      child: W_Signupmanagee()));
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 50),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.green),
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        margin: EdgeInsets.only(left: 10, right: 10),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 5,
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 40,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 21,
                                ),
                                Icon(
                                  Icons.info_outline,
                                  color: Colors.green,
                                  size: 20.0,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 40,
                                ),
                                Text(
                                  Config_G.check_lang
                                      ? "THÔNG TIN QUẢN LÝ"
                                      : "MANAGEMENT INFORMATION",
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 40,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.5),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              height: 2,
                              margin: EdgeInsets.only(left: 20, right: 20),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 40,
                            ),
                            SingleChildScrollView(
                                child: Column(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(left: 20),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              Config_G.check_lang
                                                  ? "TỔNG NỢ"
                                                  : "TOTAL LIABILITIES",
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 15,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              300,
                                        ),
                                        Container(
                                            padding: EdgeInsets.all(5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                check_loding_data
                                                    ? Center(
                                                        child: FutureBuilder(
                                                          builder: (context,
                                                              snapshot) {
                                                            if (snapshot
                                                                .hasData) {
                                                              for (Information_Cutome i
                                                                  in Config_G
                                                                      .NameCustom_shop) {
                                                                print(i.id);
                                                              }
                                                            } else if (snapshot
                                                                .hasError) {
                                                              return Text(
                                                                  "${snapshot.error}");
                                                            }
                                                            // By default, show a loading spinner
                                                            return CircularProgressIndicator(
                                                              color:
                                                                  Colors.green,
                                                            );
                                                          },
                                                        ),
                                                      )
                                                    : Text(
                                                        "\€ ${sumMoney.toStringAsFixed(3)}",
                                                        style: TextStyle(
                                                          color: Colors.redAccent,
                                                          fontSize: 25,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .rightToLeft,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    Config_G
                                                                        .timeDruation),
                                                            reverseDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        Config_G
                                                                            .timeDruation),
                                                            child:
                                                                DealManagers()));
                                                  },
                                                  child: DetailBtn(
                                                    colors: HexColor("#388118")
                                                        .withOpacity(0.2),
                                                    heights: 30,
                                                    wights: 85,
                                                  ),
                                                )
                                              ],
                                            ))
                                      ],
                                    )),
                              ],
                            )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 100,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.green),
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20))),
                        margin: EdgeInsets.only(left: 10, right: 10),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 1.9,
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 40,
                            ),
                            Row(
                              children: [
                                Container(
                                    child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.only(
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              5,
                                        ),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  21,
                                            ),
                                            Icon(
                                              Icons.swap_vert,
                                              color: Colors.green,
                                              size: 20.0,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  40,
                                            ),
                                            Text(
                                              Config_G.check_lang
                                                  ? "GIAO DỊCH GẦN ĐÂY"
                                                  : "RECENT TRANSACTIONS",
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 15,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        )),
                                    Container(
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                20),
                                        Center(
                                            child: Column(children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                14,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                28,
                                          ),
                                        ])) ///////
                                      ],
                                    ))
                                  ],
                                ))
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 50,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.5),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              height: 2,
                              margin: EdgeInsets.only(left: 20, right: 20),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 50,
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 20, right: 20),
                                child: Column(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(right: 2),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                                child: Row(
                                              children: [
                                                Text(
                                                  Config_G.check_lang
                                                      ? "CHI TIẾT"
                                                      : "DETAIL",
                                                  style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 15,
                                                    fontFamily: 'Poppins',
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Colors.green,
                                                  size: 15,
                                                )
                                              ],
                                            ))
                                          ],
                                        )),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              100,
                                    ),
                                    Container(
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.green.withOpacity(0.2),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        height:
                                            MediaQuery.of(context).size.height /
                                                2.7,
                                        child: Config_G.checknull()
                                            ? Center(
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                children: [

                                                  CircularProgressIndicator(
                                                    backgroundColor: Colors.white,
                                                    color: Colors.green,
                                                  ),
                                                  SizedBox(
                                                    height:
                                                    MediaQuery.of(context).size.height /
                                                        100,
                                                  ),
                                                  Padding(
                                                      child: Text(
                                                        Statemonet,
                                                        style: TextStyle(color: Colors.green, fontSize: 16),
                                                        textAlign: TextAlign.center,
                                                      ),
                                                      padding: EdgeInsets.only(bottom: 4))
                                                ],
                                              ))
                                            : SingleChildScrollView(
                                                physics: ScrollPhysics(),
                                                child:
                                                    Column(children: <Widget>[
                                                  ListViewsBill(),
                                                ]))),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              100,
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ]),
            )));
  }
}
