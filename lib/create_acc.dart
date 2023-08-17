import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta_app/Instagram.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final passwordConfirm = TextEditingController();

  bool passwordInvisible = true;
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Create Account",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Create an account",
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    labelText: "Enter Name",
                    prefixIcon: Icon(FontAwesomeIcons.user),
                    hintStyle: TextStyle(
                        fontSize: 25, color: Color.fromARGB(0, 162, 185, 180))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Name field is required";
                  }
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    labelText: "Address",
                    prefixIcon: Icon(FontAwesomeIcons.locationDot),
                    hintStyle: TextStyle(
                        fontSize: 25, color: Color.fromARGB(0, 162, 185, 180))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Address is required";
                  }
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(FontAwesomeIcons.envelope),
                    hintStyle: TextStyle(
                        fontSize: 25, color: Color.fromARGB(0, 162, 185, 180))),
                validator: (value) {
                  bool emailMatched = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value!);
                  if (value!.isEmpty) {
                    return "Email is required";
                  } else if (!emailMatched) {
                    return "Please enter valid email";
                  }
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    labelText: "Phone Number",
                    prefixIcon: Icon(FontAwesomeIcons.phone),
                    hintStyle: TextStyle(
                        fontSize: 25, color: Color.fromARGB(0, 162, 185, 180))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Phone number is required";
                  } else if (value.length != 10) {
                    return "Invalid phone number";
                  }
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.text,
                obscureText: passwordInvisible,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: const Icon(FontAwesomeIcons.lock),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            passwordInvisible = !passwordInvisible;
                          });
                        },
                        icon: Icon(passwordInvisible
                            ? FontAwesomeIcons.eyeSlash
                            : FontAwesomeIcons.eye))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password is required";
                  }
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                controller: passwordConfirm,
                keyboardType: TextInputType.text,
                obscureText: passwordVisible,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                    labelText: "Confirm Password",
                    prefixIcon: const Icon(FontAwesomeIcons.lock),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                        icon: Icon(passwordVisible
                            ? FontAwesomeIcons.eyeSlash
                            : FontAwesomeIcons.eye))),
                validator: (value) {
                  if (value != passwordController.text) {
                    return "Password not matched..";
                  }
                },
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 125),
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green)),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => Instagram()));
                    } else {
                      return;
                    }
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
