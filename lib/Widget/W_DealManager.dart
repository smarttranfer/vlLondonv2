import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vl_ui/DartJs/FuntionsAction.dart';
import 'package:vl_ui/Globle/Config_G.dart';
import 'package:vl_ui/Widget/Homepage.dart';
import 'package:vl_ui/model/Infomation_Custome_Bill.dart';
import 'package:vl_ui/model/New_Changer.dart';

import 'Information.dart';

class DealManagers extends StatefulWidget {
  const DealManagers({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<DealManagers> {
  final List<Map<String, dynamic>> _allUsers = [];
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    asyncMethod();
    for (Information_Custome_Bill i in Config_G.model_Custome_Bill) {
      _allUsers.add({
        "id": "${i.customer_id}",
        "name": "${i.name_Custome}",
        "total_owe": "${i.owe}",
        "Debt_transtion": "${i.list_invoices.length}",
        "unallocated": "${i.unallocated}",
      });
    }
    _foundUsers = _allUsers;
    print(_foundUsers.length);
    super.initState();
  }

  void asyncMethod() async {
    await ActionJS.Get_Voice();
  }

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

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assest/background/bkapps.png"),
            fit: BoxFit.cover,
          ),
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0)),
          boxShadow: [BoxShadow(blurRadius: 7.0, color: Colors.black)]),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
            ),
            Row(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  duration: Duration(milliseconds: 3),
                                  reverseDuration: Duration(
                                      milliseconds: Config_G.timeDruation),
                                  child: W_Home()));
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_outlined,
                          color: Colors.white,
                        )),
                    SizedBox(width: MediaQuery.of(context).size.width / 7),
                    Text(
                      Config_G.check_lang ? "QUẢN LÝ BILL" : "MANAGER BILL",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 25,
            ),
            SizedBox(width: MediaQuery.of(context).size.width / 7),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                  fillColor: Colors.white,
                  labelText: 'Search',
                  suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  height: 3,
                  width: 20,
                  margin: EdgeInsets.only(left: 20, right: 20),
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
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  height: 3,
                  width: 20,
                  margin: EdgeInsets.only(left: 20, right: 20),
                ),
              ],
            ),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundUsers.length,
                      itemBuilder: (context, index) => Card(
                          key: ValueKey(_foundUsers[index]["id"]),
                          color: Colors.white,
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: Center(
                            child: Container(
                              width: 360.0,
                              child: Card(
                                margin: EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: OrderTitle(
                                        id_transaction: int.parse(_foundUsers[index]["id"].toString()),
                                        index: index,
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 20, bottom: 10, right: 5),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.circle,
                                                color: Colors.green,
                                                size: 10,
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 10,
                                                      left: 20,
                                                      bottom: 10,
                                                      right: 5),
                                                  child: Text(
                                                    "Name : ${_foundUsers[index]["name"].toString()}",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ))
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 20, bottom: 10, right: 5),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.circle,
                                                color: Colors.green,
                                                size: 10,
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 10,
                                                      left: 20,
                                                      bottom: 10,
                                                      right: 5),
                                                  child: Container(
                                                      width: MediaQuery.of(context).size.width/1.6,
                                                      child: Text(
                                                        '${Config_G.check_lang?"Giao dich nợ":"Debt transaction"} : ${_foundUsers[index]["Debt_transtion"].toString()}',
                                                        overflow: TextOverflow
                                                            .visible,
                                                        maxLines: 5,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      )))
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 20, bottom: 10, right: 5),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.circle,
                                                color: Colors.green,
                                                size: 10,
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 10,
                                                      left: 20,
                                                      bottom: 10,
                                                      right: 5),

                                                  child: Container(
                                                      width: MediaQuery.of(context).size.width/1.6,
                                                      child: Row(children: [
                                                        Text(
                                                          "${Config_G.check_lang?"Tiền hiện có":"Amount"} :${_foundUsers[index]["unallocated"].toString()}",
                                                          style: TextStyle(
                                                            overflow: TextOverflow.visible,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                        Icon(Icons.arrow_drop_up,
                                                          color: Colors.blue,)
                                                      ],)
                                                      ))
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 20, bottom: 10, right: 5),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.circle,
                                                color: Colors.green,
                                                size: 10,
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 10,
                                                      left: 20,
                                                      bottom: 10,
                                                      right: 5),
                                                  child: Row(children: [
                                                    Text(
                                                      "Money : ${_foundUsers[index]["total_owe"].toString()}",
                                                      style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.bold,
                                                      ),
                                                    ),
                                                    Icon(Icons.arrow_drop_down,
                                                      color: Colors.red,
                                                    )
                                                  ],))
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Divider(height: 1.0),
                                    Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                ),
                                                child: Center(
                                                    child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                          minimumSize: const Size(200, 50),
                                                          maximumSize: const Size(200, 50),
                                                          primary: HexColor("#237401"), //background color of button
                                                          elevation: 3, //elevation of button
                                                          shape: RoundedRectangleBorder(
                                                                  //to set border radius to button
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15)),
                                                          padding: EdgeInsets.only(
                                                              left: 30,
                                                              right: 30,
                                                              top: 5,
                                                              bottom:
                                                                  5) //content padding inside button
                                                          ),
                                                  onPressed: () {},
                                                  child: Text(
                                                      Config_G.check_lang
                                                          ? 'Chi Tiết'
                                                          : 'Detail',
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                          fontSize: 20)),
                                                ))),

                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          )),
                    )
                  : Center(
                child: FutureBuilder(
                  builder: (context, snapshot) {
                    return CircularProgressIndicator(
                      color: Colors.green,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
