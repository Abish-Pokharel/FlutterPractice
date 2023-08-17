import 'dart:math';

import 'package:flutter/material.dart';

class Practice extends StatefulWidget {
  const Practice({super.key});

  @override
  State<Practice> createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {
  var usernameController = TextEditingController();
  var phonenumberController = TextEditingController();
  var gmailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    dialogBox();
                  },
                  child: Text("Dialog",
                      style: TextStyle(
                          color: Colors.pink,
                          fontSize: 18,
                          fontWeight: FontWeight.bold))),
              SizedBox(
                width: 75,
              ),
              ElevatedButton(
                onPressed: () {
                  styleBox();
                },
                child: Text(
                  "Submit",
                  style: TextStyle(
                      // color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  dialogBox() {
    showDialog(
        // barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Warning"),
              content: Text("Simple Dialog Box"),
              actions: [],
            ));
  }

  styleBox() {
    usernameController.clear();
    phonenumberController.clear();
    gmailcontroller.clear();
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: Text("Style Dialog box"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: usernameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Username",
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: phonenumberController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Phone Number",
                        prefixIcon: Icon(Icons.call)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: gmailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: "Gmail", prefixIcon: Icon(Icons.mail)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            print(usernameController.text);
                            print(phonenumberController.text);
                            print(gmailcontroller.text);
                            congBox();
                          },
                          child: Text("Submit")),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Cancel",
                            style: TextStyle(color: Colors.red),
                          )),
                    ],
                  )
                ],
              ),
            ));
  }

  congBox() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              title: Center(child: Text("Congratulation")),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.verified,
                    size: 50,
                    color: Colors.green,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("OK"))
                ],
              ),
            ));
  }
}
