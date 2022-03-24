import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vl_ui/DartJs/FuntionsAction.dart';

class BtnFilter_own_shop extends StatelessWidget {
  const BtnFilter_own_shop({
    required this.colors,
    required this.heights,
    required this.wights,
    required this.path,
    required this.Content,
    required this.Subcontent,
    required this.lenght,
    Key? key,
  }) : super(key: key);
  final Color colors;
  final double heights;
  final double wights;
  final String path;
  final String Content;
  final String Subcontent;
  final String lenght;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        height: heights,
        width: wights,
        child: Container(
            decoration: BoxDecoration(
              color: colors,
              border: Border.all(color: Colors.green),
            ),
            child: Center(
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 25,
                    ),
                    Text(
                      Content,
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 17,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Center(
                        child: Text(
                      " : ",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 17,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                    Center(
                      child: Text(
                        ActionJS.splitString(Subcontent),
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 17,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            left: 10, top: 2, bottom: 2, right: 3),
                        height: heights,
                        width: wights / 3,
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.green),
                            filled: true,
                            fillColor: Colors.white70,
                            disabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                              borderSide:
                                  BorderSide(color: Colors.green, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.green, width: 2),
                            ),
                          ),
                        ))
                  ],
                ),

            )),
      ),
    ]));
  }
}
