import 'package:vl_ui/Button/BtnFilter.dart';
import 'package:flutter/material.dart';
import 'package:vl_ui/Globle/Config_G.dart';
import 'package:vl_ui/model/Information_Cutome.dart';

class Filter extends StatelessWidget {
  const
  Filter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kindacode.com',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> _allUsers = [];
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    int k = 1;
    for(Information_Cutome i in Config_G.NameCustom_shop){
      _allUsers.add({"id":"${k}","name":"${i.namecustome}${i.Nickname}","shop":"${i.nameshop}"});
      k+=1;
    }
    _foundUsers = _allUsers;
    super.initState();
  }
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),topLeft: Radius.circular(20.0)),
          boxShadow: [BoxShadow(blurRadius: 7.0, color: Colors.black)]),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                  labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(
                          Radius.circular(20))),
                  height: 3,
                  width: 20,
                  margin:
                  EdgeInsets.only(left: 20, right: 20),
                ),
                Text(
                  "Result",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(
                          Radius.circular(20))),
                  height: 3,
                  width: 20,
                  margin:
                  EdgeInsets.only(left: 20, right: 20),
                ),
              ],
            ),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundUsers.length,
                      itemBuilder: (context, index) => Card(
                          key: ValueKey(_foundUsers[index]["id"]),
                          color: Colors.white,
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              elevation: 50,
                              shadowColor: Colors.black12,
                              child:InkWell(
                                onTap: (){
                                  setState(() {
                                    Config_G.check_namecustom_chossen = false;
                                    Config_G.namecustom_chossen = "${_foundUsers[index]["name"].toString()}";
                                  });
                                },
                                  child:
                              BtnFilter(
                                  Content:
                                      "${_foundUsers[index]["name"].toString()}",
                                  Subcontent:
                                      '${_foundUsers[index]["shop"].toString()}',
                                  wights: MediaQuery.of(context).size.width / 1,
                                  heights: 50,
                                  colors: Colors.green.withOpacity(0.0),
                                  path: ""))),
                    ))
                  : const Text(
                      'Không tìm thấy kết quả',
                      style: TextStyle(fontSize: 24, color: Colors.green),
                    ),
            ),
          ],
        ),
      ),
    ));
  }
}
