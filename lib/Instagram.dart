import 'package:flutter/material.dart';
import 'package:insta_app/id_card.dart';
import 'package:insta_app/settings.dart';

class Instagram extends StatefulWidget {
  const Instagram({super.key});

  @override
  State<Instagram> createState() => _InstagramState();
}

class _InstagramState extends State<Instagram> {
  List<Map<String, dynamic>> story = [
    {
      "image":
          "https://i.pinimg.com/564x/b7/d8/7d/b7d87ddccfb8220ef0085ff6a4b8812f.jpg",
      "name": "Krishna Vasudev"
    },
    {
      "image":
          "https://i.pinimg.com/564x/dd/d3/e9/ddd3e9bf6357b073074c058d986e3ca8.jpg",
      "name": "Shiv Shankar"
    },
    {
      "image":
          "https://i.pinimg.com/564x/de/9e/ef/de9eef17c105eae0eaec8bd939e5a065.jpg",
      "name": "Hari Narayan"
    },
  ];
  List<int> post = [1, 2, 3, 4, 5];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   // toolbarHeight: 100,
      // ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                height: 75,
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 60,
                        width: 120,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: NetworkImage(
                              "https://logos-world.net/wp-content/uploads/2020/04/Instagram-Logo.png"),
                          fit: BoxFit.cover,
                        )),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => Settings()));
                            },
                            child: Icon(
                              Icons.favorite_outline,
                              size: 30,
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) => Id_card()));
                            },
                            child: Icon(
                              Icons.send,
                              size: 30,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://i.pinimg.com/474x/b8/6d/0b/b86d0b224d321a08d05843318c25d472.jpg")),
                              shape: BoxShape.circle),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text("Add story"),
                        )
                      ],
                    ),
                  ),
                  ...story.map((e) => Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(e["image"] ?? "-"),
                                        fit: BoxFit.cover),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.blueAccent,
                                          blurRadius: 15)
                                    ]),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, right: 10),
                                child: Text(e["name"] ?? "-"),
                              )
                            ],
                          )
                        ],
                      ))
                ],
              ),
              Divider(
                thickness: 4,
                color: Colors.black,
              ),
              ...post.map(
                (e) => Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 75,
                                  width: 360,
                                  color: Colors.white,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                                color: Colors.pink,
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        "https://i.pinimg.com/474x/18/80/4e/18804e2414d7e389d25401ba30b984bb.jpg"),
                                                    fit: BoxFit.cover)),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Routine Of Bhagwat Geetha",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [Icon(Icons.more_vert)],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Image(
                              image: NetworkImage(
                                  "https://i.pinimg.com/474x/eb/d5/fd/ebd5fda069c23cd878591c68674d2bf1.jpg"),
                              fit: BoxFit.contain,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Icon(Icons.message_outlined),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Icon(Icons.send)
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Row(
                                    children: [Icon(Icons.bookmark_outline)],
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                "Liked by abishpokharel18 and 10M others",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                "धृतराष्ट्र उवाच | \nधर्मक्षेत्रे कुरुक्षेत्रे समवेता युयुत्सवः | \nमामकाः पाण्डवाश्चैव किमकुर्वत सञ्जय ||1||",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Divider(
                              thickness: 4,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
