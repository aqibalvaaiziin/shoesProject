import 'package:flutter/material.dart';
import 'package:shoes/factory/cart_factory.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var result = List<CartFactory>();

  void dataCart() {
    CartFactory.getData().then((value) {
      for (var i = 0; i < value.length; i++) {
        setState(() {
          result.add(value[i]);
          print(result[i].sepatu['nama']);
        });
      }
    });
  }

  @override
  void initState() {
    dataCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: result.length,
          itemBuilder: (context, index) {
            return Container(
              width: 300,
              height: 100,
              color: Colors.red,
              child: Column(
                children: <Widget>[
                  Text(result[index].sepatu['nama']),
                  Text(result[index].sepatu['tipe']),
                  Text(result[index].sepatu['ukuran'].toString()),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
