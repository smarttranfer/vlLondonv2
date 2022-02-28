import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:vl_ui/Button/BtnFilter.dart';
import 'package:vl_ui/DartJs/FuntionsAction.dart';
import 'package:vl_ui/Globle/Config_G.dart';
import 'package:vl_ui/model/Information_Cutome.dart';
import 'package:vl_ui/model/Information_Shop.dart';
import 'package:http/http.dart' as http;

import 'Homepage.dart';

class W_CreateChange extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CreateChange();
  }
}

class CreateChange extends State {
  int indexchossens = 0;
  int id_shop = 0;
  TextEditingController _shop = TextEditingController();
  TextEditingController _nameCustom = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  var _money = new MoneyMaskedTextController(precision: 2);
  TextEditingController _notes = TextEditingController();
  List<DropdownMenuItem<Object>> ListCustom = [];
  List<DropdownMenuItem<Object>> ListShop = [];
  final List<Map<String, dynamic>> _allUsers = [];
  List<Map<String, dynamic>> _foundUsers = [];
  List<String> listShops = [];
  int indexchossen = 0;
  int indexshop = 0;
  bool check_loding_data = true;
  static bool check_done_transation = false;
  @override
  void initState() {
    dateinput.text = "";
    Config_G.NameCustom_shop.clear();
    asyncMethod();
    super.initState();
  }

  String moneycheck(String value) {
    if (value.length > 2) {
      return value.substring(0, value.length - 2) +
          "." +
          value.substring(value.length - 2);
    } else {
      return value;
    }
  }

  void asyncMethod() async {
    await GetInformation();
    for (Information_Cutome i in Config_G.NameCustom_shop) {
      _allUsers.add({
        "customer_id": i.id,
        "phone": i.telephone,
        "name": "${i.namecustome}",
        "shop": i.nameshop
      });
    }
    _foundUsers = _allUsers;
  }

  Future<void> GetInformation() async {
    try {
      var headers = {
        'Authorization': 'Bearer ${Config_G.Token_app}',
        'Content-Type': 'application/json'
      };
      var request =
          http.Request('GET', Uri.parse('${Config_G.url}/customer/info/all'));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      Config_G.id_Custome_shop = await response.stream.bytesToString();
      if (json.decode(Config_G.id_Custome_shop)["status"].toString() == "200") {
        for (var i in json.decode(Config_G.id_Custome_shop)["data"]) {
          Information_Cutome s1 = new Information_Cutome();
          s1.id = i["id"];
          s1.namecustome = i["name"];
          s1.telephone = i["phone"];
          for (var shop in i["shops"]) {
            Information_Shop s0 = new Information_Shop();
            s0.id = shop["id"];
            if (shop["phone"] == null) {
              s0.telephone = "";
            } else {
              s0.telephone = shop["phone"];
            }
            s0.post_code = shop["post_code"];
            s0.building_number = shop["building_number"];
            s0.nameshop = shop["name"];
            s0.address = shop["street_name"];
            s1.nameshop.add(s0);
          }
          Config_G.NameCustom_shop.add(s1);
          setState(() {
            check_loding_data = false;
          });
        }
      } else {
        print(response.reasonPhrase);
      }
    } on Exception catch (e) {
      print("Exception" + e.toString());
    }
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
    setState(() {
      _foundUsers = results;
    });
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
                    image: AssetImage("assest/background/bkr.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Container(
                      padding: EdgeInsets.only(bottom: 2),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: ListView(shrinkWrap: true, children: [
                        Column(
                          children: [
                            Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              25),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        W_Home()));
                                          },
                                          icon: Icon(
                                            Icons.arrow_back_ios_outlined,
                                            color: Colors.white,
                                          )),
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              7),
                                      Text(
                                        Config_G.check_lang
                                            ? "TẠO GIAO DỊCH MỚI"
                                            : "CREATE NEW TRADE",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 35),
                        Card(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          elevation: 15,
                          shadowColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19.0),
                          ),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green),
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height / 1.3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                                              ? "THÔNG TIN GIAO DỊCH"
                                              : "TRANSACTION INFORMATION",
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
                                              50,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.green.withOpacity(0.5),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      height: 2,
                                      margin:
                                          EdgeInsets.only(left: 20, right: 20),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              35,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Card(
                                            elevation: 10,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Card(
                                                      elevation: 10,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                      ),
                                                      child: TextField(
                                                          controller:
                                                              _nameCustom,
                                                          decoration:
                                                              InputDecoration(
                                                            labelText: Config_G
                                                                    .check_lang
                                                                ? 'Tên chủ khách hàng *'
                                                                : 'Customer name *',
                                                            labelStyle:
                                                                TextStyle(
                                                                    color: Colors
                                                                        .green),
                                                            prefixIcon: Icon(
                                                              Icons
                                                                  .supervised_user_circle_outlined,
                                                              color:
                                                                  Colors.green,
                                                            ),
                                                            hintStyle: TextStyle(
                                                                color: Colors
                                                                    .green),
                                                            filled: true,
                                                            fillColor:
                                                                Colors.white70,
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          12.0)),
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .green,
                                                                      width: 2),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          10.0)),
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .green,
                                                                      width: 2),
                                                            ),
                                                          ),
                                                          readOnly:
                                                              true, //set it true, so that user will not able to edit text
                                                          onTap: () async {
                                                            return showBarModalBottomSheet(
                                                              expand: Config_G
                                                                  .check_namecustom_chossen,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Container(
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius: BorderRadius.only(topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0)),
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                            blurRadius:
                                                                                7.0,
                                                                            color:
                                                                                Colors.black)
                                                                      ]),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            10),
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        const SizedBox(
                                                                          height:
                                                                              20,
                                                                        ),
                                                                        TextField(
                                                                          onChanged: (value) =>
                                                                              _runFilter(value),
                                                                          decoration: const InputDecoration(
                                                                              labelText: 'Search',
                                                                              suffixIcon: Icon(Icons.search)),
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              20,
                                                                        ),
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Container(
                                                                              decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.all(Radius.circular(20))),
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
                                                                              decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.all(Radius.circular(20))),
                                                                              height: 3,
                                                                              width: 20,
                                                                              margin: EdgeInsets.only(left: 20, right: 20),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        check_loding_data
                                                                            ? Center(
                                                                                child: FutureBuilder(
                                                                                  builder: (context, snapshot) {
                                                                                    if (snapshot.hasData) {
                                                                                      for (Information_Cutome i in Config_G.NameCustom_shop) {
                                                                                        print(i.id);
                                                                                      }
                                                                                    } else if (snapshot.hasError) {
                                                                                      return Text("${snapshot.error}");
                                                                                    }
                                                                                    // By default, show a loading spinner
                                                                                    return CircularProgressIndicator(
                                                                                      color: Colors.green,
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              )
                                                                            : Expanded(
                                                                                child: _foundUsers.isNotEmpty
                                                                                    ? ListView.builder(
                                                                                        itemCount: _foundUsers.length,
                                                                                        itemBuilder: (context, index) => Card(
                                                                                              key: ValueKey(_foundUsers[index]["id"]),
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
                                                                                                      onTap: () {
                                                                                                        setState(() {
                                                                                                          Navigator.pop(context);
                                                                                                          Config_G.check_namecustom_chossen = false;
                                                                                                          listShops.clear();
                                                                                                          for (Information_Shop i in _foundUsers[index]["shop"]) {
                                                                                                            listShops.add(i.nameshop);
                                                                                                          }
                                                                                                          setState(() {
                                                                                                            indexchossen = index;
                                                                                                            _nameCustom..text = _foundUsers[index]["name"];
                                                                                                          });
                                                                                                        });
                                                                                                      },
                                                                                                      child: BtnFilter(Content: "${_foundUsers[index]["name"].toString()}", Subcontent: '${_foundUsers[index]["phone"].toString()}', wights: MediaQuery.of(context).size.width / 1, heights: 50, colors: Colors.green.withOpacity(0.0), path: ""))),
                                                                                            ))
                                                                                    : const Text(
                                                                                        'Không tìm thấy kết quả',
                                                                                        style: TextStyle(fontSize: 24, color: Colors.green),
                                                                                      ),
                                                                              ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          })),
                                                ),
                                              ],
                                            )),
                                        // -------------------------------------------------------------------
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  25,
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 3),
                                          child: Card(
                                              elevation: 10,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              child: new Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Expanded(
                                                        child: new TextField(
                                                            enabled: false,
                                                            decoration:
                                                                InputDecoration(
                                                              labelText: Config_G
                                                                      .check_lang
                                                                  ? 'Tên Shop *'
                                                                  : 'Name Shop *',
                                                              labelStyle: TextStyle(
                                                                  color: Colors
                                                                      .green),
                                                              prefixIcon: Icon(
                                                                Icons
                                                                    .view_list_outlined,
                                                                color: Colors
                                                                    .green,
                                                              ),
                                                              hintStyle: TextStyle(
                                                                  color: Colors
                                                                      .green),
                                                              filled: true,
                                                              fillColor: Colors
                                                                  .white70,
                                                              disabledBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            12.0)),
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .green,
                                                                    width: 2),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10.0)),
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .green,
                                                                    width: 2),
                                                              ),
                                                            ),
                                                            controller: _shop)),
                                                    Card(
                                                      elevation: 10,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        side: BorderSide(
                                                          color: Colors.green,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                      ),
                                                      child:
                                                          new PopupMenuButton<
                                                              String>(
                                                        icon: const Icon(Icons
                                                            .arrow_drop_down),
                                                        onSelected:
                                                            (String value) {
                                                          for (Information_Shop i
                                                              in _foundUsers[
                                                                      indexchossen]
                                                                  ["shop"]) {
                                                            if (i.nameshop ==
                                                                value) {
                                                              id_shop = i.id;
                                                            }
                                                          }
                                                          _shop.text = value;
                                                        },
                                                        itemBuilder:
                                                            (BuildContext
                                                                context) {
                                                          return listShops.map<
                                                                  PopupMenuItem<
                                                                      String>>(
                                                              (String value) {
                                                            return new PopupMenuItem(
                                                                child: new Text(
                                                                    value),
                                                                value: value);
                                                          }).toList();
                                                        },
                                                      ),
                                                    )
                                                  ])),
                                        ),
                                        // --------------------------------------------------------------
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  25,
                                            ),
                                          ],
                                        ),

                                        // -----------------------------------------------------------
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  25,
                                            ),
                                          ],
                                        ),
                                        Card(
                                            elevation: 10,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            child: Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                ),
                                                child: TextField(
                                                    controller: dateinput,
                                                    autocorrect: true,
                                                    decoration: InputDecoration(
                                                      hintText: 'dd-MM-yyyy',
                                                      prefixIcon: Icon(
                                                        Icons
                                                            .calendar_today_sharp,
                                                        color: Colors.green,
                                                      ),
                                                      hintStyle: TextStyle(
                                                          color: Colors.green),
                                                      filled: true,
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
                                                    readOnly:
                                                        true, //set it true, so that user will not able to edit text
                                                    onTap: () async {
                                                      DateTime? pickedDate =
                                                          await showDatePicker(
                                                              context: context,
                                                              initialDate:
                                                                  DateTime
                                                                      .now(),
                                                              firstDate: DateTime(
                                                                  2000), //DateTime.now() - not to allow to choose before today.
                                                              lastDate:
                                                                  DateTime(
                                                                      2101));
                                                      if (pickedDate != null) {
                                                        print(
                                                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                                        String formattedDate =
                                                            DateFormat(
                                                                    'dd-MM-yyyy')
                                                                .format(
                                                                    pickedDate);
                                                        print(
                                                            formattedDate); //formatted date output using intl package =>  2021-03-16
                                                        //you can implement different kind of Date Format here according to your requirement

                                                        setState(() {
                                                          dateinput.text =
                                                              formattedDate; //set output date to TextField value.
                                                        });
                                                      } else {}
                                                    }))),
                                        // ---------------------------------------------
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  25,
                                            ),
                                          ],
                                        ),
                                        Card(
                                            elevation: 10,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            child: Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                ),
                                                child: TextField(
                                                  keyboardType:
                                                      TextInputType.number,
                                                  controller: _money,
                                                  autocorrect: true,
                                                  decoration: InputDecoration(
                                                    labelText: Config_G
                                                            .check_lang
                                                        ? 'Số tiền *'
                                                        : 'Amount of money *',
                                                    labelStyle: TextStyle(
                                                        color: Colors.green),
                                                    prefixIcon: Icon(
                                                      Icons.euro,
                                                      color: Colors.green,
                                                    ),
                                                    hintStyle: TextStyle(
                                                        color: Colors.green),
                                                    filled: true,
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
                                        // ---------------------------------------------------------------------
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  25,
                                            ),
                                          ],
                                        ),
                                        Card(
                                            elevation: 10,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            child: Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                ),
                                                child: TextField(
                                                  controller: _notes,
                                                  autocorrect: true,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        Config_G.check_lang
                                                            ? 'Ghi chú'
                                                            : 'Note',
                                                    labelStyle: TextStyle(
                                                        color: Colors.green),
                                                    prefixIcon: Icon(
                                                      Icons.note_add_rounded,
                                                      color: Colors.green,
                                                    ),
                                                    hintStyle: TextStyle(
                                                        color: Colors.green),
                                                    filled: true,
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
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              20,
                                        ),
                                        Row(
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
                                                  onPressed: () async {
                                                    if (_nameCustom
                                                            .text.isEmpty |
                                                        _shop.text.isEmpty |
                                                        dateinput.text.isEmpty |
                                                        _money.text.isEmpty) {
                                                      print(
                                                          "Bạn cần điền đầy đủ thông tin");
                                                      Fluttertoast.showToast(
                                                          msg:
                                                              "Bạn cần điền đầy đủ thông tin",
                                                          toastLength: Toast
                                                              .LENGTH_SHORT,
                                                          gravity: ToastGravity
                                                              .CENTER,
                                                          timeInSecForIosWeb: 2,
                                                          backgroundColor:
                                                              Colors.red,
                                                          textColor:
                                                              Colors.white,
                                                          fontSize: 16.0);
                                                    } else {
                                                      await ActionJS
                                                          .Create_transation(
                                                              id_shop,
                                                              _money.numberValue,
                                                              _notes.text,
                                                              dateinput.text);
                                                      if (check_done_transation ==
                                                          true) {
                                                        Navigator.pushReplacement(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (BuildContext
                                                                        context) =>
                                                                    W_Home()));
                                                        Fluttertoast.showToast(
                                                            msg: Config_G
                                                                    .check_lang
                                                                ? "Tạo giao dịch thành công"
                                                                : "Create successful transaction",
                                                            toastLength: Toast
                                                                .LENGTH_SHORT,
                                                            gravity: ToastGravity
                                                                .BOTTOM,
                                                            timeInSecForIosWeb:
                                                                2,
                                                            backgroundColor:
                                                                Colors.red,
                                                            textColor:
                                                                Colors.white,
                                                            fontSize: 16.0);
                                                      } else {
                                                        showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return AlertDialog(
                                                                title: Text(Config_G
                                                                        .check_lang
                                                                    ? "Thông báo hệ thống"
                                                                    : "System Notifications"),
                                                                content: Text(Config_G
                                                                        .check_lang
                                                                    ? 'Tính năng đang bảo trì !'
                                                                    : 'Feature under maintenance!'),
                                                                actions: <
                                                                    Widget>[
                                                                  FlatButton(
                                                                    child: Text(Config_G
                                                                            .check_lang
                                                                        ? "Hủy bỏ"
                                                                        : "CANCEL"),
                                                                    onPressed:
                                                                        () {
                                                                      //Put your code here which you want to execute on Cancel button click.
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    },
                                                                  ),
                                                                ],
                                                              );
                                                            });
                                                        Fluttertoast.showToast(
                                                            msg: Config_G
                                                                    .check_lang
                                                                ? "${json.decode(Config_G.Create_Transation)["data"]} ${json.decode(Config_G.Create_Transation)["message"]}"
                                                                : "${json.decode(Config_G.Create_Transation)["data"]} ${json.decode(Config_G.Create_Transation)["message"]}",
                                                            toastLength: Toast
                                                                .LENGTH_SHORT,
                                                            gravity: ToastGravity
                                                                .BOTTOM,
                                                            timeInSecForIosWeb:
                                                                10,
                                                            backgroundColor:
                                                                Colors.red,
                                                            textColor:
                                                                Colors.white,
                                                            fontSize: 16.0);
                                                      }
                                                    }
                                                  },
                                                  child: Text(
                                                      Config_G.check_lang
                                                          ? 'Xác nhận'
                                                          : 'Confirm',
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
                                                  onPressed: () {
                                                    Fluttertoast.showToast(
                                                        msg: Config_G.check_lang
                                                            ? "Hủy bỏ giao dịch thành công "
                                                            : "Cancellation of successful transaction",
                                                        toastLength:
                                                            Toast.LENGTH_SHORT,
                                                        gravity:
                                                            ToastGravity.BOTTOM,
                                                        timeInSecForIosWeb: 2,
                                                        backgroundColor:
                                                            Colors.red,
                                                        textColor: Colors.white,
                                                        fontSize: 16.0);
                                                    Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (BuildContext
                                                                    context) =>
                                                                W_Home()));
                                                  },
                                                  child: Text(
                                                      Config_G.check_lang
                                                          ? 'Loại bỏ '
                                                          : 'Cancel ',
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                          fontSize: 10)),
                                                )))
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          // const Spacer(),
                          // const Spacer()
                        )
                      ])),
                ))));
  }
}
