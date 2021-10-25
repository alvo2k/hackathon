import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String question;

  Question(this.question);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        question, textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24),
      ),
      width: double.infinity,
      margin: EdgeInsets.all(10),
    );
  }
}
