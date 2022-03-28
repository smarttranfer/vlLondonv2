import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Widget/W_Login.dart';
import 'model/counter_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<CounterModel>(
              create: (context) => CounterModel()),
        ],
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: W_login(),
        ));
  }
}
