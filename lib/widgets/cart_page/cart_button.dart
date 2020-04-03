import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          "Jumlah Item yang dibeli : 5",
          style: TextStyle(
              fontSize: 18,
              fontFamily: "D",
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
      ),
    );
  }
}
