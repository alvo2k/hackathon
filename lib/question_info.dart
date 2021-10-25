import 'package:flutter/material.dart';

class QuestionInfo {
  var question = 'Вопрос';
  List<Image> bottomImageCards;
  List<Image> upperImageCards;
  List<String> correctImageList;
  List<Image> wrongCards;

  QuestionInfo({required this.question, required this.bottomImageCards, required this.upperImageCards, required this.correctImageList, required this.wrongCards});

  //List<Image> getImages() {}

}