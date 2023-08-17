import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:insta_app/Instagram.dart';

class GridViewWidget extends StatefulWidget {
  const GridViewWidget({super.key});

  @override
  State<GridViewWidget> createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  List<String> newsFeed = [
    "7",
    "8",
    "9",
    "/",
    "4",
    "5",
    "6",
    "*",
    "1",
    "2",
    "3",
    "-",
    "0",
    ".",
    "=",
    "+"
  ];
  String enteredResult = "";
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.bottomRight,
            width: deviceWidth,
            height: deviceHeight * 0.15,
            child: Text(
              enteredResult.isEmpty ? "Enter Button" : enteredResult,
              style: TextStyle(fontSize: 25),
            ),
          ),
          Expanded(
            child: Container(
                child: GridView.count(
                    // childAspectRatio: 0.5,
                    crossAxisCount: 4,
                    children: newsFeed.map((data) {
                      return InkWell(
                        onTap: () {
                          if (data == "=") {
                            calculationFunction();
                          } else {
                            setState(() {
                              enteredResult = "$enteredResult$data";
                            });
                          }
                        },
                        child: Card(
                          child: Container(
                            alignment: Alignment.center,
                            color: Colors.blueGrey,
                            child: Text(
                              data,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 35),
                            ),
                          ),
                        ),
                      );
                    }).toList())
                // ListView.builder(
                //     itemCount: newsFeed.length,
                //     itemBuilder: (context, index) {
                //       return Card(
                //         color: Colors.white,
                //         child: Container(
                //           alignment: Alignment.center,
                //           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                //           child: Text(newsFeed[index].toString()),
                //         ),
                //       );
                //     }),
                ),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Instagram()));
              },
              child: Text("Next Page"))
        ],
      ),
    );
  }

  calculationFunction() {
    double calculation = 0.0;
    var bufferEntered = enteredResult.split("");
    log(bufferEntered.toString());

    switch (bufferEntered[1]) {
      case "/":
        calculation =
            double.parse(bufferEntered[0]) / double.parse(bufferEntered[2]);
      case "*":
        calculation =
            double.parse(bufferEntered[0]) * double.parse(bufferEntered[2]);
      case "+":
        calculation =
            double.parse(bufferEntered[0]) + double.parse(bufferEntered[2]);
      case "-":
        calculation =
            double.parse(bufferEntered[0]) - double.parse(bufferEntered[2]);
    }

    setState(() {
      enteredResult = calculation.toStringAsFixed(2);
    });
  }
}
