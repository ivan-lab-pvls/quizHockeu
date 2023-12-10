import 'package:hockey_quiz/models/question_model.dart';

class QuizModel {
  const QuizModel({

    required this.title,
    required this.questions,
  });


  final String title;
  final List<QuestionModel> questions;
}
