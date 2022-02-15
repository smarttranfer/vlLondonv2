import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:timelines/timelines.dart';
import 'package:vl_ui/Globle/Config_G.dart';
import 'package:vl_ui/model/New_Changer.dart';

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
    int k = 1;
    for (Information_Bill i in Config_G.modelBill) {
      _allUsers.add({
        "id": "${k}",
        "name": "${i.namecustome}-${i.namecustome}",
        "shop": "${i.nameshop}",
        "mony": "${i.money}",
        "date": "${i.date}",
        "code": "${i.code}"
      });
      k += 1;
    }
    _foundUsers = _allUsers;
    super.initState();
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
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_outlined,
                          color: Colors.white,
                        )),
                    SizedBox(width: MediaQuery.of(context).size.width / 7),
                    Text(
                      Config_G.check_lang
                          ? "QUẢN LÝ BILL"
                          : "MANAGER BILL",
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
                                      child: _OrderTitle(
                                        date: _foundUsers[index]["date"]
                                            .toString(),
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
                                                  child: Text(
                                                    'Shop : ${_foundUsers[index]["shop"].toString()}',
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
                                                  child: Text(
                                                    "Code Bill :${_foundUsers[index]["code"].toString()}",
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
                                                  child: Text(
                                                    "Money : ${_foundUsers[index]["mony"].toString()}",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ))
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Divider(height: 1.0),
                                    Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          primary: HexColor(
                                                              "#237401"), //background color of button
                                                          elevation:
                                                              3, //elevation of button
                                                          shape:
                                                              RoundedRectangleBorder(
                                                                  //to set border radius to button
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15)),
                                                          padding: EdgeInsets.only(
                                                              left: 30,
                                                              right: 30,
                                                              top: 20,
                                                              bottom:
                                                                  15) //content padding inside button
                                                          ),
                                                  onPressed: () {},
                                                  child: Text(
                                                      Config_G.check_lang
                                                          ? 'Thanh toán bill'
                                                          : 'Bill payment',
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                          fontSize: 10)),
                                                ))),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  30,
                                            ),
                                            Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                ),
                                                child: Center(
                                                    child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          primary: HexColor(
                                                                  "#237401")
                                                              .withOpacity(
                                                                  0.5), //background color of button
                                                          elevation:
                                                              3, //elevation of button
                                                          shape:
                                                              RoundedRectangleBorder(
                                                                  //to set border radius to button
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15)),
                                                          padding: EdgeInsets.only(
                                                              left: 30,
                                                              right: 30,
                                                              top: 20,
                                                              bottom:
                                                                  15) //content padding inside button
                                                          ),
                                                  onPressed: () {},
                                                  child: Text(
                                                      Config_G.check_lang
                                                          ? 'Thanh toán hêt'
                                                          : 'Pay all Bills ',
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                          fontSize: 10)),
                                                )))
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          )),
                    )
                  : Text(
                      Config_G.check_lang
                          ? 'Không tìm thấy kết quả'
                          : "Not found data",
                      style: TextStyle(fontSize: 24, color: Colors.green),
                    ),
            ),
          ],
        ),
      ),
    ));
  }
}

class _OrderTitle extends StatelessWidget {
  const _OrderTitle({
    Key? key,
    required this.date,
    required this.index,
  }) : super(key: key);

  final String date;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          Config_G.check_lang ? "Hóa đơn #${index}" : "Bill #${index}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        Text(
          '${date}',
          style: TextStyle(
            color: Color(0xffb6b2b2),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: PopupMenuButton(
              shape: RoundedRectangleBorder(
                  side: BorderSide(width: 2, color: Colors.green),
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              child: Padding(
                  padding: EdgeInsets.symmetric(),
                  child: Icon(Icons.arrow_drop_down_circle_outlined)),
              itemBuilder: (context) => [
                    PopupMenuItem(
                        child: Row(
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            Config_G.check_lang ? "Sửa" : 'Edit',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    )),
                    PopupMenuItem(
                        child: Row(
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            Config_G.check_lang ? "Xóa" : 'Delete',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ))
                  ]),
        )
      ],
    );
  }
}
