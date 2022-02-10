import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OptionBtn extends StatelessWidget {
  const OptionBtn({
    required this.colors,
    required this.path,
    required this.heights,
    required this.wights,
    required this.namebtn,
    Key? key,
  }) : super(key: key);
  final Color colors;
  final String path;
  final double heights;
  final double wights;
  final String namebtn;
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
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Container(
                child: Center(
              child: SvgPicture.asset(path),
            ))),
      ),
      SizedBox(
        height: 10,
        width: 10,
      ),
      Text(
        namebtn,
        style: TextStyle(
            fontSize: 12, color: Colors.white, fontWeight: FontWeight.w600),
      )
    ]));
  }
}
