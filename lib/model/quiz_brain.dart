import 'package:multi_quiz_s_t_tt9/database/levels.dart';
import 'package:multi_quiz_s_t_tt9/model/question.dart';

import '../database/quiz.dart';
import 'level.dart';

class QuizBrains{
  int _quizNumber = 0;
  int _questionNumber = 0;

  String getQuestionText() {
    return levels[_quizNumber]?.quiz?.bigQuiz[_questionNumber]?.questionText as String;
  }

  int getQuestionAnswer() {
    return levels[_quizNumber]?.quiz?.bigQuiz[_questionNumber]?.answerIndex as int;
  }

  List<String> getOptions(){
    return levels[_quizNumber]?.quiz?.bigQuiz[_questionNumber]?.optionsText as List<String>;
  }

  int getQuestionCount() {
    return levels[_quizNumber]?.quiz?.bigQuiz.length as int;
  }

  int getOptionsCount(){
    return levels[_quizNumber]?.quiz?.bigQuiz[_questionNumber].optionsText.length as int;
  }

  void nextQuestion() {
    List<Question> listOfQuestion = levels[_quizNumber]?.quiz?.bigQuiz as List<Question>;
    if (_questionNumber < listOfQuestion.length - 1) {
      _questionNumber++;
    }
  }

  void setQuizNumber(int index){
    _quizNumber = index;
  }


  bool isFinished() {
    List<Question> listOfQuestion = levels[_quizNumber]?.quiz?.bigQuiz as List<Question>;
    if (_questionNumber >= listOfQuestion.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}