import 'package:multi_quiz_s_t_tt9/model/question.dart';

import '../model/quiz.dart';

List<Quiz> ListOfQuiz = [
  Quiz(
    id: 1,
    bigQuiz: [
      Question(
        id: 1,
        questionText: "Where does the camel live?",
        optionsText: [
          "Forests",
          "deserts",
          "tropics",
        ],
        answerIndex: 1,
      ),
      Question(
        id: 2,
        questionText: "Where does the penguin live?",
        optionsText: [
          "Forests",
          "deserts",
          "snowy",
        ],
        answerIndex: 2,
      ),
      Question(
          id: 3,
          questionText: "Ants are considered one of the following:",
          optionsText: [
            "reptile",
            "insects",
          ],
          answerIndex: 1),
    ],
  ),
];
