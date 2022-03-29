import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vl_ui/DartJs/FuntionsAction.dart';
import 'package:vl_ui/Widget/W_PaymentInvoice.dart';
import 'package:vl_ui/model/counter_model.dart';

class BtnFilter_own_shop extends StatelessWidget {
  const BtnFilter_own_shop({
    required this.colors,
    required this.heights,
    required this.wights,
    required this.money,
    required this.original_amount,
    required this.paymented,
    required this.date,
    required this.index,
    required this.id_custome,
    Key? key,
  }) : super(key: key);
  final int index;
  final Color colors;
  final double heights;
  final double wights;
  final String money;
  final String original_amount;
  final String paymented;
  final String date;
  final int id_custome;
  @override
  Widget build(BuildContext context) {
    TextEditingController values = TextEditingController();
    final counterModel = Provider.of<CounterModel>(context);
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        height: heights,
        width: wights,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Date - time",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    date,
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    " | ",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 25,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "original_amount",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      ActionJS.splitString(original_amount),
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    " | ",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 25,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "amount owed",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      ActionJS.splitString(paymented),
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    " | ",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 25,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: heights/1.5,
                      width: wights / 5,
                      child: TextField(
                        onChanged: (value){
                          W_PaymentsInove.allUsers[index]["value"] = value;
                          // counterModel.incrementCounter(double.parse(value.toString()));
                        },
                        controller: values..text = money,
                        keyboardType: TextInputType.number,
                          style: TextStyle(fontSize: 12),
                        decoration: InputDecoration(
                          enabled: true,
                          enabledBorder: OutlineInputBorder(
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
              )
            ],
          ),
        )),
    ]));
  }
}
