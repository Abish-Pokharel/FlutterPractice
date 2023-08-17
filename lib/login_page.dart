import 'dart:ui';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:insta_app/Instagram.dart';
import 'package:insta_app/create_acc.dart';

class Login_page extends StatefulWidget {
  const Login_page({super.key});

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  final _formKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();
  List<Map<String, dynamic>> loginwith = [
    {
      "image":
          "https://th.bing.com/th/id/OIP.Ua5AXhtGRgPuisZVmetclQHaFL?pid=ImgDet&rs=1"
    },
    {
      "image":
          "https://th.bing.com/th/id/R.0fa3fe04edf6c0202970f2088edea9e7?rik=joOK76LOMJlBPw&riu=http%3a%2f%2fpluspng.com%2fimg-png%2fgoogle-logo-png-open-2000.png&ehk=0PJJlqaIxYmJ9eOIp9mYVPA4KwkGo5Zob552JPltDMw%3d&risl=&pid=ImgRaw&r=0"
    },
    {
      "image":
          "https://th.bing.com/th/id/R.3f7189662f19f8318fc75252deee723a?rik=Qa956Np1tp8Zcg&riu=http%3a%2f%2f1000logos.net%2fwp-content%2fuploads%2f2017%2f06%2fTwitter-Logo.png&ehk=6ekNd2ZmhpvFDGRZF19QcumP9fb8pZRkwrbFbK%2bpULA%3d&risl=&pid=ImgRaw&r=0"
    },
    {
      "image":
          "https://th.bing.com/th/id/R.1638702f6e66943ec3943511a870803a?rik=lAavH%2feWwZ1bHA&pid=ImgRaw&r=0"
    }
  ];

  @override
  void initState() {
    getToken();
    super.initState();
  }

  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  String? token;

  getToken() async {
    final settings = await firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    token = await firebaseMessaging.getToken();
    print(token);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(message);
      if (kDebugMode) {
        print('Handling a foreground message: ${message.messageId}');
        print('Message data: ${message.data}');
        print('Message notification: ${message.notification?.title}');
        print('Message notification: ${message.notification?.body}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: ListView(scrollDirection: Axis.vertical, children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome Back",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.account_circle,
                size: 100,
                color: Colors.grey,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: "Email address",
                hintStyle: TextStyle(
                    fontSize: 25, color: Color.fromARGB(0, 162, 185, 180)),
              ),
              validator: (value) {
                bool emailMatched = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value!);

                if (value!.isEmpty) {
                  return "Email required";
                } else
                  (emailMatched) {
                    return "Not valid";
                  };
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: TextFormField(
              controller: passwordController,
              keyboardType: TextInputType.text,
              obscureText: true,
              obscuringCharacter: "*",
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.remove_red_eye),
                labelText: "Password",
                hintStyle: TextStyle(
                    fontSize: 25, color: Color.fromARGB(0, 162, 185, 180)),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Password required";
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: TextFormField(
              controller: passwordController,
              keyboardType: TextInputType.text,
              obscureText: true,
              obscuringCharacter: "*",
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.replay),
                labelText: " Repeat Password",
                hintStyle: TextStyle(
                    fontSize: 25, color: Color.fromARGB(0, 162, 185, 180)),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 125),
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.pink)),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => Instagram()));
                  } else {
                    return;
                  }
                  ;
                },
                child: Text(
                  "LOG IN",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                )),
          ),
          SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have any account: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Account()));
                },
                child: Text(
                  "Create new account",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login with",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...loginwith.map(
                (e) => Container(
                  height: 55,
                  width: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                            e["image"] ?? "-",
                          ),
                          fit: BoxFit.cover)),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
