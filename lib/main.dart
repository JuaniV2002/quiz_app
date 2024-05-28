import 'package:first_app/result.dart';
import 'package:flutter/cupertino.dart';

import './quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Cuál es mi apodo?',
      'answers': [
        {'text': 'Juan', 'score': 5},
        {'text': 'Juani', 'score': 10},
        {'text': 'Juancito', 'score': 3},
        {'text': 'John', 'score': 1}
      ],
    },
    {
      'questionText': 'Qué estoy estudiando?',
      'answers': [
        {'text': 'Computación', 'score': 10},
        {'text': 'Biología', 'score': 5},
        {'text': 'Administración', 'score': 3},
        {'text': 'Nada', 'score': 0}
      ],
    },
    {
      'questionText': 'Cuál es el apodo preferido de mi novia?',
      'answers': [
        {'text': 'Belu', 'score': 0},
        {'text': 'Belen', 'score': 3},
        {'text': 'Belencita', 'score': 10},
        {'text': 'Beli', 'score': 5}
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: const CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(
            fontFamily: 'Nunito',
          ),
        ),
      ),
      home: CupertinoPageScaffold(
        backgroundColor: const Color.fromARGB(255, 107, 156, 198),
        navigationBar: const CupertinoNavigationBar(
          middle: Text(
            'Cuánto conoces a Juani?',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        child: SafeArea(
          child: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalScore, _resetQuiz),
        ),
      ),
    );
  }
}
