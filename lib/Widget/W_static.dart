import 'package:vl_ui/Globle/Config_G.dart';
import 'package:vl_ui/Globle/color.dart';
import 'package:vl_ui/Globle/day_month.dart';
import 'package:vl_ui/Object_Wiget/chart.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:page_transition/page_transition.dart';
import 'W_daily.dart';

class StatsPage extends StatefulWidget {
  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  int activeDay = 3;

  bool showAvg = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assest/background/bkr.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          // backgroundColor: primary,
          body: getBody(),
        ));
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;

    List expenses = [
      {
        "icon": Icons.arrow_back,
        "color": blue,
        "label": "Income",
        "cost": "\$6593.75"
      },
      {
        "icon": Icons.arrow_forward,
        "color": red,
        "label": "Expense",
        "cost": "\$2645.50"
      }
    ];
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assest/background/bkrheader.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 80, right: 2, left: 2, bottom: 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 15),
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 25,
                            ),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Thống kê",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Card(
                      elevation: 20,
                      child: Container(
                          margin: EdgeInsets.all(10),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(months.length, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      activeDay = index;
                                    });
                                  },
                                  child: Container(
                                    width: (MediaQuery.of(context).size.width -
                                            40) /
                                        6,
                                    child: Column(
                                      children: [
                                        Text(
                                          months[index]['label'],
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: activeDay == index
                                                  ? primary
                                                  : black.withOpacity(0.02),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: activeDay == index
                                                      ? primary
                                                      : black
                                                          .withOpacity(0.1))),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 12,
                                                right: 12,
                                                top: 7,
                                                bottom: 7),
                                            child: Text(
                                              months[index]['day'],
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w600,
                                                  color: activeDay == index
                                                      ? white
                                                      : black),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }))))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
              padding: const EdgeInsets.only(
                left: 2,
                right: 2,
              ),
              child: Card(
                elevation: 20,
                child: Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: grey.withOpacity(0.01),
                          spreadRadius: 10,
                          blurRadius: 3,
                          // changes position of shadow
                        ),
                      ]),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Net balance",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: Color(0xff67727d)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "\$2446.90",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            width: (size.width - 20),
                            height: 150,
                            child: LineChart(
                              mainData(),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )),
          SizedBox(
            height: 20,
          ),
          Wrap(
              spacing: 20,
              children: List.generate(expenses.length, (index) {
                return Container(
                    width: (size.width - 30) / 2,
                    height: 170,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: grey.withOpacity(0.01),
                            spreadRadius: 10,
                            blurRadius: 3,
                            // changes position of shadow
                          ),
                        ]),
                    child: Card(
                      elevation: 20,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 25, right: 25, top: 20, bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Card(
                                elevation: 20,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: expenses[index]['color']),
                                    child: Center(
                                      child: InkWell(
                                        onTap: (){
                                          Navigator.push(
                                              context,
                                              PageTransition(
                                                  type: PageTransitionType.rightToLeft,
                                                  duration: Duration(
                                                      milliseconds:
                                                      Config_G.timeDruation),
                                                  reverseDuration: Duration(
                                                      milliseconds:
                                                      Config_G.timeDruation),
                                                  child: DailyPage()));
                                        },
                                          child: Icon(
                                        expenses[index]['icon'],
                                        color: white,
                                      )),
                                    ))),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  expenses[index]['label'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: Color(0xff67727d)),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  expenses[index]['cost'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ));
              }))
        ],
      ),
    );
  }
}
