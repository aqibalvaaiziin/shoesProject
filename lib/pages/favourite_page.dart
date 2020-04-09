import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shoes/factory/sepatu_factory.dart';
import 'package:shoes/widgets/favourite_page/card_brand.dart';

class FavouritePage extends StatefulWidget {
  @override
  _FavouritePageState createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  var result = List<SepatuFactory>();

  void dataBestSeller() {
    SepatuFactory.bestSeller().then((value) {
      for (var i = 0; i < value.length; i++) {
        setState(() {
          result.add(value[i]);
        });
      }
    });
  }

  @override
  void initState() {
    dataBestSeller();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "Favourite Shoes",
            style:
                TextStyle(fontSize: 25, fontFamily: "D", color: Colors.black),
          ),
        ),
      ),
      body: result.length == 0
          ? SpinKitFadingCube(
              size: 50,
              color: Colors.grey,
            )
          : ListView.builder(
              itemCount: result.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    CardBrand(
                      result[index].nama,
                      result[index].desc,
                      result[index].gambar,
                      result[index].harga,
                    ),
                  ],
                );
              },
            ),
    );
  }
}
