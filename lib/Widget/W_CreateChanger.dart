import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:vl_ui/Button/BtnFilter.dart';
import 'package:vl_ui/Globle/Config_G.dart';
import 'package:vl_ui/model/CheckSameCustome.dart';
import 'package:vl_ui/model/Information_Cutome.dart';
import 'package:vl_ui/model/Information_Shop.dart';
import 'package:vl_ui/model/ModelCustome.dart';
import 'package:vl_ui/model/New_Changer.dart';

import 'Homepage.dart';

class W_CreateChange extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CreateChange();
  }
}

class CreateChange extends State {
  String Nicknames = '';
  TextEditingController _shop = TextEditingController();
  TextEditingController _nameCustom = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  TextEditingController _code = TextEditingController();
  TextEditingController _money = TextEditingController();
  TextEditingController _notes = TextEditingController();
  List<DropdownMenuItem<Object>> ListCustom = [];
  List<DropdownMenuItem<Object>> ListShop = [];
  final List<Map<String, dynamic>> _allUsers = [];
  List<Map<String, dynamic>> _foundUsers = [];
  List<String> nameshops = [];
  int indexchossen = 0;
  int indexshop = 0;
  bool checklistcustome = false;
  @override
  void initState() {
    dateinput.text = "";
    int k = 0;
    if (Config_G.NameCustom_shop.length > 0) {
      setState(() {
        checklistcustome = true;
      });
    }
    for (Information_Cutome i in Config_G.NameCustom_shop) {
      _allUsers.add({
        "id": "${k}",
        "name": "${i.namecustome}-${i.Nickname}",
        "shop": i.nameshop
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
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assest/background/bkr.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: checklistcustome
                ? SingleChildScrollView(
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height / 1.2,
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
                                      // ------------------------------------------------------------
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
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
                                                                  .circular(
                                                                      15.0),
                                                        ),
                                                        child: TextField(
                                                            controller: _nameCustom
                                                              ..text = Config_G
                                                                      .check_namecustom_chossen
                                                                  ? ""
                                                                  : Config_G
                                                                      .namecustom_chossen,
                                                            decoration:
                                                                InputDecoration(
                                                              labelText: Config_G
                                                                      .check_lang
                                                                  ? 'Tên chủ khách hàng *'
                                                                  : 'Customer name *',
                                                              labelStyle: TextStyle(
                                                                  color: Colors
                                                                      .green),
                                                              prefixIcon: Icon(
                                                                Icons
                                                                    .supervised_user_circle_outlined,
                                                                color: Colors
                                                                    .green,
                                                              ),
                                                              hintStyle: TextStyle(
                                                                  color: Colors
                                                                      .green),
                                                              filled: true,
                                                              fillColor: Colors
                                                                  .white70,
                                                              enabledBorder:
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
                                                            readOnly:
                                                                true, //set it true, so that user will not able to edit text
                                                            onTap: () async {
                                                              return showBarModalBottomSheet(
                                                                expand: Config_G
                                                                    .check_namecustom_chossen,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return Container(
                                                                    decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        borderRadius: BorderRadius.only(topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0)),
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                              blurRadius: 7.0,
                                                                              color: Colors.black)
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
                                                                            decoration:
                                                                                const InputDecoration(labelText: 'Search', suffixIcon: Icon(Icons.search)),
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
                                                                          Expanded(
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
                                                                                                      print(_foundUsers[index]["shop"]);

                                                                                                      nameshops = _foundUsers[index]["shop"];
                                                                                                      int indexs = 0;
                                                                                                      for (String i in "${_foundUsers[index]["name"].toString()}".split("").toList()) {
                                                                                                        if (i == "-") {
                                                                                                          Config_G.namecustom_chossen = "${_foundUsers[index]["name"].toString()}".substring(0, indexs);
                                                                                                          Nicknames = "${_foundUsers[index]["name"].toString()}".substring(
                                                                                                            indexs + 1,
                                                                                                          );
                                                                                                        }
                                                                                                        indexs += 1;
                                                                                                      }
                                                                                                    });
                                                                                                  },
                                                                                                  child: BtnFilter(Content: "${_foundUsers[index]["name"].toString()}", Subcontent: '${_foundUsers[index]["shop"].toString()}', wights: MediaQuery.of(context).size.width / 1, heights: 50, colors: Colors.green.withOpacity(0.0), path: ""))),
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
                                                      BorderRadius.circular(
                                                          15.0),
                                                ),
                                                child: new Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      new Expanded(
                                                          child: new TextField(
                                                              decoration:
                                                                  InputDecoration(
                                                                hintText:
                                                                    "${Config_G.NameCustom_shop[indexchossen].nameshop[0]}",
                                                                labelText: Config_G
                                                                        .check_lang
                                                                    ? 'Tên Shop *'
                                                                    : 'Name Shop *',
                                                                labelStyle: TextStyle(
                                                                    color: Colors
                                                                        .green),
                                                                prefixIcon:
                                                                    Icon(
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
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              12.0)),
                                                                  borderSide: BorderSide(
                                                                      color: Colors
                                                                          .green,
                                                                      width: 2),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              10.0)),
                                                                  borderSide: BorderSide(
                                                                      color: Colors
                                                                          .green,
                                                                      width: 2),
                                                                ),
                                                              ),
                                                              onChanged: (v) {
                                                                print(v);
                                                              },
                                                              controller:
                                                                  _shop)),
                                                      new PopupMenuButton<
                                                          String>(
                                                        icon: const Icon(Icons
                                                            .arrow_drop_down),
                                                        onSelected:
                                                            (String value) {
                                                          print(value);
                                                          setState(() {
                                                            _shop..text = value;
                                                          });
                                                          indexshop = nameshops
                                                              .indexWhere(
                                                                  (indexhop) =>
                                                                      indexhop ==
                                                                      value);
                                                        },
                                                        itemBuilder:
                                                            (BuildContextcontext) {
                                                          return nameshops.map<
                                                                  PopupMenuItem<
                                                                      String>>(
                                                              (String value) {
                                                            return new PopupMenuItem(
                                                                child: new Text(
                                                                    value),
                                                                value: value);
                                                          }).toList();
                                                        },
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
                                                    controller: _code,
                                                    autocorrect: true,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          Config_G.check_lang
                                                              ? 'Mã hóa đơn *'
                                                              : 'Code Bill *',
                                                      labelStyle: TextStyle(
                                                          color: Colors.green),
                                                      prefixIcon: Icon(
                                                        Icons
                                                            .view_list_outlined,
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
                                                      decoration:
                                                          InputDecoration(
                                                        hintText: 'yyyy-MM-dd',
                                                        prefixIcon: Icon(
                                                          Icons
                                                              .calendar_today_sharp,
                                                          color: Colors.green,
                                                        ),
                                                        hintStyle: TextStyle(
                                                            color:
                                                                Colors.green),
                                                        filled: true,
                                                        fillColor:
                                                            Colors.white70,
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
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
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
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
                                                        DateTime? pickedDate =
                                                            await showDatePicker(
                                                                context:
                                                                    context,
                                                                initialDate:
                                                                    DateTime
                                                                        .now(),
                                                                firstDate: DateTime(
                                                                    2000), //DateTime.now() - not to allow to choose before today.
                                                                lastDate:
                                                                    DateTime(
                                                                        2101));
                                                        if (pickedDate !=
                                                            null) {
                                                          print(
                                                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                                          String formattedDate =
                                                              DateFormat(
                                                                      'yyyy-MM-dd')
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
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            primary: HexColor(
                                                                "#237401"), //background color of button
                                                            elevation:
                                                                3, //elevation of button
                                                            shape:
                                                                RoundedRectangleBorder(
                                                                    //to set border radius to button
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15)),
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 30,
                                                                    right: 30,
                                                                    top: 20,
                                                                    bottom:
                                                                        15) //content padding inside button
                                                            ),
                                                    onPressed: () {
                                                      if (_nameCustom
                                                              .text.isEmpty |
                                                          _shop.text.isEmpty |
                                                          _code.text.isEmpty |
                                                          dateinput
                                                              .text.isEmpty |
                                                          _money.text.isEmpty) {
                                                        Fluttertoast.showToast(
                                                            msg:
                                                                "Bạn cần điền đầy đủ thông tin",
                                                            toastLength: Toast
                                                                .LENGTH_SHORT,
                                                            gravity:
                                                                ToastGravity
                                                                    .CENTER,
                                                            timeInSecForIosWeb:
                                                                2,
                                                            backgroundColor:
                                                                Colors.red,
                                                            textColor:
                                                                Colors.white,
                                                            fontSize: 16.0);
                                                      } else {
                                                        Information_Bill
                                                            listmodelbill =
                                                            new Information_Bill();
                                                        listmodelbill
                                                                .namecustome =
                                                            _nameCustom.text;
                                                        listmodelbill.nameshop =
                                                            _shop.text;
                                                        listmodelbill.code =
                                                            _code.text;
                                                        listmodelbill.date =
                                                            dateinput.text;
                                                        listmodelbill.money =
                                                            _money.text;
                                                        listmodelbill.note =
                                                            _notes.text;
                                                        Config_G.modelBill
                                                            .add(listmodelbill);
                                                        Config_G
                                                            .modelBill.length;
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
                                                      }
                                                    },
                                                    child: Text(
                                                        Config_G.check_lang
                                                            ? 'Xác nhận'
                                                            : 'Confirm',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Poppins',
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
                                                    style: ElevatedButton
                                                        .styleFrom(
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
                                                                        BorderRadius.circular(
                                                                            15)),
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 30,
                                                                    right: 30,
                                                                    top: 20,
                                                                    bottom:
                                                                        15) //content padding inside button
                                                            ),
                                                    onPressed: () {
                                                      Fluttertoast.showToast(
                                                          msg: Config_G
                                                                  .check_lang
                                                              ? "Hủy bỏ giao dịch thành công "
                                                              : "Cancellation of successful transaction",
                                                          toastLength: Toast
                                                              .LENGTH_SHORT,
                                                          gravity: ToastGravity
                                                              .BOTTOM,
                                                          timeInSecForIosWeb: 2,
                                                          backgroundColor:
                                                              Colors.red,
                                                          textColor:
                                                              Colors.white,
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
                                                            fontFamily:
                                                                'Poppins',
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
                  )
                : Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.green,
                      title: Column(children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        W_Home()));
                                      },
                                      icon: Icon(
                                        Icons.arrow_back_ios_outlined,
                                        color: Colors.white,
                                      )),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width /
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
                        )
                      ]),
                    ),
                    body: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assest/background/bkr.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child: Text(
                              Config_G.check_lang
                                  ? "Không có dữ liệu"
                                  : "No data",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                              ),
                            ))
                          ],
                        )))));
  }
}
