import 'package:flutter/material.dart';
import 'package:shoes/factory/best_seller_factory.dart';
import 'package:shoes/widgets/favourite_page/card_brand.dart';

class FavouritePage extends StatefulWidget {
  @override
  _FavouritePageState createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  var result = List<BestSellerFactory>();

  void dataBestSeller() {
    BestSellerFactory.setResponse().then((value) {
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
        title: Center(
          child: Text(
            "Favourite Brand",
            style: TextStyle(
              color: Colors.black,
              fontFamily: "D",
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
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
              ),
            ],
          );
        },
      ),
    );
  }
}
