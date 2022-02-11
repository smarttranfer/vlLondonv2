import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
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
            return  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: provider.getCounter(),
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                          elevation: 50,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          shadowColor: Colors.black54,
                          child: Column(children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.5),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              height: 1,
                              margin: EdgeInsets.only(left: 20, right: 20),
                            ),
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
                                  width: MediaQuery.of(context).size.width / 25,
                                ),
                                Column(children: [
                                  Text(
                                    "${provider.getCustomeBill(index)}",
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
                                  width: MediaQuery.of(context).size.width / 5,
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
                          ]));
                    });
          });
        }));
  }
}
