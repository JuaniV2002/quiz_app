import 'package:flutter/cupertino.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  const Result(this.resultScore, this.resetHandler, {Key? key})
      : super(key: key);

  String get resultPhrase {
    var resultText = 'Andá a estudiar! 😂';
    if (resultScore <= 8) {
      resultText = 'Algo sabes 😕';
    } else if (resultScore <= 12) {
      resultText = 'Bien! 😃';
    } else if (resultScore >= 12) {
      resultText = 'Sos un genio! 🤓';
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
            margin: const EdgeInsets.only(top: 20.0),
            child: Container(
              margin: const EdgeInsets.all(10.0),
              child: CupertinoButton(
                borderRadius: BorderRadius.circular(15),
                color: CupertinoColors.activeBlue,
                onPressed: resetHandler,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.arrow_counterclockwise),
                    SizedBox(width: 10),
                    Text('Reiniciar'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
