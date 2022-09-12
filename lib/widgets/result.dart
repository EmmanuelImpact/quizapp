import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({
    Key? key,
    required this.totalSum,
    required this.startAgain,
    required this.viewRanks,
  }) : super(key: key);

  final int totalSum;
  final Function() startAgain;
  final Function viewRanks;

  String get resultMessage {
    if (totalSum == 10) {
      return 'Bravo!, task completed. you finished with a total score of';
    } else if (totalSum >= 5) {
      return 'Task completed, you did well. You finished with a total score of';
    } else if (totalSum < 5) {
      return 'Oops! Task completed, You could have done better. You finished with a total score of';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // ignore: avoid_unnecessary_containers
        Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: Text(
                '$resultMessage:',
                style: TextStyle(
                  color: totalSum >= 5 ? Colors.yellow : Colors.red,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                '$totalSum',
                style: TextStyle(
                  color: totalSum >= 5 ? Colors.yellow : Colors.red,
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: startAgain,
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(
                  Theme.of(context).textTheme.button!.color,
                ),
              ),
              child: const Text(
                'Start over!',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () => viewRanks(context),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(
                  Colors.white,
                ),
              ),
              child: const Text(
                'View rankings',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
