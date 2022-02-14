import 'package:provider/provider.dart';
import 'package:vl_ui/Button/DetailBtn.dart';
import 'package:vl_ui/Button/OptionButton.dart';
import 'package:vl_ui/Globle/Config_G.dart';
import 'package:vl_ui/Object_Wiget/ListBill.dart';
import 'package:vl_ui/Widget/W_Login.dart';
import 'package:vl_ui/Widget/W_Signupmanger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vl_ui/model/ModelCustome.dart';
import 'Filter_Bill.dart';
import 'W_CreateChanger.dart';
import 'W_DealManager.dart';
import 'W_static.dart';

class W_Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Home();
  }
}

class Home extends State {
  bool checkdataToday = false;
  bool checkdataYesterday = false;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Bill>(
        create: (context) => Bill(),
        child: Builder(builder: (context) {
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
                    child: Consumer<Bill>(builder: (context, provider, child) {
                      return Column(
                        children: [
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    PopupMenuButton(
                                        shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                width: 2, color: Colors.green),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15.0))),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(),
                                          child: SvgPicture.asset(
                                              "assest/IconBtn/btndraw.svg"),
                                        ),
                                        itemBuilder: (context) => [
                                              PopupMenuItem(
                                                  child: Row(
                                                children: [
                                                  IconButton(
                                                    icon: Image.asset(
                                                        "assest/IconBtn/vietnam.png"),
                                                    onPressed: () {
                                                      print(
                                                          "Dổi ngồn ngũ sang tiếng việt");
                                                      setState(() {
                                                        Config_G.check_lang = true;
                                                      });
                                                    },
                                                  ),
                                                  Text(
                                                    "Tiếng Việt",
                                                    style: TextStyle(
                                                      color: Colors.green,
                                                      fontSize: 20,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  )
                                                ],
                                              )),
                                              PopupMenuItem(
                                                  child: Row(
                                                children: [
                                                  IconButton(
                                                    icon: Image.asset(
                                                      "assest/IconBtn/kingdom.png",
                                                    ),
                                                    onPressed: () {
                                                      print(
                                                          "Dổi ngồn ngũ sang tiếng anh");
                                                      setState(() {
                                                        Config_G.check_lang = false;
                                                      });
                                                    },
                                                  ),
                                                  Text(
                                                    "English",
                                                    style: TextStyle(
                                                      color: Colors.green,
                                                      fontSize: 20,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  )
                                                ],
                                              ))
                                            ]),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                14),
                                    Text(
                                      Config_G.check_lang
                                          ?Config_G.Tilte_vis:Config_G.Tilte_eng,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                14),
                                    InkWell(
                                        onTap: () {
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
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                Colors.green.withOpacity(0.5),
                                          ),
                                          child: Center(
                                              child: CircleAvatar(
                                            backgroundColor: Colors
                                                .lightGreenAccent
                                                .withOpacity(0.6),
                                            child: Text(
                                              Config_G.Usernames.substring(0, 2)
                                                  .toString()
                                                  .toUpperCase(),
                                            ),
                                          )),
                                        ))
                                  ],
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        100),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                        onTap: () {
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
                                                  child: W_CreateChange()));
                                        },
                                        child: OptionBtn(
                                          path:
                                              "assest/IconBtn/createTranfer.svg",
                                          namebtn: Config_G.check_lang?"TẠO GD":"CREATE DEAL",
                                          wights: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              7,
                                          heights: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              14,
                                          colors: Colors.green.withOpacity(0.5),
                                        )),
                                    InkWell(
                                      onTap: (){
                                        Navigator.push(
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
                                                child: DealManagers()));
                                      },
                                        child: OptionBtn(
                                      path: "assest/IconBtn/manager.svg",
                                      namebtn: Config_G.check_lang?"GD MỚI":"MANAGER DEAL",
                                      wights:
                                          MediaQuery.of(context).size.width / 7,
                                      heights:
                                          MediaQuery.of(context).size.height /
                                              14,
                                      colors: Colors.green.withOpacity(0.5),
                                    )),
                                    InkWell(
                                      splashColor: Colors.black12,
                                      child: OptionBtn(
                                        path: "assest/IconBtn/Statistical.svg",
                                        namebtn:  Config_G.check_lang?"THỐNG KÊ":"STATISTICAL",
                                        wights:
                                            MediaQuery.of(context).size.width /
                                                7,
                                        heights:
                                            MediaQuery.of(context).size.height /
                                                14,
                                        colors: Colors.green.withOpacity(0.5),
                                      ),
                                      onTap: () {
                                        Navigator.push(
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
                                                child: StatsPage()));
                                      },
                                    ),
                                    InkWell(
                                      splashColor: Colors.black12,
                                      child: OptionBtn(
                                        path: "assest/IconBtn/SignUp.svg",
                                        namebtn:  Config_G.check_lang?"ĐĂNG KÝ":"REGISTRATION",
                                        wights:
                                            MediaQuery.of(context).size.width /
                                                7,
                                        heights:
                                            MediaQuery.of(context).size.height /
                                                14,
                                        colors: Colors.green.withOpacity(0.5),
                                      ),
                                      onTap: () {
                                        Navigator.push(
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
                                                child: W_Signupmanagee()));
                                      },
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 50),
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.green),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height / 5,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                40,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                21,
                                          ),
                                          Icon(
                                            Icons.info_outline,
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
                                            Config_G.check_lang?"THÔNG TIN QUẢN LÝ":"MANAGEMENT INFORMATION",
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
                                        height:
                                            MediaQuery.of(context).size.height /
                                                40,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.green.withOpacity(0.5),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        height: 2,
                                        margin: EdgeInsets.only(
                                            left: 20, right: 20),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                40,
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
                                                        Config_G.check_lang?"TỔNG NỢ":"TOTAL LIABILITIES",
                                                        style: TextStyle(
                                                          color: Colors.green,
                                                          fontSize: 15,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            300,
                                                  ),
                                                  Container(
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "\€ ${Config_G.moneys()}",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.green,
                                                              fontSize: 25,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          DetailBtn(
                                                            colors: HexColor(
                                                                    "#388118")
                                                                .withOpacity(
                                                                    0.2),
                                                            heights: 30,
                                                            wights: 85,
                                                          ),
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
                                  height:
                                      MediaQuery.of(context).size.height / 100,
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
                                  height:
                                      MediaQuery.of(context).size.height / 1.9,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                40,
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
                                                    right:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            5,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
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
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            40,
                                                      ),
                                                      Text(
                                                        Config_G.check_lang?"GIAO DỊCH GẦN ĐÂY":"RECENT TRANSACTIONS",
                                                        style: TextStyle(
                                                          color: Colors.green,
                                                          fontSize: 15,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                              Container(
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              20),
                                                  Center(
                                                      child: Column(children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              14,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              28,
                                                      child: Container(

                                                          // margin: EdgeInsets.all(8),
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                color: Colors
                                                                    .green),
                                                            color: Colors.green
                                                                .withOpacity(
                                                                    0.2),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  10),
                                                            ),
                                                          ),
                                                          //---------------------can chinh sua --------------------------------------
                                                          child: InkWell(
                                                              onTap: () {},
                                                              child: Container(
                                                                  child: Center(
                                                                child: InkWell(
                                                                    onTap: () =>
                                                                        showBarModalBottomSheet(
                                                                          expand:
                                                                              true,
                                                                          context:
                                                                              context,
                                                                          builder: (context) =>
                                                                              Filter_Bills(),
                                                                        ),
                                                                    child: SvgPicture
                                                                        .asset(
                                                                      "assest/IconBtn/search.svg",
                                                                      color: Colors
                                                                          .green,
                                                                    )),
                                                              )))),
                                                    ),
                                                  ])) ///////
                                                ],
                                              ))
                                            ],
                                          ))
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                50,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.green.withOpacity(0.5),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        height: 2,
                                        margin: EdgeInsets.only(
                                            left: 20, right: 20),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                50,
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(
                                              left: 20, right: 20),
                                          child: Column(
                                            children: [
                                              Container(
                                                  margin:
                                                      EdgeInsets.only(right: 2),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Container(
                                                          child: Row(
                                                        children: [
                                                          Text(
                                                            Config_G.check_lang?"CHI TIẾT":"DETAIL",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.green,
                                                              fontSize: 15,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .arrow_forward_ios,
                                                            color: Colors.green,
                                                            size: 15,
                                                          )
                                                        ],
                                                      ))
                                                    ],
                                                  )),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    100,
                                              ),
                                              Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.green
                                                          .withOpacity(0.2),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20))),
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      2.7,
                                                  child: Config_G.checknull()
                                                      ? Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Center(
                                                                child: Text(
                                                                  Config_G.check_lang?"Không có dữ liệu.":"Not Found Data.",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .green,
                                                                fontSize: 15,
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ))
                                                          ],
                                                        )
                                                      : SingleChildScrollView(
                                                          physics:
                                                              ScrollPhysics(),
                                                          child: Column(
                                                              children: <
                                                                  Widget>[
                                                                ListViewsBill(),
                                                              ]))),

                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
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
                        ],
                      );
                    }),
                  )));
        }));
  }
}
