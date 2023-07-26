
import '../constants.dart';
import '../model/level.dart';
import '../model/question.dart';
import '../model/quiz.dart';

List<Level> levels = [
  Level(title: "Animals", description: "Questions about animals", image: "assets/images/bags.png", levelText: "Level 1", colors: [kL1, kL12], index: 0, levelStatusIcon: "play_arrow", quiz: Quiz(
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
  ),),
  Level(title: "Eating", description: "Questions about plants", image: "assets/images/ballon-s.png", levelText: "Level 2",colors: [kL2, kL22], index: 1,  levelStatusIcon: "play_arrow", quiz: Quiz(
    id: 1,
    bigQuiz: [
      Question(
        id: 1,
        questionText: "Are carrots a vegetable?",
        optionsText: [
          "Yes",
          "No",
        ],
        answerIndex: 0,
      ),
      Question(
        id: 2,
        questionText: "What are the colors of bananas?",
        optionsText: [
          "Yellow-blue-red",
          "Yellow-green-red",
          "Yellow-black-red",
        ],
        answerIndex: 1,
      ),
      Question(
          id: 3,
          questionText: "Are apples considered vegetables?",
          optionsText: [
            "Yes",
            "No",
          ],
          answerIndex: 1),
    ],
  ), ),
  Level(title: "civilizations", description: "Questions about countries and cities", image: "assets/images/camera-b.png",colors: [kL3, kL32], levelText: "Level 3", index: 2,  levelStatusIcon: "play_arrow",quiz: Quiz(
    id: 1,
    bigQuiz: [
      Question(
        id: 1,
        questionText: "What is the capital of Germany?",
        optionsText: [
          "Aachen",
          "Berlin",
          "Mangascar",
        ],
        answerIndex: 1,
      ),
      Question(
        id: 2,
        questionText: " Which continent is the country of Brazil?",
        optionsText: [
          "Asia",
          "Europe",
          "south america",
        ],
        answerIndex: 2,
      ),
      Question(
          id: 3,
          questionText: "Where is London located?",
          optionsText: [
            "Britain",
            "Germany",
          ],
          answerIndex: 0),
    ],
  ),),
];
