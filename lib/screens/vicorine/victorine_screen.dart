import 'package:flutter/material.dart';
import 'package:hockey_quiz/base/core_widgets/custom_button.dart';
import 'package:hockey_quiz/base/app_theme.dart';
import 'package:hockey_quiz/models/question_model.dart';
import 'package:hockey_quiz/models/quiz_model.dart';
import 'package:hockey_quiz/screens/vicorine/widgets/victorine_answer_item.dart';
import 'package:hockey_quiz/screens/vicorine/widgets/victorine_app_bar.dart';

class VictorineScreen extends StatefulWidget {
  const VictorineScreen({
    super.key,
    required this.quiz,
  });

  final QuizModel quiz;

  @override
  State<VictorineScreen> createState() => _VictorineScreenState();
}

class _VictorineScreenState extends State<VictorineScreen> {
  var _questionIndex = 0;

  int? _rightAnswer;

  bool _won = false;

  QuestionModel get _currentQuestion => widget.quiz.questions[_questionIndex];
  @override
  Widget build(BuildContext context) {
    return _won
        ? Scaffold(
            body: Container(
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('images/win_bg_red.png'),
                ),
              ),
              child: Column(
                children: [
                  const VictorineAppBar(
                    title: 'Result',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Expanded(
                    child: SafeArea(
                      child: Column(
                        children: [
                          const Spacer(),
                          Stack(
                            children: [
                              Image.asset(
                                'images/salute.png',
                                fit: BoxFit.fitWidth,
                              ),
                              Positioned.fill(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      'NICE WORK',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Image.asset(
                                      'images/circle_check.png',
                                      height: 120,
                                      width: 120,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Spacer(flex: 2),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _won = false;
                                    _questionIndex = 0;
                                    _rightAnswer = null;
                                  });
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  color: Colors.white,
                                  height: 60,
                                  alignment: Alignment.center,
                                  child: Text(
                                    'PLAY AGAIN',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 15,
                                      color: context.theme.primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              GestureDetector(
                                onTap: () => Navigator.of(context).pop(),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                  ),
                                  height: 60,
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'GO TO MAIN',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : Scaffold(
            appBar: VictorineAppBar(title: widget.quiz.title),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    Text(
                      'Pergunta ${_questionIndex + 1} de ${widget.quiz.questions.length}',
                      style: TextStyle(
                        color: context.theme.primaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 10,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          _currentQuestion.question,
                          style: context.textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    ...List.generate(
                      _currentQuestion.answers.length,
                      (index) {
                        final answer = _currentQuestion.answers[index];

                        return VictorineAnswerItem(
                          title: answer,
                          onTap: () => _onAnswerTap(index),
                          isRight: _rightAnswer == index,
                          index: index,
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    CustomButton(
                      width: double.infinity,
                      title: 'CONTINUAR',
                      onTap: _onContinueTap,
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  void _onAnswerTap(int index) {
    if (index == _currentQuestion.rightAnswerIndex) {
      setState(() {
        _rightAnswer = index;
      });
      return;
    }
  }

  void _onContinueTap() {
    if (_rightAnswer == null) {
      return;
    }

    if (_questionIndex == widget.quiz.questions.length - 1) {
      setState(() {
        _won = true;
      });
      return;
    }

    setState(() {
      _questionIndex++;
      _rightAnswer = null;
    });
  }
}
