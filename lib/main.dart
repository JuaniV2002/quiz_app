import '../result.dart';
import 'package:flutter/cupertino.dart';

import 'quiz.dart';

void main() {
  runApp(const MyApp());
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
      'questionText': 'Que significa ARM en referencia a microprocesadores?',
      'answers': [
        {'text': 'Astro Roaming Module', 'score': 5},
        {'text': 'Acorn Risc Machines', 'score': 10},
        {'text': 'Amp Resource Manifest', 'score': 3},
        {'text': 'Brazo', 'score': 1}
      ],
    },
    {
      'questionText': 'Que arquitectura utiliza los procesadores RISC',
      'answers': [
        {'text': 'x86', 'score': 10},
        {'text': 'PowerPC', 'score': 5},
        {'text': 'ARM', 'score': 3},
        {'text': 'Nvidia', 'score': 0}
      ],
    },
    {
      'questionText': 'Que significa TOPS en referencia a microprocesadores?',
      'answers': [
        {'text': 'Trillions of Operations per Second', 'score': 10},
        {'text': 'Tera Operations per Second', 'score': 5},
        {'text': 'Teraflops Operations per Second', 'score': 3},
        {'text': 'Tri Opsi Per Second', 'score': 1}
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
            'Cuánto sabes de computadoras?',
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
