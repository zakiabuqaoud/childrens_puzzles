import 'package:flutter/material.dart';
import 'package:multi_quiz_s_t_tt9/widget/my_btn_outLine.dart';

import '../model/level.dart';

class MyLevelWidget extends StatelessWidget {
  final Level level;
  final Function moveToStartQuiz;


  const MyLevelWidget({
    required this.level,
    required this.moveToStartQuiz,

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        moveToStartQuiz();
      },
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.only(top: 40.0),
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: level.colors as List<Color>,
              ),
              borderRadius: BorderRadius.circular(26.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyBtnOutline(
                  function: () {},
                  icon: level.levelStatusIcon == "play_arrow"
                      ? const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        )
                      : level.levelStatusIcon == "lock"
                          ? const Icon(
                              Icons.lock,
                              color: Colors.white,
                            )
                          : const Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                  borderRadiusValue: 10.0,
                  borderColor: Colors.white,
                  circle: false,
                ),
                Text(
                  level.levelText as String,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: "Sf-Pro-Text"),
                ),
                Text(
                  level.title as String,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset(level.image as String),
          ),
        ],
      ),
    );
  }
}
