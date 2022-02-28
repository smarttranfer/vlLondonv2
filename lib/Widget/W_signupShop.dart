import 'dart:convert';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:vl_ui/Button/BtnFilter.dart';
import 'package:vl_ui/DartJs/FuntionsAction.dart';
import 'package:vl_ui/Globle/Config_G.dart';
import 'package:vl_ui/Widget/W_Login.dart';
import 'package:vl_ui/model/Information_Cutome.dart';
import 'package:vl_ui/model/Information_Shop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;

class W_SignUpshop extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return W_SignUp_shopo();
  }
}

class W_SignUp_shopo extends State {
  final TextEditingController _NaneShop = TextEditingController();
  final TextEditingController _numberlocal = TextEditingController();
  final TextEditingController _stresst = TextEditingController();
  final TextEditingController _postcode = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _nameCustom = TextEditingController();
  final List<Map<String, dynamic>> _allUsers = [];
  List<Map<String, dynamic>> _foundUsers = [];
  static bool checkdone_send_shop = false;
  bool check_loding_data = true;
  String Nicknames = '';
  int customer_id = 0;
  @override
  initState() {
    super.initState();
    Config_G.NameCustom_shop.clear();
    asyncMethod();
  }

  void asyncMethod() async {
    await GetInformation();
    for (Information_Cutome i in Config_G.NameCustom_shop) {
      if (i.nameshop.length > 0) {
        _allUsers.add({
          "customer_id": i.id,
          "name": "${i.namecustome}",
          "phone": "${i.telephone}"
        });
      } else {
        _allUsers.add({
          "customer_id": i.id,
          "name": "${i.namecustome}",
          "phone": "${i.telephone}"
        });
      }
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
            if(shop["phone"] == null){
              s0.telephone = "";
            }else{
              s0.telephone = shop["phone"];
            }
            // s0.telephone = shop["phone"];
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

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 5),
            child: GestureDetector(
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                },
                child: Container(
                    padding: EdgeInsets.only(bottom: 2),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assest/background/bkapps.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: ListView(shrinkWrap: true, children: [
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              35,
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              icon: Icon(Icons.arrow_back_ios),
                                              splashColor: Colors.green,
                                              color: Colors.white,
                                              iconSize: 40,
                                              onPressed: () {
                                                Navigator.pop(
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
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              (MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  25),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              Config_G.check_lang
                                                  ? "Đăng Ký Shop"
                                                  : "Register Shop",
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          30),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              (MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  25),
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
                                                      flex: 2,
                                                      child: Center(
                                                          child: IntlPhoneField(
                                                        controller: _phone,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText: Config_G
                                                                  .check_lang
                                                              ? 'Số Điện Thoại *'
                                                              : 'Phone Number *',
                                                          prefixIcon: Icon(
                                                            Icons
                                                                .phone_iphone_outlined,
                                                            color: Colors.green,
                                                          ),
                                                          hintStyle: TextStyle(
                                                              color:
                                                                  Colors.green),
                                                          filled: true,
                                                          fillColor:
                                                              Colors.white70,
                                                          enabledBorder:
                                                              UnderlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        12.0)),
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .green,
                                                                    width: 2),
                                                          ),
                                                          focusedBorder:
                                                              UnderlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        10.0)),
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .green,
                                                                    width: 2),
                                                          ),
                                                        ),
                                                        initialCountryCode:
                                                            'GB',
                                                        onChanged: (phone) {
                                                          print(phone
                                                              .completeNumber);
                                                        },
                                                      )))
                                                ])),
                                        Card(
                                            elevation: 10,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            child: TextField(
                                                controller: _nameCustom,
                                                decoration: InputDecoration(
                                                  labelText: Config_G.check_lang
                                                      ? 'Tên chủ khách hàng *'
                                                      : 'Customer owner name *',
                                                  labelStyle: TextStyle(
                                                      color: Colors.green),
                                                  prefixIcon: Icon(
                                                    Icons
                                                        .supervised_user_circle_outlined,
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
                                                  return showBarModalBottomSheet(
                                                    expand: Config_G
                                                        .check_namecustom_chossen,
                                                    context: context,
                                                    builder: (context) {
                                                      return Container(
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius.only(
                                                                    topRight: Radius.circular(20.0),
                                                                    topLeft: Radius.circular(20.0)),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                  blurRadius:
                                                                      7.0,
                                                                  color: Colors
                                                                      .black)
                                                            ]),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10),
                                                          child: Column(
                                                            children: [
                                                              const SizedBox(
                                                                height: 20,
                                                              ),
                                                              TextField(
                                                                onChanged: (value) =>
                                                                    _runFilter(
                                                                        value),
                                                                decoration: const InputDecoration(
                                                                    labelText:
                                                                        'Search',
                                                                    suffixIcon:
                                                                        Icon(Icons
                                                                            .search)),
                                                              ),
                                                              const SizedBox(
                                                                height: 20,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Container(
                                                                    decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .green,
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(20))),
                                                                    height: 3,
                                                                    width: 20,
                                                                    margin: EdgeInsets.only(
                                                                        left:
                                                                            20,
                                                                        right:
                                                                            20),
                                                                  ),
                                                                  Text(
                                                                    "Result",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .green,
                                                                      fontSize:
                                                                          20,
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .green,
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(20))),
                                                                    height: 3,
                                                                    width: 20,
                                                                    margin: EdgeInsets.only(
                                                                        left:
                                                                            20,
                                                                        right:
                                                                            20),
                                                                  ),
                                                                ],
                                                              ),
                                                              check_loding_data
                                                                  ? Center(
                                                                      child:
                                                                          FutureBuilder(
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          if (snapshot
                                                                              .hasData) {
                                                                            for (Information_Cutome i
                                                                                in Config_G.NameCustom_shop) {
                                                                              print(i.id);
                                                                            }
                                                                          } else if (snapshot
                                                                              .hasError) {
                                                                            return Text("${snapshot.error}");
                                                                          }
                                                                          // By default, show a loading spinner
                                                                          return CircularProgressIndicator(
                                                                            color:
                                                                                Colors.green,
                                                                          );
                                                                        },
                                                                      ),
                                                                    )
                                                                  : Expanded(
                                                                      child: _foundUsers
                                                                              .isNotEmpty
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
                                                                                                _nameCustom..text = "${_foundUsers[index]["name"].toString()}";
                                                                                                customer_id = _foundUsers[index]["customer_id"];
                                                                                              });
                                                                                            },
                                                                                            child: BtnFilter(Content: "${_foundUsers[index]["name"].toString()}", Subcontent: '${_foundUsers[index]["phone"]}', wights: MediaQuery.of(context).size.width / 1, heights: 50, colors: Colors.green.withOpacity(0.0), path: ""))),
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
                                        Card(
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: TextFormField(
                                            controller: _NaneShop,
                                            decoration: InputDecoration(
                                              labelText: Config_G.check_lang
                                                  ? 'Tên Shop*'
                                                  : 'Shop Name*',
                                              labelStyle: TextStyle(
                                                  color: Colors.green),
                                              prefixIcon: Icon(
                                                Icons.shopping_cart_outlined,
                                                color: Colors.green,
                                              ),
                                              hintStyle: TextStyle(
                                                  color: Colors.green),
                                              filled: true,
                                              fillColor: Colors.white70,
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(12.0)),
                                                borderSide: BorderSide(
                                                    color: Colors.green,
                                                    width: 2),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0)),
                                                borderSide: BorderSide(
                                                    color: Colors.green,
                                                    width: 2),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Card(
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: TextFormField(
                                            controller: _numberlocal,
                                            decoration: InputDecoration(
                                              labelText: Config_G.check_lang
                                                  ? 'Số tòa nhà*'
                                                  : 'Building number*',
                                              labelStyle: TextStyle(
                                                  color: Colors.green),
                                              prefixIcon: Icon(
                                                Icons.location_on_outlined,
                                                color: Colors.green,
                                              ),
                                              hintStyle: TextStyle(
                                                  color: Colors.green),
                                              filled: true,
                                              fillColor: Colors.white70,
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(12.0)),
                                                borderSide: BorderSide(
                                                    color: Colors.green,
                                                    width: 2),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0)),
                                                borderSide: BorderSide(
                                                    color: Colors.green,
                                                    width: 2),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Card(
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: TextFormField(
                                            controller: _stresst,
                                            decoration: InputDecoration(
                                              labelText: Config_G.check_lang
                                                  ? 'Tên Đường*'
                                                  : "'Street names*'",
                                              labelStyle: TextStyle(
                                                  color: Colors.green),
                                              prefixIcon: Icon(
                                                Icons.add_road,
                                                color: Colors.green,
                                              ),
                                              hintStyle: TextStyle(
                                                  color: Colors.green),
                                              filled: true,
                                              fillColor: Colors.white70,
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(12.0)),
                                                borderSide: BorderSide(
                                                    color: Colors.green,
                                                    width: 2),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0)),
                                                borderSide: BorderSide(
                                                    color: Colors.green,
                                                    width: 2),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Card(
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: TextFormField(
                                            controller: _postcode,
                                            decoration: InputDecoration(
                                              labelText: Config_G.check_lang
                                                  ? 'Post Code*'
                                                  : 'Post Code*',
                                              labelStyle: TextStyle(
                                                  color: Colors.green),
                                              prefixIcon: Icon(
                                                Icons.code_off_outlined,
                                                color: Colors.green,
                                              ),
                                              hintStyle: TextStyle(
                                                  color: Colors.green),
                                              filled: true,
                                              fillColor: Colors.white70,
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(12.0)),
                                                borderSide: BorderSide(
                                                    color: Colors.green,
                                                    width: 2),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0)),
                                                borderSide: BorderSide(
                                                    color: Colors.green,
                                                    width: 2),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              40,
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary: HexColor("#237401"),
                                              elevation: 3,
                                              //elevation of button
                                              shape: RoundedRectangleBorder(
                                                  //to set border radius to button
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              padding: EdgeInsets.only(
                                                  left: 30,
                                                  right: 30,
                                                  top: 15,
                                                  bottom:
                                                      15) //content padding inside button
                                              ),
                                          onPressed: () async {
                                            if (_phone.text.isEmpty |
                                                _numberlocal.text.isEmpty |
                                                _stresst.text.isEmpty |
                                                _postcode.text.isEmpty |
                                                _NaneShop.text.isEmpty) {
                                              Fluttertoast.showToast(
                                                  msg: Config_G.check_lang
                                                      ? "Chưa nhập đủ thông tin."
                                                      : "Not enough information has been entered.",
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.CENTER,
                                                  timeInSecForIosWeb: 2,
                                                  backgroundColor: Colors.red,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0);
                                            } else {
                                              await ActionJS.Signshope(
                                                  _phone.text,
                                                  _NaneShop.text,
                                                  _numberlocal.text,
                                                  _stresst.text,
                                                  _postcode.text,
                                                  customer_id);
                                              if (checkdone_send_shop == true) {
                                                Fluttertoast.showToast(
                                                    msg: Config_G.check_lang
                                                        ? "Thêm thông tin shop thành công."
                                                        : "Add successful shop information.",
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.BOTTOM,
                                                    timeInSecForIosWeb: 10,
                                                    backgroundColor:
                                                        Colors.green,
                                                    textColor: Colors.white,
                                                    fontSize: 16.0);
                                                Navigator.pop(context);
                                              } else {
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        title: Text(Config_G
                                                                .check_lang
                                                            ? "Thông báo hệ thống"
                                                            : "System Notifications"),
                                                        content: Text(Config_G
                                                                .check_lang
                                                            ? 'Tính năng đang bảo trì !'
                                                            : 'Feature under maintenance!'),
                                                        actions: <Widget>[
                                                          FlatButton(
                                                            child: Text(Config_G
                                                                    .check_lang
                                                                ? "Hủy bỏ"
                                                                : "CANCEL"),
                                                            onPressed: () {
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
                                                    msg: Config_G.check_lang
                                                        ? "${json.decode(Config_G.check_done_reshop)["data"]} ${json.decode(Config_G.check_done_reshop)["message"]}"
                                                        : "${json.decode(Config_G.check_done_reshop)["data"]} ${json.decode(Config_G.check_done_reshop)["message"]}",
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.BOTTOM,
                                                    timeInSecForIosWeb: 10,
                                                    backgroundColor: Colors.red,
                                                    textColor: Colors.white,
                                                    fontSize: 16.0);
                                              }
                                            }
                                          },
                                          child: Text(
                                              Config_G.check_lang
                                                  ? 'Đồng ý'
                                                  : 'Confirm',
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: 20)),
                                        ),
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            textStyle: const TextStyle(
                                                fontSize: 15,
                                                color: Colors.green),
                                          ),
                                          onPressed: () {},
                                          child: Text(
                                            Config_G.check_lang
                                                ? 'Thiết kế & Vận hàn bởi Vihu.uk'
                                                : 'Designed & Powered by Vihu.uk',
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              10,
                                        ),
                                      ],
                                    ),
                                  ])),
                            )
                          ],
                        ),
                      ),
                    )))));
  }
}
