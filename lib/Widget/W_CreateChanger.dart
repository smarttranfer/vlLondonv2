import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vl_ui/Globle/Config_G.dart';
import 'package:vl_ui/model/Information_Cutome.dart';
import 'package:vl_ui/model/Information_Shop.dart';
import 'package:vl_ui/model/ModelCustome.dart';
import 'package:vl_ui/model/New_Changer.dart';

class W_CreateChange extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CreateChange();
  }
}

class CreateChange extends State {
  late String _Name = '';
  late String _names = "";
  late String _shop = "";
  TextEditingController dateinput = TextEditingController();
  TextEditingController _code = TextEditingController();
  TextEditingController _money = TextEditingController();
  TextEditingController _notes = TextEditingController();
  List<DropdownMenuItem<Object>> ListCustom = [];
  List<DropdownMenuItem<Object>> ListShop = [];

  @override
  void initState() {
    _names = "";
    _shop = "";
    dateinput.text = "";
    for (Information_Shop name in Config_G.NameShop) {
      ListShop.add(
        DropdownMenuItem(
          child: InkWell(
              onTap: () {
                setState(() {
                  _Name = name.nameshop;
                });
              },
              child: Text(
                "${name.nameshop}",
              )),
          value: "${name.nameshop}",
        ),
      );
      super.initState();
    }
    for (Information_Cutome name in Config_G.NameCustom) {
      ListCustom.add(
        DropdownMenuItem(
          child: InkWell(
              onTap: () {
                setState(() {
                  _Name = name.namecustome;
                });
              },
              child: Text(
                "${name.namecustome}",
              )),
          value: "${name.namecustome}",
        ),
      );
      super.initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Bill>(
        create: (context) => Bill(),
        child: Builder(builder: (context) {
          return Scaffold(
              resizeToAvoidBottomInset: true,
              body: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assest/background/bkr.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Consumer<Bill>(builder: (context, provider, child) {
                    return SingleChildScrollView(
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
                                                Navigator.pop(context);
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
                                            "TẠO GIAO DỊCH MỚI",
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
                                    height: MediaQuery.of(context).size.height /
                                        1.1,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
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
                                              "THÔNG TIN GIAO DỊCH",
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
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
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
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
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
                                                Text(
                                                  "ĐẠI DIỆN QUẢN LÝ",
                                                  style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 15,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),

                                            Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                ),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child:
                                                          DropdownButtonFormField(
                                                        icon: Icon(
                                                            Icons
                                                                .arrow_drop_down_circle_outlined,
                                                            color:
                                                                Colors.black54),
                                                        onChanged: (v) {
                                                          setState(() {
                                                            _names =
                                                                v.toString();
                                                          });
                                                        },
                                                        decoration:
                                                            InputDecoration(
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              12.0)),
                                                                  borderSide: const BorderSide(
                                                                      color: Colors
                                                                          .green,
                                                                      width:
                                                                          2.0),
                                                                ),
                                                                labelText:
                                                                    "Đại Diện Khách Hàng",
                                                                labelStyle: TextStyle(
                                                                    color: Colors
                                                                        .green)),
                                                        items: ListCustom,
                                                      ),
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
                                                Text(
                                                  "TÊN SHOP",
                                                  style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 15,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),

                                            Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                ),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child:
                                                          DropdownButtonFormField(
                                                        icon: Icon(
                                                            Icons
                                                                .arrow_drop_down_circle_outlined,
                                                            color:
                                                                Colors.black54),
                                                        onChanged: (v) {
                                                          setState(() {
                                                            _shop =
                                                                v.toString();
                                                          });
                                                        },
                                                        decoration:
                                                            InputDecoration(
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              12.0)),
                                                                  borderSide: const BorderSide(
                                                                      color: Colors
                                                                          .green,
                                                                      width:
                                                                          2.0),
                                                                ),
                                                                labelText:
                                                                    "TÊN SHOP",
                                                                labelStyle: TextStyle(
                                                                    color: Colors
                                                                        .green)),
                                                        items: ListShop,
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                            // --------------------------------------------------------------
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      25,
                                                ),
                                                Text(
                                                  "TÊN HÓA ĐƠN/MÃ HÓA ĐƠN",
                                                  style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 15,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Card(
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
                                                    hintText: 'ABC 123',
                                                    prefixIcon: Icon(
                                                      Icons.view_list_outlined,
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
                                                )),
                                            // -----------------------------------------------------------
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      25,
                                                ),
                                                Text(
                                                  "NGÀY TẠO",
                                                  style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 15,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Card(
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
                                                      hintText: 'yyyy-MM-dd',
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
                                                    })),
                                            // ---------------------------------------------
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      25,
                                                ),
                                                Text(
                                                  "SỐ TIỀN NỢ",
                                                  style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 15,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                ),
                                                child: TextField(
                                                  controller: _money,
                                                  autocorrect: true,
                                                  decoration: InputDecoration(
                                                    hintText: '100.000',
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
                                                )),
                                            // ---------------------------------------------------------------------
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      25,
                                                ),
                                                Text(
                                                  "NỘI DUNG",
                                                  style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 15,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Card(
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
                                                    hintText:
                                                        'Adc123-Abc123-Abc123',
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
                                                )),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Card(
                                                    elevation: 10,
                                                    shape:
                                                        RoundedRectangleBorder(
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
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 30,
                                                                      right: 30,
                                                                      top: 20,
                                                                      bottom:
                                                                          15) //content padding inside button
                                                              ),
                                                      onPressed: () {
                                                        if (_names.isEmpty |
                                                            _shop.isEmpty |
                                                            _code.text.isEmpty |
                                                            dateinput
                                                                .text.isEmpty |
                                                            _money
                                                                .text.isEmpty |
                                                            _notes
                                                                .text.isEmpty) {
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
                                                          provider.addBill(
                                                              _names,
                                                              _shop,
                                                              _code.text,
                                                              dateinput.text,
                                                              _money.text,
                                                              _notes.text);
                                                          Fluttertoast.showToast(
                                                              msg:
                                                                  "Tạo giao dịch thành công",
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
                                                        }
                                                      },
                                                      child: Text('Xác nhận',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white,
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
                                                    shape:
                                                        RoundedRectangleBorder(
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
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 30,
                                                                      right: 30,
                                                                      top: 20,
                                                                      bottom:
                                                                          15) //content padding inside button
                                                              ),
                                                      onPressed: () {
                                                        Fluttertoast.showToast(
                                                            msg:
                                                                "Hủy bỏ giao dịch thành công ",
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
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text('Loại bỏ ',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white,
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
                    );
                  })));
        }));
  }
}
