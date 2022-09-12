import 'package:flutter/material.dart';
import '../models/quiz_model.dart';

// ignore: must_be_immutable
class Answers extends StatelessWidget {
  Answers({
    Key? key,
    required this.questionsAndAnswers,
    required this.answerButton,
    required this.index,
  }) : super(key: key);

  final List<QuizModel> questionsAndAnswers;
  final Function answerButton;

  var index = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: questionsAndAnswers[index].answers.map((answersInButtons) {
        // ignore: avoid_unnecessary_containers
        return Container(
          width: 150,
          height: 50,
          margin: const EdgeInsets.only(top: 20),
          child: ElevatedButton(
            onPressed: () => answerButton(
              answersInButtons['score'],
              answersInButtons['validator'],
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Colors.amber[800],
              ),
              foregroundColor: MaterialStateProperty.all(
                Colors.indigo[700],
              ),
            ),
            child: Text(
              answersInButtons['option'].toString(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      }).toList(),
    );
  }
}
