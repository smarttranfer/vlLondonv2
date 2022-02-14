import 'dart:convert';
import 'package:vl_ui/Globle/Config_G.dart';
import 'package:vl_ui/Object_Wiget/SlidableAcion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';
import 'W_Signupmanger.dart';

class AnimeApp extends StatefulWidget {
  AnimeApp({Key? key}) : super(key: key);

  @override
  _AnimeAppState createState() => _AnimeAppState();
}

class _AnimeAppState extends State<AnimeApp> {
  late Future<List<Show>> shows;
  String searchString = "";
  bool checknull = false;
  @override
  void initState() {
    super.initState();
    shows = fetchShows();
    if (Config_G.NameCustom_shop.isEmpty) {
      setState(() {
        checknull = true;
      });
    } else {
      setState(() {
        checknull = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assest/background/bkr.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  duration: Duration(
                                      milliseconds: Config_G.timeDruation),
                                  reverseDuration: Duration(
                                      milliseconds: Config_G.timeDruation),
                                  child: W_Signupmanagee()));
                        },
                        icon: Icon(Icons.arrow_back_ios_outlined),
                        color: Colors.white,
                      ),
                      SizedBox(width: MediaQuery.of(context).size.height / 30),
                      Text(
                        Config_G.check_lang
                            ? "CHỈNH SỬA THÔNG TIN"
                            : "EDIT INFORMATION",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 14),
                    ],
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            searchString = value.toLowerCase();
                          });
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderRadius:
                                  BorderRadius.all(Radius.circular(80.0)),
                              borderSide: BorderSide.none,
                            ),
                            labelText: 'Search',
                            suffixIcon: Icon(Icons.search)),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                      flex: 20,
                      child: SingleChildScrollView(
                          child: Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 1.3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 7.0, color: Colors.black)
                                  ]),
                              child: checknull
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Center(
                                            child: Text(
                                          Config_G.check_lang
                                              ? "Không có dữ liệu"
                                              : "No data",
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 20,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ))
                                      ],
                                    )
                                  : Card(
                                      elevation: 50,
                                      child: ListViewsCustome()))))
                ],
              ),
            )));
  }
}

class Show {
  final int malId;
  final String title;
  final String imageUrl;
  final double score;

  Show({
    required this.malId,
    required this.title,
    required this.imageUrl,
    required this.score,
  });

  factory Show.fromJson(Map<String, dynamic> json) {
    return Show(
      malId: json['mal_id'],
      title: json['title'],
      imageUrl: json['image_url'],
      score: json['score'],
    );
  }
}

Future<List<Show>> fetchShows() async {
  final response =
      await http.get(Uri.parse('https://api.jikan.moe/v3/top/anime/1'));

  if (response.statusCode == 200) {
    var topShowsJson = jsonDecode(response.body)['top'] as List;
    return topShowsJson.map((show) => Show.fromJson(show)).toList();
  } else {
    throw Exception('Failed to load shows');
  }
}
