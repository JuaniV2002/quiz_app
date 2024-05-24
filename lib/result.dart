import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  const Result(this.resultScore, this.resetHandler, {Key? key}) : super(key: key);

  String get resultPhrase {
    var resultText = 'No me conoces 😢';
    if (resultScore <= 8) {
      resultText = 'Me conoces muy poco 🙁';
    } else if (resultScore <= 12) {
      resultText = 'Me conoces! 😐';
    } else if (resultScore >= 12) {
      resultText = 'Me conoces muy bien 😃 !';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            resultPhrase,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0), // Add top margin here
            child: ElevatedButton.icon(
              icon: const Icon(Icons.refresh), // Your icon
              label: const Text('Reiniciar test'),
              onPressed: resetHandler,
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
                foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
