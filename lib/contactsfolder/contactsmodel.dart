import 'dart:io';

class Person {
  String name;
  String contact;
  File? image;
  Person({required this.name, required this.contact, this.image});
}
