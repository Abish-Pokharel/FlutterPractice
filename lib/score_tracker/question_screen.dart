import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:insta_app/score_tracker/models.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  List<Question>? questions;
  @override
  void initState() {
    questions = [
      Question(question: "What is your faviourate color?", answers: [
        Answer(answer: "Blue", point: 2),
        Answer(answer: "Red", point: 1),
        Answer(answer: "Black", point: 5),
        Answer(answer: "green", point: 6),
      ]),
      Question(question: "What is your faviourate place?", answers: [
        Answer(answer: "Butwal", point: 2),
        Answer(answer: "Pokhara", point: 5),
        Answer(answer: "Mustang", point: 7),
        Answer(answer: "Ilam", point: 1),
      ]),
      Question(question: "What is your faviourate food?", answers: [
        Answer(answer: "Rice", point: 8),
        Answer(answer: "Desert", point: 3),
        Answer(answer: "Meat", point: 7),
        Answer(answer: "DAL", point: 8),
      ]),
      Question(question: "Who is the father of computer?", answers: [
        Answer(answer: "Charles Babbage", point: 10),
        Answer(answer: "Albert Einstein", point: 0),
        Answer(answer: "Dr. Jhatka", point: 8),
        Answer(answer: "Newton", point: 0),
      ]),
      Question(question: "Who wrote Ramayan?", answers: [
        Answer(answer: "Ravan", point: 2),
        Answer(answer: "Valmiki", point: 10),
        Answer(answer: "Vedbyas", point: 3),
        Answer(answer: "Charles Babbage", point: 0),
      ]),
    ];

    super.initState();
  }

  Answer selectedAnswer = Answer(answer: "", point: 0);

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Container(
          color: Colors.pink,
        ),
      ),
      bottomNavigationBar: ElevatedButton(
          onPressed: () {
            // _scaffoldKey.currentState!.openDrawer();
            int totalPoints = 0;

            for (var selected in questions!) {
              totalPoints = totalPoints + (selected.selectedAnswer?.point ?? 0);
            }

            log(totalPoints.toString());
            dialogBox(totalPoints);
          },
          child: Text("Submit")),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: questions == null || questions!.isEmpty
              ? Center(child: Text("Question not found"))
              : Column(
                  children: [
                    Column(
                      children: questions!
                          .asMap()
                          .entries
                          .map(
                            (e) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${e.key + 1}) ${e.value.question}"),
                                SizedBox(
                                  height: 200,
                                  child: GridView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            childAspectRatio: 2.5),
                                    itemCount: e.value.answers.length,
                                    itemBuilder: ((context, index) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 10),
                                          child: Row(
                                            children: [
                                              Radio<Answer>(
                                                  value: e.value.answers[index],
                                                  groupValue:
                                                      e.value.selectedAnswer,
                                                  onChanged: (val) {
                                                    setState(() {
                                                      e.value.selectedAnswer =
                                                          val!;
                                                    });
                                                  }),
                                              Text(e
                                                  .value.answers[index].answer),
                                            ],
                                          ),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                    // Center(
                    //   child:
                    // )
                  ],
                ),
        ),
      ),
    );
  }

  dialogBox(int totalPoints) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Your Total points is : "),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    totalPoints.toString(),
                    style: TextStyle(fontSize: 30, color: Colors.green),
                  ),
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      for (var data in questions!) {
                        data.selectedAnswer = null;
                      }
                      setState(() {});
                    },
                    child: Text("Okay")),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Close",
                      style: TextStyle(color: Colors.red),
                    )),
              ],
            ));
  }
}
