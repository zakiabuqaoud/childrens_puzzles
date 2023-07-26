import 'package:flutter/material.dart';
import 'package:multi_quiz_s_t_tt9/constants.dart';
import 'package:multi_quiz_s_t_tt9/database/levels.dart';
import 'package:multi_quiz_s_t_tt9/model/level.dart';
import 'package:multi_quiz_s_t_tt9/widget/my_btn_outline.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../model/quiz_brain.dart';
import '../model/timer.dart';

class QuestionsPage extends StatefulWidget {
  static const String routeName = "/questions";

  const QuestionsPage({
    super.key,
  });

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  //for timer
  TimerUtils? timerInQuiz;
  double? loadingValue = 1;
  int? timerValue = 10;

  //for quiz
  QuizBrains quizBrain = QuizBrains();
  int questionNumber = 1;
  int questionsCount = 0;
  int? userChoice;
  bool? isCorrect;

  //for buttons
  bool nextBtnAvailable = false;
  bool isOptionSelected = false;

  //for visibility widget
  bool isVisible = false;

  //for score
  int correctAnswersCount = 0;
  int? score;

  //for alert
  bool isAlertShown = false;

  bool ability = true;

  //for level

  @override
  void initState() {
    quizBrain.setQuizNumber(0);
    questionsCount = quizBrain.getQuestionCount();
    super.initState();
    startTimer();
  }

  void checkAnswer() {
    int correctAnswer = quizBrain.getQuestionAnswer();
    cancelTimer();
    setState(() {
      isOptionSelected = !isOptionSelected;
      if (correctAnswer == userChoice) {
        isCorrect = true;
        correctAnswersCount++;
      } else {
        isCorrect = false;
      }
    });
  }

  void nextQuestion() {
    restartTimer();
    quizBrain.nextQuestion();
    setState(() {
        isOptionSelected = !isOptionSelected;
      if (questionNumber != questionsCount) {
        userChoice = null;
        nextBtnAvailable = false;
        isVisible = false;
        questionNumber++;
      } else {
        score = (correctAnswersCount * 100 / questionsCount).round();
        showCustomAlert();
        cancelTimer();
      }
    });
  }

  //for score methods

  bool scoreStatus() => score! >= 50 ? true : false;

  void showCustomAlert() {
    if (isAlertShown) {
      return; // Don't show the alert if it has already been shown
    }
    QuickAlert.show(
      confirmBtnText: 'Finish',
      context: context,
      type: scoreStatus() ? QuickAlertType.success : QuickAlertType.error,
      text: scoreStatus()
          ? 'You passed this level'
          : 'You failed in this level, try Again',
      title:
          scoreStatus() ? 'Congratulations! , You win' : 'Good luck, You lost',
      onConfirmBtnTap: () {
        Navigator.pushNamed(context, "/");
      },
    );
    isAlertShown = true;
  }

  //timer methods
  void startTimer() {
    timerInQuiz = TimerUtils();
    Stream<int> countdown = timerInQuiz!.countdown(from: 10);
    countdown.listen((int value) {
      setState(() {
        loadingValue = value / 10;
        timerValue = value;
      });
      if (timerValue == 0) {
        timerInQuiz!.cancelTimer();
        setState(() {
          nextBtnAvailable = true;
          isVisible = true;
          isOptionSelected = !isOptionSelected;
        });
      }
    });
  }

  void cancelTimer() {
    timerInQuiz!.cancelTimer();
  }

  void restartTimer() {
    setState(() {
      loadingValue = 1;
      timerValue = 10;
    });
    startTimer();
  }

  //تربط كل مستوى بالاسئلة الخاصة فيه
  handleQuizNumber(args) {
    int indexForLevel = args.index as int;
    if (indexForLevel == 0) {
      quizBrain.setQuizNumber(0);
    } else if (indexForLevel == 1) {
      quizBrain.setQuizNumber(1);
    } else {
      quizBrain.setQuizNumber(2);
    }
  }

  @override
  void dispose() {
    cancelTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final argumentFromStartQuiz =
        ModalRoute.of(context)!.settings!.arguments as Map<String, Level>;
    final args = argumentFromStartQuiz["level-object"] as Level;
    handleQuizNumber(args);
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: args.colors as List<Color>,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Padding(
          padding: const EdgeInsets.only(top: 74, left: 16, right: 8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyBtnOutline(
                        function: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.close, color: Colors.white),
                        borderRadiusValue: 50,
                        borderColor: Colors.white,
                        circle: true),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 56,
                          height: 56,
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.grey.withOpacity(0.3),
                            value: loadingValue,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          timerValue.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                    OutlinedButton(
                      onPressed: null,
                      style: const ButtonStyle().copyWith(
                        side: const MaterialStatePropertyAll(
                          BorderSide(color: Colors.white),
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.favorite, color: Colors.white),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "3",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 74, left: 24, right: 24, bottom: 24),
                  child: Center(child: Image.asset(args.image as String)),
                ),
                Text(
                  'question $questionNumber of $questionsCount',
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'Sf-Pro-Text',
                    color: Colors.white60,
                  ),
                ),
                Text(
                  quizBrain.getQuestionText(),
                  style: const TextStyle(
                    fontSize: 28,
                    fontFamily: 'Sf-Pro-Text',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 48,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: quizBrain.getOptionsCount(),
                  itemBuilder: (context, index) {
                    String choice = quizBrain.getOptions()[index];
                    bool isSelected = userChoice == index;
                    bool isAnswerCorrect =
                        isCorrect != null && isCorrect! && isSelected;
                    bool isAnswerWrong =
                        isCorrect != null && !isCorrect! && isSelected;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: ElevatedButton(
                        onPressed: isOptionSelected
                            ? null
                            : () {
                                // Disable button if an option has been selected
                                setState(() {
                                  userChoice = index;
                                  checkAnswer();
                                  nextBtnAvailable = true;
                                  isVisible = true;
                                  isOptionSelected =
                                      true; // Update the flag to indicate that an option has been selected
                                });
                              },
                        style: ElevatedButton.styleFrom(
                          disabledBackgroundColor: isAnswerCorrect
                              ? Colors.green
                              : isAnswerWrong
                                  ? Colors.red
                                  : Colors.white,
                          backgroundColor: isAnswerCorrect
                              ? Colors.green
                              : isAnswerWrong
                                  ? Colors.red
                                  : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 24),
                            Expanded(
                              child: Center(
                                child: Text(
                                  choice,
                                  style: const TextStyle(
                                    color: kL2,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                            if (isSelected)
                              Icon(
                                isAnswerCorrect
                                    ? Icons.check_rounded
                                    : Icons.close_rounded,
                                color: kL2,
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                Visibility(
                  visible: isVisible,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: nextBtnAvailable ? nextQuestion : null,
                        child: Text(
                          quizBrain.isFinished() ? "finish" : "Next",
                          style: TextStyle(
                            color: nextBtnAvailable ? Colors.white : null,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
