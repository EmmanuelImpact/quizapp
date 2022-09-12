import 'package:flutter/material.dart';
import 'package:quizapp/models/quiz_model.dart';

// ignore: must_be_immutable
class Questions extends StatelessWidget {
  Questions({
    Key? key,
    required this.questionsAndAnswers,
    required this.index,
  }) : super(key: key);

  final List<QuizModel> questionsAndAnswers;
  var index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(
          15,
        ),
        color: Colors.white,
      ),
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(5),
      height: 80,
      alignment: Alignment.center,
      child: Text(
        questionsAndAnswers[index].question,
        style: Theme.of(context).textTheme.headline5,
        textAlign: TextAlign.center,
        overflow: TextOverflow.visible,
      ),
    );
  }
}
