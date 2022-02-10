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

class W_SignUpshop extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return W_SignUp();
  }
}

class W_SignUp extends State {
  late String _Name = '';
  final TextEditingController _NaneShop = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _Note = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  List<DropdownMenuItem<Object>> ListCustom = [];

  @override
  void initState() {
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assest/background/bkapps.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 14,
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
                                        type: PageTransitionType.rightToLeft,
                                        duration: Duration(
                                            milliseconds:
                                                Config_G.timeDruation),
                                        reverseDuration: Duration(
                                            milliseconds:
                                                Config_G.timeDruation),
                                        child: W_login()));
                              },
                            ),
                          ],
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Config_G.title_SignupShop_vi,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                  fontSize:
                                      MediaQuery.of(context).size.height / 30),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 25,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: DropdownButtonFormField(
                                icon: Icon(
                                    Icons.arrow_drop_down_circle_outlined,
                                    color: Colors.black54),
                                onChanged: (v) {},
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.green, width: 1.5)),
                                  labelText: "Đại diên/Tên khách hàng",
                                ),
                                items: ListCustom,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _NaneShop,
                                decoration: InputDecoration(
                                    labelText: "Nhập tên shop",
                                    fillColor: Colors.green,
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.green))),
                              ),
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _address,
                                decoration: InputDecoration(
                                    labelText: "Địa chỉ",
                                    fillColor: Colors.green,
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.green))),
                              ),
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextFormField(

                                controller: _Note,
                                decoration: InputDecoration(
                                    labelText: "Mô tả",
                                    fillColor: Colors.green,
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.green))),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 40,
                        ),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: IntlPhoneField(
                                    controller: _phone,
                                    decoration: InputDecoration(
                                        labelText: 'Phone Number',
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.green))),
                                    initialCountryCode: 'GB',
                                    onChanged: (phone) {},
                                  ))
                            ]),
                        Expanded(
                            child: Center(
                                child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: HexColor("#237401"),
                              //background color of button
                              elevation: 3,
                              //elevation of button
                              shape: RoundedRectangleBorder(
                                  //to set border radius to button
                                  borderRadius: BorderRadius.circular(15)),
                              padding: EdgeInsets.only(
                                  left: 30,
                                  right: 30,
                                  top: 15,
                                  bottom: 15) //content padding inside button
                              ),
                          onPressed: () {
                            if(_phone.text.isEmpty|_address.text.isEmpty|_NaneShop.text.isEmpty|_Note.text.isEmpty){
                              Fluttertoast.showToast(
                                  msg:
                                  "Chưa nhập đủ thông tin.",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 2,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);

                            }else{
                              Fluttertoast.showToast(
                                  msg:
                                  "Thêm thông tin shop thành công.",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 2,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              Information_Shop s2 = new Information_Shop();
                              s2.nameshop = _NaneShop.text;
                              s2.telephone = _phone.text;
                              s2.address =_address.text;
                              Config_G.NameShop.add(s2);
                              Navigator.pop(context);
                            }
                          },
                          child: const Text('Đồng ý',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20)),
                        ))),
                        Expanded(
                            child: TextButton(
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
                        )),
                        Expanded(
                            child: SizedBox(
                          height: MediaQuery.of(context).size.height / 10,
                        )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
