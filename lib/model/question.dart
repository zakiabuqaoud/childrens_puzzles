class Question {
  int id;
  String questionText;
  List<String> optionsText;
  int answerIndex;

  Question({
    required this.id,
    required this.questionText,
    required this.optionsText,
    required this.answerIndex,
  });
}
