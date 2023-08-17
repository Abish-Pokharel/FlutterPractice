import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  @override
  void initState() {
    // Future.delayed(Duration(seconds: 1), () {
    //   setState(() {
    //     number = 100;
    //   });
    // });

    getToken();

    super.initState();
  }

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

      //  _messageStreamController.sink.add(message);
    });
    // FirebaseMessaging.onBackgroundMessage((message) async {
    //   if (kDebugMode) {
    //     print('Handling a foreground message: ${message.messageId}');
    //     print('Message data: ${message.data}');
    //     print('Message notification: ${message.notification?.title}');
    //     print('Message notification: ${message.notification?.body}');
    //   }
    // });
  }

  String? token;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("$token"),
      ),
    );
  }
}
