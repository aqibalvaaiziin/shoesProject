import 'package:flutter/material.dart';
import 'package:shoes/icons/icon.dart';

class Profile extends StatelessWidget {
  String name, email, address, phone;
  Profile(String name, String email, String address, String phone) {
    this.name = name;
    this.email = email;
    this.address = address;
    this.phone = phone;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                blurRadius: 20,
                offset: Offset(0, 9),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              CustomIcon.pencil
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Text(
            "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Labore repudiandae sunt incidunt aliquam. Facilis, fugit ipsa! Omnis soluta consectetur placeat quod nisi, totam eaque aliquid magni fugiat earum dolorum quo?",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 17),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Profile",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: <Widget>[
                    Text(
                      "E-mail",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      email,
                      style: TextStyle(fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Address",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    Container(
                      width: 282,
                      margin: EdgeInsets.only(),
                      child: Text(
                        address,
                        style: TextStyle(fontWeight: FontWeight.w300),
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Phone",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      phone,
                      style: TextStyle(fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
