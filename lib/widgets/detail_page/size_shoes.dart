import 'package:flutter/material.dart';

class SizeShoes extends StatelessWidget {
  final String size;
  final bool isSelected;
  SizeShoes(this.size, this.isSelected);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: isSelected ? Colors.black54 : Colors.grey[200],
        borderRadius: BorderRadius.circular(9),
      ),
      child: Center(
          child: Text(
        size,
        style: TextStyle(
            fontSize: 14,
            fontFamily: "F",
            color: isSelected ? Colors.white : Colors.black,),
      )),
    );
  }
}
