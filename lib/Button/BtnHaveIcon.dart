import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BtnHaveIcon extends StatelessWidget {
  const BtnHaveIcon({
    required this.colors,
    required this.heights,
    required this.wights,
    required this.path,
    required this.Content,
    required this.Subcontent,
    Key? key,
  }) : super(key: key);
  final Color colors;
  final double heights;
  final double wights;
  final String path;
  final String Content;
  final String Subcontent;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
          Container(
            height: heights,
            width: wights,
            child: Container(
              // margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: colors,
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Container(
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(color: Colors.green),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                          ),
                          height: 50,
                          width: 45,
                          child: Container(
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                border: Border.all(color: Colors.green),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomLeft: Radius.circular(15),
                                ),
                              ),
                              child: SvgPicture.asset(path)),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      Content,
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 17,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      Subcontent,
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 9.8,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.green,
                          size: 20,
                        )
                      ],
                    ))),
          ),
        ]));
  }
}
