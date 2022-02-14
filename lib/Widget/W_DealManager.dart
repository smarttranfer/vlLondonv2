import 'package:flutter/material.dart';
import 'package:vl_ui/Button/BtnFilter_Bill.dart';
import 'package:vl_ui/Globle/Config_G.dart';
import 'package:vl_ui/model/New_Changer.dart';

class DealManagers extends StatefulWidget {
  const DealManagers({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<DealManagers> {
  final List<Map<String, dynamic>> _allUsers = [];
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    int k = 1;
    for (Information_Bill i in Config_G.modelBill) {
      _allUsers.add({
        "id": "${k}",
        "name": "${i.namecustome}-${i.namecustome}",
        "shop": "${i.nameshop}",
        "mony": "${i.money}",
        "date": "${i.date}",
        "code": "${i.code}"
      });
      k += 1;
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
          image: DecorationImage(
            image: AssetImage("assest/background/bkapps.png"),
            fit: BoxFit.cover,
          ),
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0)),
          boxShadow: [BoxShadow(blurRadius: 7.0, color: Colors.black)]),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_outlined,
                      color: Colors.white,
                      size: 35,
                    )),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 25,
            ),
            SizedBox(width: MediaQuery.of(context).size.width / 7),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                  fillColor: Colors.white,
                  labelText: 'Search',
                  suffixIcon: Icon(Icons.search)),
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
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  height: 3,
                  width: 20,
                  margin: EdgeInsets.only(left: 20, right: 20),
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
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  height: 3,
                  width: 20,
                  margin: EdgeInsets.only(left: 20, right: 20),
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
                                child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        Config_G.check_namecustom_chossen =
                                            false;
                                        Config_G.namecustom_chossen =
                                            "${_foundUsers[index]["name"].toString()}";
                                      });
                                    },
                                    child: BtnFilter_Bills(
                                        code:
                                            "${_foundUsers[index]["code"].toString()}",
                                        date:
                                            "${_foundUsers[index]["date"].toString()}",
                                        money:
                                            "${_foundUsers[index]["mony"].toString()}",
                                        Content:
                                            "${_foundUsers[index]["name"].toString()}",
                                        Subcontent:
                                            '${_foundUsers[index]["shop"].toString()}',
                                        wights:
                                            MediaQuery.of(context).size.width /
                                                1,
                                        heights: 70,
                                        colors: Colors.green.withOpacity(0.0),
                                        path: ""))),
                          ))
                  : Text(
                      Config_G.check_lang
                          ? 'Không tìm thấy kết quả'
                          : "Not found data",
                      style: TextStyle(fontSize: 24, color: Colors.green),
                    ),
            ),
          ],
        ),
      ),
    ));
  }
}
