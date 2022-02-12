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
import 'Filter.dart';
import 'W_CreateChanger.dart';
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
                                    IconButton(
                                        onPressed: () {},
                                        icon: SvgPicture.asset(
                                            "assest/IconBtn/btndraw.svg")),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                14),
                                    Text(
                                      Config_G.Tilte_vis,
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
                                          namebtn: Config_G.createbtn_vi,
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
                                    OptionBtn(
                                      path: "assest/IconBtn/manager.svg",
                                      namebtn: "GD MỚI",
                                      wights:
                                          MediaQuery.of(context).size.width / 7,
                                      heights:
                                          MediaQuery.of(context).size.height /
                                              14,
                                      colors: Colors.green.withOpacity(0.5),
                                    ),
                                    InkWell(
                                      splashColor: Colors.black12,
                                      child: OptionBtn(
                                        path: "assest/IconBtn/Statistical.svg",
                                        namebtn: "Thống kê",
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
                                        namebtn: "Đăng ký",
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
                                            "ThÔNG TIN QUẢN LÝ",
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
                                                        "TỔNG NỢ",
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
                                                            "\$ ${Config_G.moneys()}",
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
                                                        "GIAO DỊCH GẦN ĐÂY",
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
                                                children: [
                                                  SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              8),
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
                                                                              Filter(),
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
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Hôm nay",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 15,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                      ),
                                                      Container(
                                                          child: Row(
                                                        children: [
                                                          Text(
                                                            "CHI TIẾT",
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
                                                      6,
                                                  child: Config_G.checknull()
                                                      ? Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Center(
                                                                child: Text(
                                                              "Không có dữ liệu.",
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
                                              // ------------------------------------------------------------------------------------------------------------
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Hôm qua",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                  Container(
                                                      child: Row(
                                                    children: [
                                                      Text(
                                                        "CHI TIẾT",
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
                                                      6,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Center(
                                                          child: Text(
                                                        "Không có dữ liệu.",
                                                        style: TextStyle(
                                                          color: Colors.green,
                                                          fontSize: 15,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ))
                                                    ],
                                                  )),
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
