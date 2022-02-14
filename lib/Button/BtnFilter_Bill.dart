import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BtnFilter_Bills extends StatelessWidget {
  const BtnFilter_Bills({
    required this.colors,
    required this.heights,
    required this.wights,
    required this.path,
    required this.Content,
    required this.Subcontent,
    required this.date,
    required this.money,
    required this.code,
    Key? key,
  }) : super(key: key);
  final Color colors;
  final double heights;
  final double wights;
  final String path;
  final String Content;
  final String Subcontent;
  final String date;
  final String money;
  final String code;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      Container(
        height: heights,
        width: wights,
        child: Container(
            decoration: BoxDecoration(
              color: colors,
              border: Border.all(color: Colors.green),
            ),
            child: Container(
                child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(color: Colors.green),
                  ),
                  height: 70,
                  width: 45,
                  child: Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border.all(color: Colors.green),
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 20,
                      )),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 2,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              Row(children: [
                                Column(children: [
                                  Center(
                                      child: Text(
                                        date,
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 17,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Center(
                                      child: Text(
                                        Content,
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 17,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                  Center(
                                    child: Text(
                                      Subcontent,
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 17,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  )
                                ],),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.all(Radius.circular(20))),
                                  height: 50,
                                  width: 3,
                                  margin: EdgeInsets.only(left: 10, right: 5),
                                ),
                                Center(
                                  child: Text(
                                    "${money }",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 17,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),  Icon(
                                  Icons.euro,
                                  color: Colors.green,
                                  size: 17,
                                ),

                              ],),



                          ],
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 5,
                ),
              ],
            ))),
      ),
    ]));
  }
}
