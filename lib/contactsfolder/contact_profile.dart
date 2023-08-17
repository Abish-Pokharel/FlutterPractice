import 'package:flutter/material.dart';
import 'package:insta_app/contactsfolder/contactsmodel.dart';

class ContactProfile extends StatefulWidget {
  Person person;
  ContactProfile({required this.person, super.key});

  @override
  State<ContactProfile> createState() => _ContactProfileState();
}

class _ContactProfileState extends State<ContactProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 200,
                width: double.maxFinite,
                color: Colors.red,
                child: widget.person.image == null
                    ? Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.white,
                      )
                    : Hero(
                        tag: widget.person.image!.path,
                        child: Image.file(
                          widget.person.image!,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
              Positioned(
                top: 10,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back)),
              )
            ],
          ),
          Text(widget.person.name),
          Text(widget.person.contact)
        ],
      ),
    );
  }
}
