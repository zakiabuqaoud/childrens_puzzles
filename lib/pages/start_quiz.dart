import 'package:flutter/material.dart';
import 'package:multi_quiz_s_t_tt9/database/levels.dart';
import 'package:multi_quiz_s_t_tt9/pages/questions_page.dart';
import 'package:multi_quiz_s_t_tt9/widget/my_btn_outLine.dart';

import '../model/level.dart';

class StartQuiz extends StatelessWidget {
  static const String routeName = "/start-quiz";

  const StartQuiz({Key? key}) : super(key: key);

  void moveToQuestionsPage(context, index) {
    Navigator.pushNamed(context, QuestionsPage.routeName, arguments: {
      "level-object": levels[index],
    });
  }

  @override
  Widget build(BuildContext context) {
    final argumentsFromHomePage =
        ModalRoute.of(context)?.settings.arguments as Map<String, Level>;
    final args = argumentsFromHomePage["level-object"] as Level;

    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: args.colors as List<Color>,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Padding(
          padding: const EdgeInsets.only(top: 74, left: 16, right: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyBtnOutline(
                  function: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  borderColor: Colors.white,
                  borderRadiusValue: 50,
                  circle: true,
                ),
                Padding(
                  padding: const EdgeInsets.all(34.0),
                  child: Center(
                      child: Image.asset(
                    args.image as String,
                  )),
                ),
                Text(
                  args.levelText as String,
                  style: const TextStyle(
                      color: Colors.white60,
                      fontSize: 18,
                      fontFamily: "sf-pro-Text"),
                ),
                const Text(
                  "Continuing",
                  style: TextStyle(
                      fontSize: 32,
                      fontFamily: "sf-pro-Text",
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  args.description as String,
                  style: const TextStyle(
                      fontSize: 18,
                      fontFamily: "sf-pro-Text",
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 60,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20.0),
                    foregroundColor: Colors.blue,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  onPressed: () {
                    moveToQuestionsPage(context, args.index);
                  },
                  child: const Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            "Play",
                            style: TextStyle(fontSize: 24),
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
