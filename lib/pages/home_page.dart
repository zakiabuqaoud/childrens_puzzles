import 'package:flutter/material.dart';

//import my files
import '.././widget/my_level_widget.dart';
import '../constants.dart';
import '../database/levels.dart';
import './start_quiz.dart';

class HomePage extends StatelessWidget {
  late final Function function;
  late final String subtitle;
  late final Icon icon;
  late final String title;

  // const FirstScreen({Key? key, required this.function, required this.subtitle, required this.icon, required this.title}) : super(key: key);
  void moveToStartQuizPage(context, levelIndex, levelStatus) {
    if (levelStatus == "lock") {
      return;
    }

    Navigator.pushNamed(context, StartQuiz.routeName, arguments: {
      "level-object": levels[levelIndex],
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
              color: kL2,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.person,
              color: kL2,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Let's play",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: playColor,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Be the first",
                style: TextStyle(color: greyBody, fontSize: 16),
              ),
              ...List.generate(
                  levels.length,
                  (index) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 8),
                        child: MyLevelWidget(
                          level: levels[index],
                          moveToStartQuiz: () {
                            moveToStartQuizPage(
                                context,
                                levels[index].index as int,
                                levels[index].levelStatusIcon as String);
                          },
                        ),
                      )),
            ],
          ),
        ),
      ),
    );
  }
}
