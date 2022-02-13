import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:vl_ui/Button/BtnFilter.dart';
import 'package:vl_ui/Globle/Config_G.dart';
import 'package:vl_ui/Widget/W_Login.dart';
import 'package:vl_ui/model/CheckSameCustome.dart';
import 'package:vl_ui/model/Information_Cutome.dart';
import 'package:vl_ui/model/Information_Shop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:page_transition/page_transition.dart';

import 'Filter.dart';

class W_SignUpshop extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return W_SignUp();
  }
}

class W_SignUp extends State {
  final TextEditingController _NaneShop = TextEditingController();
  final TextEditingController _numberlocal = TextEditingController();
  final TextEditingController _stresst = TextEditingController();
  final TextEditingController _postcode = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _nameCustom = TextEditingController();
  final List<Map<String, dynamic>> _allUsers = [];
  List<Map<String, dynamic>> _foundUsers = [];
  String Nicknames = '';
  @override
  initState() {
    int k = 1;
    for (Information_Cutome i in Config_G.NameCustom_shop) {
      _allUsers.add({
        "id": "${k}",
        "name": "${i.namecustome}-${i.Nickname}",
        "shop": "${i.nameshop}"
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
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 5),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: ListView(shrinkWrap: true, children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          Config_G.title_SignupShop_vi,
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.green,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  30),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              25,
                                    ),
                                    Card(
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: TextField(
                                            controller: _nameCustom
                                              ..text = Config_G
                                                      .check_namecustom_chossen
                                                  ? ""
                                                  : Config_G.namecustom_chossen,
                                            decoration: InputDecoration(
                                              labelText: 'Tên chủ khách hàng *',
                                              labelStyle: TextStyle(
                                                  color:
                                                  Colors.green
                                              ),
                                              prefixIcon: Icon(
                                                Icons
                                                    .supervised_user_circle_outlined,
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
                                                                topRight: Radius
                                                                    .circular(
                                                                        20.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        20.0)),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              blurRadius: 7.0,
                                                              color:
                                                                  Colors.black)
                                                        ]),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      child: Column(
                                                        children: [
                                                          const SizedBox(
                                                            height: 20,
                                                          ),
                                                          TextField(
                                                            onChanged:
                                                                (value) =>
                                                                    _runFilter(
                                                                        value),
                                                            decoration:
                                                                const InputDecoration(
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
                                                                        BorderRadius.all(
                                                                            Radius.circular(20))),
                                                                height: 3,
                                                                width: 20,
                                                                margin: EdgeInsets
                                                                    .only(
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
                                                                  fontSize: 20,
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
                                                                        BorderRadius.all(
                                                                            Radius.circular(20))),
                                                                height: 3,
                                                                width: 20,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            20,
                                                                        right:
                                                                            20),
                                                              ),
                                                            ],
                                                          ),
                                                          Expanded(
                                                            child: _foundUsers
                                                                    .isNotEmpty
                                                                ? ListView
                                                                    .builder(
                                                                        itemCount:
                                                                            _foundUsers
                                                                                .length,
                                                                        itemBuilder: (context,
                                                                                index) =>
                                                                            Card(
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
                                                                                          int indexs =0;
                                                                                          for(String i in "${_foundUsers[index]["name"].toString()}".split("").toList()){
                                                                                            if(i=="-"){
                                                                                              Config_G.namecustom_chossen = "${_foundUsers[index]["name"].toString()}".substring(0,indexs);
                                                                                              Nicknames = "${_foundUsers[index]["name"].toString()}".substring(indexs+1,);
                                                                                            }
                                                                                            indexs+=1;
                                                                                          }
                                                                                          
                                                                                        });
                                                                                      },
                                                                                      child: BtnFilter(Content: "${_foundUsers[index]["name"].toString()}", Subcontent: '${_foundUsers[index]["shop"].toString()}', wights: MediaQuery.of(context).size.width / 1, heights: 50, colors: Colors.green.withOpacity(0.0), path: ""))),
                                                                            ))
                                                                : const Text(
                                                                    'Không tìm thấy kết quả',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            24,
                                                                        color: Colors
                                                                            .green),
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
                                          labelText: 'Tên Shop*',
                                          labelStyle: TextStyle(
                                              color:
                                              Colors.green
                                          ),
                                          prefixIcon: Icon(
                                            Icons.shopping_cart_outlined,
                                            color: Colors.green,
                                          ),
                                          hintStyle:
                                              TextStyle(color: Colors.green),
                                          filled: true,
                                          fillColor: Colors.white70,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            borderSide: BorderSide(
                                                color: Colors.green, width: 2),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            borderSide: BorderSide(
                                                color: Colors.green, width: 2),
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
                                          labelText: 'Số tòa nhà*',
                                          labelStyle: TextStyle(
                                              color:
                                              Colors.green
                                          ),
                                          prefixIcon: Icon(
                                            Icons.location_on_outlined,
                                            color: Colors.green,
                                          ),
                                          hintStyle:
                                              TextStyle(color: Colors.green),
                                          filled: true,
                                          fillColor: Colors.white70,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            borderSide: BorderSide(
                                                color: Colors.green, width: 2),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            borderSide: BorderSide(
                                                color: Colors.green, width: 2),
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
                                          labelText: 'Tên Đường*',
                                          labelStyle: TextStyle(
                                              color:
                                              Colors.green
                                          ),
                                          prefixIcon: Icon(
                                            Icons.add_road,
                                            color: Colors.green,
                                          ),
                                          hintStyle:
                                              TextStyle(color: Colors.green),
                                          filled: true,
                                          fillColor: Colors.white70,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            borderSide: BorderSide(
                                                color: Colors.green, width: 2),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            borderSide: BorderSide(
                                                color: Colors.green, width: 2),
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
                                          labelText: 'Post Code*',
                                          labelStyle: TextStyle(
                                              color:
                                              Colors.green
                                          ),
                                          prefixIcon: Icon(
                                            Icons.code_off_outlined,
                                            color: Colors.green,
                                          ),
                                          hintStyle:
                                              TextStyle(color: Colors.green),
                                          filled: true,
                                          fillColor: Colors.white70,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            borderSide: BorderSide(
                                                color: Colors.green, width: 2),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            borderSide: BorderSide(
                                                color: Colors.green, width: 2),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              40,
                                    ),
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                              flex: 2,
                                              child: IntlPhoneField(
                                                controller: _phone,
                                                decoration: InputDecoration(
                                                    labelText: 'Phone Number',
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Colors
                                                                    .green))),
                                                initialCountryCode: 'GB',
                                                onChanged: (phone) {},
                                              ))
                                        ]),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: HexColor("#237401"),
                                          //background color of button
                                          elevation: 3,
                                          //elevation of button
                                          shape: RoundedRectangleBorder(
                                              //to set border radius to button
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          padding: EdgeInsets.only(
                                              left: 30,
                                              right: 30,
                                              top: 15,
                                              bottom:
                                                  15) //content padding inside button
                                          ),
                                      onPressed: () {
                                        if (_phone.text.isEmpty |
                                            _numberlocal.text.isEmpty |
                                            _stresst.text.isEmpty |
                                            _postcode.text.isEmpty |
                                            _NaneShop.text.isEmpty
                                            ) {
                                          Fluttertoast.showToast(
                                              msg: "Chưa nhập đủ thông tin.",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.CENTER,
                                              timeInSecForIosWeb: 2,
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                        } else {
                                          Fluttertoast.showToast(
                                              msg:
                                                  "Thêm thông tin shop thành công.",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.CENTER,
                                              timeInSecForIosWeb: 2,
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                          Information_Cutome s2 =
                                              new Information_Cutome();
                                          s2.nameshop = _NaneShop.text;
                                          s2.telephone = _phone.text;
                                          s2.stresst = _stresst.text;
                                          s2.Postcodet = _postcode.text;
                                          s2.numberlocal = _numberlocal.text;
                                          s2.namecustome = _nameCustom.text;
                                          s2.Nickname = Nicknames;
                                          Config_G.NameCustom_shop.add(s2);
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: const Text('Đồng ý',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 20)),
                                    ),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        textStyle: const TextStyle(
                                            fontSize: 15, color: Colors.green),
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        'Designed & Powered by Vihu.uk',
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              10,
                                    ),
                                  ],
                                ),
                              ])),
                        )
                      ],
                    ),
                  ),
                ))));
  }
}
