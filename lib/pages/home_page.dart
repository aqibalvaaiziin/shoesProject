import 'package:flutter/material.dart';
import 'package:shoes/widgets/universal/custom_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Stack(children: <Widget>[
          Image.asset(
            "assets/images/yezzy.jpg",
          ),
          Positioned(
            right: 35,
            bottom: 20,
            child: GestureDetector(
              onTap: () {},
              child: CustomButton(Colors.white, Colors.black, "Style"),
            ),
          ),
        ]),
        Stack(
          children: <Widget>[
            Image.asset(
              "assets/images/nemesis.jpg",
            ),
            Positioned(
              right: 10,
              bottom: 20,
              child: Image.asset(
                "assets/images/messi.png",
                width: 110,
                height: 110,
              ),
            ),
            Positioned(
              left: 10,
              bottom: -2,
              child: GestureDetector(
                onTap: () {},
                child: CustomButton(Colors.white, Colors.black, "Sport"),
              ),
            ),
          ],
        )
      ],
    );
  }
}
