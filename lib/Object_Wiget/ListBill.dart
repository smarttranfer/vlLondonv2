import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:vl_ui/DartJs/FuntionsAction.dart';
import 'package:vl_ui/Globle/Config_G.dart';
import 'package:vl_ui/model/ModelCustome.dart';

class ListViewsBill extends StatelessWidget {
  const ListViewsBill({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Bill>(
        create: (context) => Bill(),
        child: Builder(builder: (context) {
          return Consumer<Bill>(builder: (context, provider, child) {
            return ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: ActionJS.show_transation(Config_G.modelBill.length),
                itemBuilder: (BuildContext context, int index) {
                  return Row(children: [
                    Flexible(
                        child: Card(
                            elevation: 50,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            shadowColor: Colors.black54,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 2),
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(left: 2),
                                                  height: 50,
                                                  width: 50,
                                                  child: SvgPicture.asset(
                                                    "assest/IconBtn/contacts.svg",
                                                  ),
                                                )),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  25,
                                            ),
                                            Row(children: [
                                              Text(
                                                "${ActionJS.splitString(Config_G.modelBill[index].namecustome)}",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                              Text(
                                                "${ActionJS.splitString(Config_G.modelBill[index].nameshop)}",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ]),
                                            Flexible(
                                                fit: FlexFit.loose,
                                                child: Text(
                                                  "${Config_G.modelBill[index].money.toString()}",
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.visible,
                                                  softWrap: false,
                                                  style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 20,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ]))
                                ])))
                  ]);
                });
          });
        }));
  }
}
