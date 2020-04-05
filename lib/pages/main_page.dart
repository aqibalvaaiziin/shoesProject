import 'package:flutter/material.dart';
import 'package:shoes/factory/sepatu_factory.dart';
import 'package:shoes/icons/icon.dart';
import 'package:shoes/pages/cart_page.dart';
import 'package:shoes/pages/detail_page.dart';
import 'package:shoes/widgets/cart_page/cart_button.dart';
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
  String name;

  void dataShoesType() {
    SepatuFactory.byType(widget.shoesType).then((value) {
      for (var i = 0; i < value.length; i++) {
        setState(() {
          result.add(value[i]);
        });
      }
    });
  }

  @override
  void initState() {
    dataShoesType();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CartPage(),
            ),
          );
        },
        child: CartButton(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        elevation: 7,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFf4f6fb),
        flexibleSpace: Container(
          padding: EdgeInsets.fromLTRB(25, 32, 25, 0),
          child: TextField(
            controller: search,
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
      body: ListView(
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
                        setState(() {
                          name = data.nama;
                        });
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DetailPage(nama: name)));
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
