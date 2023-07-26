import 'dart:ui';

import 'package:multi_quiz_s_t_tt9/model/quiz.dart';

class Level {
  int? index;
  String? title;
  String? description;
  List<Color>? colors;
  String? levelText;
  String? image;
  String? levelStatusIcon;
  Quiz? quiz;

  Level({
    this.title,
    this.description,
    this.image,
    this.levelText,
    this.colors,
    this.index,
    this.levelStatusIcon,
    this.quiz,
  });
}
