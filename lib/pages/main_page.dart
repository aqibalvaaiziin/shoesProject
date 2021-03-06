import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shoes/factory/sepatu_factory.dart';
import 'package:shoes/icons/icon.dart';
import 'package:shoes/pages/detail_page.dart';
import 'package:shoes/widgets/main_page/product_card.dart';

class MainPage extends StatefulWidget {
  final String shoesType;
  MainPage({this.shoesType});
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController search = TextEditingController();
  var result = List<SepatuFactory>();
  var temp = List<SepatuFactory>();
  String name;

  void dataShoesType() {
    SepatuFactory.byType(widget.shoesType).then((value) {
      for (var i = 0; i < value.length; i++) {
        setState(() {
          result.add(value[i]);
          temp.add(value[i]);
        });
      }
    });
  }

  void onSearchTextChanged(String text) async {
    List<SepatuFactory> searchResult = List<SepatuFactory>();
    searchResult.addAll(temp);
    if (search != null) {
      List<SepatuFactory> dummy = List<SepatuFactory>();
      searchResult.forEach((item) {
        if (item.nama.toLowerCase().contains(text) ||
            item.tipe.toLowerCase().contains(text)) {
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
        dataShoesType();
      });
    }
  }

  @override
  void initState() {
    dataShoesType();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 7,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFf4f6fb),
        flexibleSpace: Container(
          padding: EdgeInsets.fromLTRB(25, 32, 25, 0),
          child: TextField(
            controller: search,
            onChanged: (value) {
              print(value);
              onSearchTextChanged(value);

              print("lengthe :  $result.length ");
            },
            decoration: InputDecoration(
              suffix: CustomIcon.search,
              border: InputBorder.none,
              hintText: "Search",
              hintStyle: TextStyle(fontSize: 20, fontFamily: "FL"),
              counterStyle: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xFFf4f6fb),
      body: result.length == 0
          ? SpinKitFadingCube(
              size: 50,
              color: Colors.grey,
            )
          : ListView(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Text(
                          result.length.toString() + " Result for this type",
                          style: TextStyle(fontSize: 20, fontFamily: "FL"),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width - 60,
                        height: 2,
                        color: Colors.grey[300],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Wrap(
                        children: result.map((data) {
                          return GestureDetector(
                            onTap: () {
                              name = data.nama;
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPage(nama: name)));
                            },
                            child: CardProducts(
                                data.gambar, data.nama, data.harga, true),
                          );
                        }).toList(),
                      ),
                    )
                  ],
                ),
              ],
            ),
    );
  }
}
