import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Widget/W_Login.dart';
import 'Widget/W_static.dart';
import 'model/ModelCustome.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: W_login(),
    );
  }
}

