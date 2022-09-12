import 'package:flutter/material.dart';
import './screens/exam_screen.dart';
import 'package:flutter/services.dart';
import './screens/screen_of_ranks.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
  runApp(
    const QuizApp(),
  );
}

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QuizApp',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        // ignore: deprecated_member_use
        accentColor: Colors.indigo,
        canvasColor: const Color.fromRGBO(100, 20, 180, 0.4),
        fontFamily: '',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: const TextStyle(
                fontFamily: '',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              bodyText1: const TextStyle(
                color: Colors.amber,
              ),
              bodyText2: const TextStyle(
                color: Colors.pink,
              ),
              button: TextStyle(
                color: Colors.amber[800],
              ),
              headline5: TextStyle(
                fontFamily: '',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.indigo[900],
              ),
            ),
      ),
      home: const ExamScreen(),
      routes: {
        ScreenOfRanks.routeName: (ctx) => const ScreenOfRanks(),
      },
    );
  }
}
