class Question {
  String question;
  List<Answer> answers;
  Answer? selectedAnswer;
  Question({required this.question, required this.answers});
}

class Answer {
  String answer;
  int point;
  Answer({required this.answer, required this.point});
}
