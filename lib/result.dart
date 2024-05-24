import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  const Result(this.resultScore, this.resetHandler, {Key? key}) : super(key: key);

  String get resultPhrase {
    var resultText = 'No me conoces';
    if (resultScore <= 8) {
      resultText = 'Me conoces muy poco :(';
    } else if (resultScore <= 12) {
      resultText = 'Me conoces!';
    } else if (resultScore >= 12) {
      resultText = 'Me conoces muy bien :) !';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          TextButton(
            child: const Text('Reiniciar test'),
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
