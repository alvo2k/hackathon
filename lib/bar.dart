import 'package:flutter/material.dart';

class Bar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: const Text('Hackathon'),
        actions: [IconButton(
          icon: const Icon(Icons.forward),
          onPressed: () {
            //setState(() {
              //questionNumber++;
              //if(questionNumber > 3) {

              //}
            })
        ]
    );
  }
}
