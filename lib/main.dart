import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:insta_app/Instagram.dart';
import 'package:insta_app/buttom_bar.dart';
import 'package:insta_app/contactsfolder/persons.dart';
import 'package:insta_app/create_acc.dart';
import 'package:insta_app/current_location.dart';
import 'package:insta_app/dialog_box.dart';
import 'package:insta_app/grid_view.dart';
import 'package:insta_app/id_card.dart';
import 'package:insta_app/login_page.dart';
import 'package:insta_app/notification.dart';
import 'package:insta_app/score_tracker/question_screen.dart';
import 'package:insta_app/settings.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CurrentLocation(),
    );
  }
}




// ListTile(
//               leading: CircleAvatar(
//                 radius: 40,
//                 backgroundImage: NetworkImage(data["image"]),
//               ),
//               title: Text(data["Name"]),
//               subtitle: Text(data["Phone"]),
//               trailing: IconButton(
//                   onPressed: () {
//                     _makePhoneCall(data["Phone"]);
//                   },
//                   icon: Icon(Icons.phone)),
//             ),