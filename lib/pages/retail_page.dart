import 'package:flutter/material.dart';
import 'package:shoes/icons/icon.dart';

class RetailPage extends StatefulWidget {
  @override
  _RetailPageState createState() => _RetailPageState();
}

class _RetailPageState extends State<RetailPage> {
  TextEditingController search = TextEditingController();
  var lala = [
    {
      "city": "Malang",
      "place": "Malang Town Square",
      "location": "Jl. Veteran Block 785 Jawa Timur Malang"
    },
    {
      "city": "Surabaya",
      "place": "Tanjungan Plaza",
      "location": "Jl. Malangan Block 785 Jawa Timur Malang"
    },
    {
      "city": "Jakarta",
      "place": "GI",
      "location": "Jl. Surabaya Block 785 Jawa Timur Malang"
    },
    {
      "city": "Malang",
      "place": "Malang Town Square",
      "location": "Jl. Veteran Block 785 Jawa Timur Malang"
    },
    {
      "city": "Surabaya",
      "place": "Tanjungan Plaza",
      "location": "Jl. Malangan Block 785 Jawa Timur Malang"
    },
    {
      "city": "Jakarta",
      "place": "GI",
      "location": "Jl. Surabaya Block 785 Jawa Timur Malang"
    },
    {
      "city": "Malang",
      "place": "Malang Town Square",
      "location": "Jl. Veteran Block 785 Jawa Timur Malang"
    },
    {
      "city": "Surabaya",
      "place": "Tanjungan Plaza",
      "location": "Jl. Malangan Block 785 Jawa Timur Malang"
    },
    {
      "city": "Jakarta",
      "place": "GI",
      "location": "Jl. Surabaya Block 785 Jawa Timur Malang"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(20, 60, 0, 10),
            child: CustomIcon.back,
          ),
          Container(
            child: Center(
              child: Text(
                "PILIH RETAIL PENGAMBILAN",
                style: TextStyle(fontSize: 30, fontFamily: "D"),
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 25),
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width * 0.9,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                controller: search,
                onChanged: (value){
                  
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: CustomIcon.search,
                    prefixText: "Cari Retail : "),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: lala.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.fromLTRB(25, 0, 25, 20),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.store_mall_directory,
                        size: 70,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '${lala[index]['place']}',
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: "D",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${lala[index]['city']}',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "FL",
                                  fontWeight: FontWeight.w600),
                            ),
                            RichText(
                              overflow: TextOverflow.clip,
                              text: TextSpan(
                                style: TextStyle(
                                  fontFamily: "FL",
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                                text: '${lala[index]['location']}',
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
