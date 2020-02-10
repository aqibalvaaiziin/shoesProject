import 'package:shoes/icons/icon.dart';
import 'package:flutter/material.dart';

class HeadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(16, 10, 16, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(icon: CustomIcon.shop, onPressed: () {}),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 25),
          child: Text(
            "Shop",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 22,
        ),
        Container(
          width: double.infinity,
          height: 60,
          margin: EdgeInsets.symmetric(horizontal: 22),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.12),
                  offset: Offset(0, 8),
                  blurRadius: 10),
            ],
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(left: 18, right: 12),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search.....",
                    suffixIcon: CustomIcon.search),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: EdgeInsets.only(left: 25),
          child: Text(
            "Shoes",
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
