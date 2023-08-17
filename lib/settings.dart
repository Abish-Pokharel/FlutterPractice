import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool applock = false;
  bool fingerprint = true;

  bool wifi = true;
  bool bluetooth = false;
  bool location = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Title(
            color: Colors.black,
            child: Text(
              "Settings",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            )),
      ),
      body: ListView(
        children: [
          Row(
            children: [
              Container(
                height: 75,
                width: 75,
                decoration: BoxDecoration(
                    color: Colors.pink,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://i.pinimg.com/564x/f2/b1/2e/f2b12ee1c4c3a317394983b0cb13bde1.jpg"),
                        fit: BoxFit.cover)),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Krishna Basudev",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )
                      ],
                    ),
                    Text("harinarayan10@gmail.com")
                  ],
                ),
              )
            ],
          ),
          Divider(
            thickness: 3,
          ),
          Row(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Common",
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.public),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [Text("Language")],
                    ),
                    Row(children: [
                      Text("English"),
                    ])
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.cloud_outlined),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [Text("Environment")],
                    ),
                    Row(children: [
                      Text("Production"),
                    ])
                  ],
                ),
              )
            ],
          ),
          Divider(
            height: 10,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Account",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                ),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.share),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text("Connection & sharing"),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.phone),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text("Phone Number"),
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.wifi),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text("WiFi"),
                    )
                  ],
                ),
                Row(
                  children: [
                    Switch(
                      value: wifi,
                      onChanged: (
                        val,
                      ) {
                        setState(() {
                          wifi = val;
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.email),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text("Email"),
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.bluetooth),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text("Bluetooth"),
                    )
                  ],
                ),
                Row(
                  children: [
                    Switch(
                      value: bluetooth,
                      onChanged: (
                        val,
                      ) {
                        setState(() {
                          bluetooth = val;
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.location_on),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text("Location"),
                    )
                  ],
                ),
                Row(
                  children: [
                    Switch(
                      value: location,
                      onChanged: (
                        val,
                      ) {
                        setState(() {
                          location = val;
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
          Divider(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Security",
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.phonelink_lock),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text("Lock app in background"),
                    )
                  ],
                ),
                Row(
                  children: [
                    Switch(
                      value: applock,
                      onChanged: (
                        val,
                      ) {
                        setState(() {
                          applock = val;
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.fingerprint),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text("Use fingerprint"),
                    )
                  ],
                ),
                Row(
                  children: [
                    Switch(
                      value: fingerprint,
                      onChanged: (
                        val,
                      ) {
                        setState(() {
                          fingerprint = val;
                        });
                      },
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.lock),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text("Change password"),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.visibility_off),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text("Private safe"),
                ),
              ],
            ),
          ),
          Divider(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Others",
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.description),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text("Terms of Services"),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.file_open),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text("Open source licence"),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.phone_android),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text("About device"),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.input),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text("Sign out"),
                    )
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.replay),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text("Reset"),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
