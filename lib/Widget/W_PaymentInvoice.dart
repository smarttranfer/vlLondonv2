import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:vl_ui/Button/Btn_own.dart';
import 'package:vl_ui/DartJs/FuntionsAction.dart';
import 'package:vl_ui/Globle/Config_G.dart';
import 'package:vl_ui/model/Infomation_Custome_Bill.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'Homepage.dart';

class W_PaymentInove extends StatefulWidget {
  const W_PaymentInove({
    required this.id,
    required this.nameCustome,
    required this.nameShop,
    required this.total_own,
    Key? key,
  }) : super(key: key);
  final String id;
  final String nameCustome;
  final String nameShop;
  final String total_own;
  @override
  State<StatefulWidget> createState() {
    return W_PaymentsInove();
  }
}

class W_PaymentsInove extends State<W_PaymentInove> {
  CurrencyTextInputFormatter _money = CurrencyTextInputFormatter();

  @override
  void initState() {
    asyncMethod();
    for (Information_Custome_Bill i in Config_G.model_Custome_Bill) {

    }
    super.initState();
  }

  void asyncMethod() async {
    await ActionJS.Get_Voice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        floatingActionButton:FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: (){
            //code to execute on button press
          },
          child: Icon(Icons.send,size: 30,), //icon inside button
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        //floating action button position to center

        bottomNavigationBar: BottomAppBar( //bottom navigation bar on scaffold
          color:Colors.green,
          shape: CircularNotchedRectangle(), //shape of notch
          notchMargin: 8, //notche margin between floating button and bottom appbar
          child: Row( //children inside bottom appbar
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  "1000000",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  "1-30-128-390128",
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
        ),
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
                                ? "     THANH TOÁN "
                                : "     DETAIL PAYMENT ",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 22,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 14),
                      ],
                    ),
                    Column(children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10, top: 30),
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
                            padding: EdgeInsets.only(left: 5, top: 30),
                            child: Text(
                              "${widget.nameCustome}",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10, top: 5),
                            child: Text(
                              "Shop Name : ",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5, top: 5),
                            child: Text(
                              "${widget.nameShop}",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],),
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
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Tong no :  ",
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 20,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "${widget.total_own}",
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 20,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width/36,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Payment :  ",
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 20,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                        Container(
                                          height: MediaQuery.of(context).size.height/14,
                                          width: MediaQuery.of(context).size.width/2.4,
                                          child:
                                        Card(
                                            elevation: 10,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(15.0),
                                            ),
                                            child: TextField(
                                                  // controller: _notes,
                                              inputFormatters: [
                                                // ThousandsFormatter(),
                                                _money,
                                                CurrencyTextInputFormatter(
                                                  locale: 'en',
                                                  symbol: '',
                                                  decimalDigits: 2,
                                                ),
                                              ],
                                                  keyboardType:
                                                  TextInputType.number,
                                                  decoration: InputDecoration(
                                                    labelStyle: TextStyle(
                                                        color: Colors.green),
                                                    hintStyle: TextStyle(
                                                        color: Colors.green),
                                                    fillColor: Colors.white70,
                                                    enabledBorder:
                                                    OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              12.0)),
                                                      borderSide: BorderSide(
                                                          color: Colors.green,
                                                          width: 2),
                                                    ),
                                                    focusedBorder:
                                                    OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              10.0)),
                                                      borderSide: BorderSide(
                                                          color: Colors.green,
                                                          width: 2),
                                                    ),
                                                  ),
                                                ))),
                                        ],
                                    ),

                                  ],
                                ),
                                // const SizedBox(
                                //   height: 20,
                                // ),
                                Expanded(
                                    child: ListView.builder(
                                        itemCount:Config_G.model_Custome_Bill[1].list_invoices.length,
                                        itemBuilder: (context, index) =>
                                            Card(
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
                                                                              "${Config_G.model_Custome_Bill[1].list_invoices[index].name_Bill}",
                                                                              style: TextStyle(
                                                                                color: Colors.green,
                                                                                fontSize: 20,
                                                                                fontFamily: 'Poppins',
                                                                                fontWeight: FontWeight.bold,
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
                                                                              "${Config_G.model_Custome_Bill[1].list_invoices[index].create_date}",
                                                                              style: TextStyle(
                                                                                color: Colors.green,
                                                                                fontSize: 20,
                                                                                fontFamily: 'Poppins',
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                      Expanded(
                                                                        child: ListView.builder(
                                                                            itemCount: Config_G.model_Custome_Bill[1].list_invoices.length,
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
                                                                                    child: InkWell(child: BtnFilter_own(lenght: "${Config_G.model_Custome_Bill[1].list_invoices[index].user_id}", Content: "${Config_G.model_Custome_Bill[1].list_invoices[index].name_Bill}", Subcontent: '${Config_G.model_Custome_Bill[1].list_invoices[index].create_date}', wights: MediaQuery.of(context).size.width / 1, heights: 50, colors: Colors.green.withOpacity(0.0), path: ""))))),
                                                                      ),

                                                                    ],
                                                                  ));
                                                            });
                                                      },
                                                      child: BtnFilter_own(lenght: "${Config_G.model_Custome_Bill[1].list_invoices[index].user_id}", Content: "${Config_G.model_Custome_Bill[1].list_invoices[index].name_Bill}", Subcontent: '${Config_G.model_Custome_Bill[1].list_invoices[index].create_date}', wights: MediaQuery.of(context).size.width / 1, heights: 50, colors: Colors.green.withOpacity(0.0), path: ""))),
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
