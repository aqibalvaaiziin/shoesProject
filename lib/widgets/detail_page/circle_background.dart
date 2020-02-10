import 'package:flutter/material.dart';

class BackCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 80,
          left: 100,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
              color: Color(0xa6a1a1a1),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          top: 150,
          left: 30,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.width * 0.4,
            decoration: BoxDecoration(
              color: Color(0xf1d1d1d1d),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          top: 130,
          right: 54,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.width * 0.4,
            decoration: BoxDecoration(
              color: Color(0xa6a1a1a1),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          top: 180,
          left: 80,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.width * 0.4,
            decoration: BoxDecoration(
              color: Color(0xa6a1a11),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: -80,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.width * 0.6,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.6),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
