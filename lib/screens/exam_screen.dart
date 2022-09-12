import 'package:flutter/material.dart';
import '../models/quiz_model.dart';
import '../widgets/answers.dart';
import '../widgets/questions.dart';
import '../widgets/result.dart';
import '../screens/screen_of_ranks.dart';

import '../widgets/dummy_server.dart';

class ExamScreen extends StatefulWidget {
  const ExamScreen({Key? key}) : super(key: key);

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  List<QuizModel> questionsAndAnswers = setQuestions;
  var index = 0;
  var totalSum = 0;
  bool? validate;

  void _answerButton(int sum, bool validator) {
    setState(() {
      index++;
    });
    totalSum += sum;
    validate = validator;
  }

  void startOverButton() {
    setState(() {
      index = 0;
    });
    totalSum = 0;
  }

  void toPupToHome(BuildContext context) {
    Navigator.of(context).popAndPushNamed('/');
  }

  void toPup(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _displayRanking(BuildContext context) {
    Navigator.of(context).pushNamed(
      ScreenOfRanks.routeName,
      arguments: {
        'sum': totalSum,
        'restartButton': toPupToHome,
        'goBackButton': toPup,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('QuizApp'),
          elevation: 30,
        ),
        body: index >= questionsAndAnswers.length
            ? Result(
                totalSum: totalSum,
                startAgain: startOverButton,
                viewRanks: _displayRanking,
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Questions(
                    questionsAndAnswers: questionsAndAnswers,
                    index: index,
                  ),
                  Answers(
                    questionsAndAnswers: questionsAndAnswers,
                    answerButton: _answerButton,
                    index: index,
                  )
                ],
              ));
  }
}
