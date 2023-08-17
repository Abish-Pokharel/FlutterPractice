import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:insta_app/contactsfolder/contact_profile.dart';
import 'package:insta_app/contactsfolder/contactsmodel.dart';
import 'package:url_launcher/url_launcher.dart';

class PersonContacts extends StatefulWidget {
  const PersonContacts({super.key});

  @override
  State<PersonContacts> createState() => _PersonContactsState();
}

class _PersonContactsState extends State<PersonContacts> {
  final _formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var contactController = TextEditingController();

  List<Person> person = [
    Person(name: "Shiva", contact: "9745436649"),
    Person(name: "Vasudev", contact: "982372813"),
  ];
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: "tel",
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  ImagePicker picker = ImagePicker();
  File? profilePic;

  Future<File?> getImage(ImageSource source) async {
    try {
      var image = await picker.pickImage(source: source);
      var imageFile = File(image!.path);
      return imageFile;
    } catch (err) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Contacts"),
            IconButton(
              onPressed: () {
                contact();
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          ...person.map((e) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ContactProfile(
                                      person: e,
                                    )));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 75,
                            width: 75,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(color: Colors.black, blurRadius: 3)
                                ]),
                            child: e.image == null
                                ? Icon(
                                    Icons.person,
                                    color: Colors.black,
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(37.5),
                                    child: Hero(
                                      tag: e.image!.path,
                                      child: Image.file(
                                        e.image!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [Text(e.name), Text(e.contact)],
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                _makePhoneCall(e.contact);
                              },
                              icon: Icon(Icons.call))
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  )
                ],
              ))
        ],
      ),
    );
  }

  contact() {
    contactController.clear();
    nameController.clear();
    profilePic = null;
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => StatefulBuilder(builder: (context, stateChange) {
              return AlertDialog(
                title: Text("Add Contacts"),
                content: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          splashColor: Colors.red,
                          borderRadius: BorderRadius.circular(37.5),
                          onTap: () {
                            pick(onImageSelect: (File? selectedFile) {
                              stateChange(() {
                                profilePic = selectedFile;
                              });
                              Navigator.pop(context);
                            });
                          },
                          child: Container(
                            height: 75,
                            width: 75,
                            decoration: BoxDecoration(
                              color: Colors.amber.withOpacity(0.5),
                              shape: BoxShape.circle,
                            ),
                            child: profilePic == null
                                ? Text("")
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(37.5),
                                    child: Image.file(
                                      profilePic!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                          ),
                        ),
                        Text(
                          "Select Image",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(labelText: "Name"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Name is required";
                            }
                          },
                        ),
                        TextFormField(
                          controller: contactController,
                          keyboardType: TextInputType.phone,
                          decoration:
                              InputDecoration(labelText: "Phone Number"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Phone number is Required";
                            } else if (value.length != 10) {
                              return "Invalid";
                            }
                          },
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Cancel")),
                            SizedBox(
                              width: 30,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.pop(context);
                                    setState(() {
                                      person.add(Person(
                                          name: nameController.text,
                                          contact: contactController.text,
                                          image: profilePic));
                                    });
                                  } else {
                                    return;
                                  }
                                },
                                child: Text("Submit")),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }));
  }

  pick({required Function onImageSelect}) {
    profilePic = null;
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios)),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        splashColor: Colors.red,
                        borderRadius: BorderRadius.circular(40),
                        onTap: () async {
                          var abc = await getImage(ImageSource.gallery);
                          onImageSelect(abc);
                        },
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  "https://th.bing.com/th/id/R.63bd5bb8d46838f327046d0cf7f937b3?rik=sGsr9MiZGKYLWg&pid=ImgRaw&r=0",
                                ),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle,
                            color: Colors.amber.withOpacity(0.5),
                          ),
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(40),
                        splashColor: Colors.red,
                        onTap: () async {
                          var abc = await getImage(ImageSource.camera);
                          onImageSelect(abc);
                        },
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://th.bing.com/th/id/OIP.46yio72t7rDws0of3wGkhwHaHa?pid=ImgDet&rs=1"),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle,
                            color: Colors.amber.withOpacity(0.5),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Gallery"), Text("Camera")],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Submit"))
                ],
              ),
            ));
  }
}
