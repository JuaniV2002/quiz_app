import 'package:flutter/cupertino.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  const Answer(this.selectHandler, this.answerText, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(10.0), // Add margin here
        child: CupertinoButton(
          color: CupertinoColors.activeBlue, // Button color
          borderRadius: BorderRadius.circular(15), // Button border radius
          onPressed: selectHandler,
          child: Text(
            answerText,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
