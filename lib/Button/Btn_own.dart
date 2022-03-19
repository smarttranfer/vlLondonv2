import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vl_ui/DartJs/FuntionsAction.dart';

class BtnFilter_own extends StatelessWidget {
  const BtnFilter_own({
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
                child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(color: Colors.green),
                  ),
                  height: 50,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width/25,
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
                    Center(
                      child: Text(
                        "(${ActionJS.splitString(lenght)})",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 10,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ))),
      ),
    ]));
  }
}
