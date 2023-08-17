import 'package:flutter/material.dart';

class Id_card extends StatefulWidget {
  const Id_card({super.key});

  @override
  State<Id_card> createState() => _Id_cardState();
}

class _Id_cardState extends State<Id_card> {
  List<Map<String, dynamic>> students = [
    {
      "Name": "Abis Pokharel",
      "Address": "Butwal, Nepal",
      "Image":
          "https://i.pinimg.com/474x/b8/6d/0b/b86d0b224d321a08d05843318c25d472.jpg",
      "Phone": "9745436649",
      "Age": "19",
      "Gender": "Male",
      "Religion": "Hindu"
    },
    {
      "Name": "Hari Narayan",
      "Address": "Butwal, Nepal",
      "Image":
          "https://i.pinimg.com/474x/36/f0/05/36f0052e02989cbe0d0e526ff9c65af3.jpg",
      "Phone": "9745436649",
      "Age": "99+",
      "Gender": "Male",
      "Religion": "Hindu"
    },
    {
      "Name": "Krishna Basudev",
      "Address": "Butwal, Nepal",
      "Image":
          "https://i.pinimg.com/474x/b8/6d/0b/b86d0b224d321a08d05843318c25d472.jpg",
      "Phone": "9745436649",
      "Age": "99+",
      "Gender": "Male",
      "Religion": "Hindu"
    },
    {
      "Name": "Hari Narayan",
      "Address": "Butwal, Nepal",
      "Image":
          "https://i.pinimg.com/474x/36/f0/05/36f0052e02989cbe0d0e526ff9c65af3.jpg",
      "Phone": "9745436649",
      "Age": "99+",
      "Gender": "Male",
      "Religion": "Hindu"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    print("${students[index]["Name"] ?? "-"}");
                  },
                  child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                      height: 250,
                      width: double.infinity,
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                            blurRadius: 4,
                            color: Colors.black,
                            spreadRadius: 2.3,
                            offset: Offset(3, 3))
                      ]),
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            width: double.infinity,
                            color: Colors.red,
                            child: Center(
                              child: Text(
                                "IDENTITY CARD",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                height: 100,
                                width: 100,
                                child: Image(
                                  image: NetworkImage(
                                    students[index]["Image"] ?? "-",
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.only(
                                      top: 10, left: 15, right: 15, bottom: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Name :  ${students[index]["Name"] ?? "-"}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      Text(
                                        "Address : ${students[index]["Address"] ?? "-"}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        "Phone : ${students[index]["Phone"] ?? "-"}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      Text(
                                        "Age : ${students[index]["Age"] ?? "-"}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      Text(
                                        "Gender : ${students[index]["Gender"] ?? "-"}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      Text(
                                        "Religion : ${students[index]["Religion"] ?? "-"}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                );
              })),
    );
  }
}
