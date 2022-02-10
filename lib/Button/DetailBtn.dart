import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailBtn extends StatelessWidget {
  const DetailBtn({
    required this.colors,
    required this.heights,
    required this.wights,
    Key? key,
  }) : super(key: key);
  final Color colors;
  final double heights;
  final double wights;
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
              padding: EdgeInsets.only(left: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "CHI TIẾT",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.green,
                  size: 15,
                )
              ],
            ))),
      ),
    ]));
  }
}
