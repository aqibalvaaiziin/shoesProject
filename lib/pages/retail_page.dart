import 'package:flutter/material.dart';
import 'package:shoes/factory/retail_factory.dart';
import 'package:shoes/icons/icon.dart';

class RetailPage extends StatefulWidget {
  @override
  _RetailPageState createState() => _RetailPageState();
}

class _RetailPageState extends State<RetailPage> {
  TextEditingController search = TextEditingController();
  var result = List<RetailFactory>();
  var temp = List<RetailFactory>();

  void dataRetail() {
    RetailFactory.getRetail().then((value) {
      for (var i = 0; i < value.length; i++) {
        setState(() {
          result.add(value[i]);
          temp.add(value[i]);
        });
      }
    });
  }

  @override
  void initState() {
    dataRetail();
    super.initState();
  }

  void onSearchTextChanged(String text) async {
    List<RetailFactory> searchResult = List<RetailFactory>();
    searchResult.addAll(temp);
    if (search != null) {
      List<RetailFactory> dummy = List<RetailFactory>();
      searchResult.forEach((item) {
        if (item.nama.toLowerCase().contains(text) ||
            item.lokasi.toLowerCase().contains(text)) {
          dummy.add(item);
        }
      });
      setState(() {
        result.clear();
        result.addAll(dummy);
      });
      return;
    } else {
      setState(() {
        result.clear();
        dataRetail();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              print(result);
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(20, 60, 0, 10),
              child: CustomIcon.back,
            ),
          ),
          Container(
            child: Center(
              child: Text(
                "PILIH RETAIL PENGAMBILAN",
                style: TextStyle(fontSize: 30, fontFamily: "D"),
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 25),
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width * 0.9,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[200],
                      offset: Offset(0, 8),
                      blurRadius: 10),
                ],
              ),
              child: TextField(
                controller: search,
                onChanged: (value) {
                  onSearchTextChanged(value);
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: CustomIcon.search,
                    hintText: "Cari Retail : "),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: result.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.fromLTRB(25, 0, 25, 30),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[300],
                            blurRadius: 8,
                            spreadRadius: 2,
                            offset: Offset(5, 8)),
                      ],
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.store_mall_directory,
                          size: 70,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                result[index].nama,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: "D",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                result[index].telp,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "FL",
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                result[index].lokasi,
                                style: TextStyle(
                                  fontFamily: "FL",
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
