import 'package:flutter/material.dart';

class ScreenOfRanks extends StatefulWidget {
  const ScreenOfRanks({Key? key}) : super(key: key);

  static const routeName = '/rank-screen';

  @override
  State<ScreenOfRanks> createState() => _ScreenOfRanksState();
}

class _ScreenOfRanksState extends State<ScreenOfRanks> {
  var _initialLading = false;
  int? totalSum;
  Function? _restart;
  Function? _goBack;

  @override
  void didChangeDependencies() {
    if (!_initialLading) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
      totalSum = routeArgs['sum'] as int;
      _restart = routeArgs['restartButton'] as Function;
      _goBack = routeArgs['goBackButton'] as Function;
      _initialLading = true;
    }
    super.didChangeDependencies();
  }

  String get rank {
    if (totalSum! <= 4) {
      return 'You\'re WOEFUL!';
    } else if (totalSum! >= 9) {
      return 'You\'re EXCELLENT!';
    }
    return 'You\'re COOL!';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        elevation: 40,
        title: const Text(
          'Ranking Board',
        ),
        centerTitle: true,
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 40,
        ),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // ignore: avoid_unnecessary_containers
            Container(
              child: Text(
                rank,
                style: TextStyle(
                  color: totalSum! < 5 ? Colors.yellow : Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // ignore: avoid_unnecessary_containers
            Container(
              margin: const EdgeInsets.all(5),
              child: const Text(
                'See reason below:',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text(
                  '0 - 4',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(
                  color: Colors.white,
                ),
                Text(
                  'Woeful',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text(
                  '5 - 8',
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(
                  color: Colors.white,
                ),
                Text(
                  'Cool',
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text(
                  '9 - 10',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(
                  color: Colors.white,
                ),
                Text(
                  'Excellent',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            // ignore: avoid_unnecessary_containers
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'You have a total score of:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '$totalSum',
                    style: TextStyle(
                      color: totalSum! < 5 ? Colors.yellow : Colors.white,
                      fontSize: 35,
                    ),
                  ),
                ],
              ),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: totalSum! < 5 ? Colors.yellow : Colors.white,
                side: const BorderSide(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              onPressed: () => _restart!(context),
              child: const Text(
                'Start over!',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            TextButton(
              style: OutlinedButton.styleFrom(
                primary: Colors.cyan[100],
              ),
              onPressed: () => _goBack!(context),
              child: const Text(
                '< Go back!',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
