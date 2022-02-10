import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class W_ManagerBill extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ManagerBill();
  }
}

class ManagerBill extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assest/background/bkr.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Container(
              child: Column(
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 15),
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
                                width: MediaQuery.of(context).size.width / 10),
                            Text(
                              "DANH SÁCH HÓA ĐƠN",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 14),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 100,
                  ),
                  Text(
                    "SHOP 1",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 100,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green),
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      margin: EdgeInsets.only(left: 10, right: 10),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 1.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 40,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 21,
                              ),
                              SvgPicture.asset(
                                  "assest/background/inforlist.svg"),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 40,
                              ),
                              Text(
                                "THÔNG TIN DANH SÁCH HÓA ĐƠN",
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
                            height: MediaQuery.of(context).size.height / 50,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            height: 1,
                            margin: EdgeInsets.only(left: 20, right: 20),
                          ),
                          Container(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [],
                              ),
                            ),
                          )
                        ],
                      )),
                ],
              ),
            )));
  }
}
