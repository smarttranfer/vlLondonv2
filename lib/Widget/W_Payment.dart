import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:vl_ui/Button/Btn_own.dart';
import 'package:vl_ui/Button/Btn_shop_own.dart';
import 'package:vl_ui/DartJs/FuntionsAction.dart';
import 'package:vl_ui/Globle/Config_G.dart';
import 'package:vl_ui/model/Infomation_Custome_Bill.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'Homepage.dart';
import 'W_PaymentInvoice.dart';

class W_Payment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return W_Payments();
  }
}

class W_Payments extends State<W_Payment> {
  final List<Map<String, dynamic>> _allUsers = [];
  static List<Map<String, dynamic>> allInfo_Shop = [];
  static List<Map<String, dynamic>> billShop = [];
  static String nameShop = '';
  List<Map<String, dynamic>> _foundUsers = [];
  static String Statemonet = '';
  bool check_loding_data = true;
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  void initState() {
    Statemonet = 'Please wait …';
    asyncMethod();
    for (Information_Custome_Bill i in Config_G.model_Custome_Bill) {
      if (i.owe > 0) {
        _allUsers.add({
          "id": "${i.customer_id}",
          "name": "${i.name_Custome}",
          "total_owe": "${i.owe}",
          "Debt_transtion": "${i.list_invoices.length}",
          "owe": "${i.owe}",
          "lenght": "${i.list_invoices.length}",
          // "phone" : "${i.}"
        });
      }
    }
    _foundUsers = _allUsers;
    setState(() {
      check_loding_data = false;
    });

    super.initState();
  }

  void asyncMethod() async {
    await ActionJS.Get_Voice();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assest/background/bkapps.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height / 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    duration: Duration(
                                        milliseconds: Config_G.timeDruation),
                                    reverseDuration: Duration(
                                        milliseconds: Config_G.timeDruation),
                                    child: W_Home()));
                          },
                          icon: Icon(Icons.arrow_back_ios_outlined),
                          color: Colors.white,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.height / 30),
                        Center(
                          child: Text(
                            Config_G.check_lang
                                ? "     THANH TOÁN"
                                : "       PAYMENT",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 25,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 14),
                      ],
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: TextField(
                          onChanged: (value) {
                            return _runFilter(value);
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                // width: 0.0 produces a thin "hairline" border
                                borderRadius:
                                    BorderRadius.all(Radius.circular(80.0)),
                                borderSide: BorderSide.none,
                              ),
                              hintText: 'Search',
                              suffixIcon: Icon(Icons.search)),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                        flex: 20,
                        child: Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20.0),
                                  topLeft: Radius.circular(20.0)),
                              boxShadow: [
                                BoxShadow(blurRadius: 7.0, color: Colors.black)
                              ]),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      height: 3,
                                      width: 20,
                                      margin:
                                          EdgeInsets.only(left: 20, right: 20),
                                    ),
                                    Text(
                                      "Result",
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 20,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      height: 3,
                                      width: 20,
                                      margin:
                                          EdgeInsets.only(left: 20, right: 20),
                                    ),
                                  ],
                                ),
                                check_loding_data
                                    ? Center(
                                        child: Column(
                                        children: [
                                          CircularProgressIndicator(
                                            backgroundColor:
                                                Colors.green.withOpacity(0.5),
                                            color: Colors.green,
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                100,
                                          ),
                                          Padding(
                                              child: Text(
                                                Statemonet,
                                                style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 16),
                                                textAlign: TextAlign.center,
                                              ),
                                              padding:
                                                  EdgeInsets.only(bottom: 4))
                                        ],
                                      ))
                                    : Expanded(
                                        child: ListView.builder(
                                            itemCount: _foundUsers.length,
                                            itemBuilder: (context, index) =>
                                                Card(
                                                  key: ValueKey(
                                                      _foundUsers[index]["id"]),
                                                  color: Colors.white,
                                                  elevation: 4,
                                                  margin: const EdgeInsets
                                                      .symmetric(vertical: 10),
                                                  child: Card(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50.0),
                                                      ),
                                                      elevation: 50,
                                                      shadowColor:
                                                          Colors.black12,
                                                      child: InkWell(
                                                          onTap: () async {
                                                            print(_foundUsers[index]["id"]);
                                                            await ActionJS.GetInforShop(int.parse(_foundUsers[index]["id"]).toInt());
                                                            return showBarModalBottomSheet(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return Container(
                                                                      height: MediaQuery.of(context)
                                                                              .size
                                                                              .height /
                                                                          1.5,
                                                                      width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width,
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          Row(
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsets.only(left: 3, top: 30),
                                                                                child: Text(
                                                                                  "Name : ",
                                                                                  style: TextStyle(
                                                                                    color: Colors.green,
                                                                                    fontSize: 20,
                                                                                    fontFamily: 'Poppins',
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsets.only(left: 2, top: 30),
                                                                                child: Text(
                                                                                  "${_foundUsers[index]["name"]}",
                                                                                  style: TextStyle(
                                                                                    color: Colors.green,
                                                                                    fontSize: 20,
                                                                                    fontFamily: 'Poppins',
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),
                                                                                ),
                                                                              )
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsets.only(left: 2, top: 5),
                                                                                child: Text(
                                                                                  "Phone Number : ",
                                                                                  style: TextStyle(
                                                                                    color: Colors.green,
                                                                                    fontSize: 20,
                                                                                    fontFamily: 'Poppins',
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsets.only(left: 3, top: 5),
                                                                                child: Text(
                                                                                  "${allInfo_Shop[0]["phone"].toString()}",
                                                                                  style: TextStyle(
                                                                                    color: Colors.green,
                                                                                    fontSize: 20,
                                                                                    fontFamily: 'Poppins',
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),
                                                                                ),
                                                                              )
                                                                            ],
                                                                          ),

                                                                          SizedBox(height: MediaQuery.of(context).size.height/50,),
                                                                          Text("----------***----------",
                                                                            style: TextStyle(
                                                                            color: Colors.green,
                                                                            fontSize: 20,
                                                                            fontFamily: 'Poppins',
                                                                            fontWeight: FontWeight.w600,
                                                                          ),),
                                                                          Expanded(
                                                                            child: ListView.builder(
                                                                                itemCount: billShop.length,
                                                                                itemBuilder: (context, index) => Card(
                                                                                    color: Colors.white,
                                                                                    elevation: 4,
                                                                                    margin: const EdgeInsets.symmetric(vertical: 10),
                                                                                    child: Card(
                                                                                        shape: RoundedRectangleBorder(
                                                                                          borderRadius: BorderRadius.circular(50.0),
                                                                                        ),
                                                                                        elevation: 50,
                                                                                        shadowColor: Colors.black12,
                                                                                        child: InkWell(
                                                                                        onTap: (){
                                                                                          Navigator.pop(context);
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
                                                                                                  child: W_PaymentInove(id: billShop[index]["id"].toString(),nameCustome: _foundUsers[index]["name"] , nameShop: billShop[index]["name"].toString(),total_own:billShop[index]["total_owe"].toString())));
                                                                                        }, child: BtnFilter_own(lenght: "", Content: "${billShop[index]["name"].toString()}", Subcontent: '${billShop[index]["total_owe"].toString()}', wights: MediaQuery.of(context).size.width / 1, heights: 50, colors: Colors.green.withOpacity(0.0), path: ""))))),
                                                                          ),

                                                                        ],
                                                                      ));
                                                                });
                                                          },
                                                          child: BtnFilter_own(
                                                              lenght:
                                                                  "${_foundUsers[index]["lenght"].toString()}",
                                                              Content:
                                                                  "${_foundUsers[index]["name"].toString()}",
                                                              Subcontent:
                                                                  '${_foundUsers[index]["owe"].toString()}',
                                                              wights: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  1,
                                                              heights: 50,
                                                              colors: Colors
                                                                  .green
                                                                  .withOpacity(
                                                                      0.0),
                                                              path: ""))),
                                                ))),
                              ],
                            ),
                          ),
                        ))
                  ],
                ),
              )),
        ));
  }
}
