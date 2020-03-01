import 'package:flutter/material.dart';
import 'package:shoes/widgets/favourite_page/card_brand.dart';

class FavouritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        CardBrand(),
        CardBrand(),
        CardBrand(),
      ],
    );
  }
}
