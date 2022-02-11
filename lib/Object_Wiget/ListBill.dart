import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
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
                itemCount: Config_G.modelBill.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(children: [
                    Flexible(
                        child: Card(
                            elevation: 50,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            shadowColor: Colors.black54,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        child: SvgPicture.asset(
                                          "assest/IconBtn/contacts.svg",
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                25,
                                      ),
                                      Column(children: [
                                        Text(
                                          "${provider.getCustomeBill(index).toString().substring(0,10)}...",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        Text(
                                          "${provider.getShopBill(index)}",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ]),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                30,
                                      ),
                                      Text(
                                        "- ${provider.getMoneyBill(index)}",
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 20,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ])))
                  ]);
                });
          });
        }));
  }
}
