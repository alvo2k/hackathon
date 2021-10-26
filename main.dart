import 'package:flutter/material.dart';

import './question_info.dart';
import './question.dart';
import './scroll.dart';
import './scroll_divider.dart';
import './result.dart';

void main() => runApp(const Hackathon());

class Hackathon extends StatefulWidget {
  const Hackathon({Key? key}) : super(key: key);

  @override
  _HackathonState createState() => _HackathonState();
}

class _HackathonState extends State<Hackathon> {
  int tryNumber = 1;
  int questionNumber = 1;
  bool hideButton = false;

  var firstQuestion = QuestionInfo(
    question: 'Зона культивирования',
    bottomImageCards: [
      Image.asset('cards/2.jpg'),
      Image.asset('cards/1.jpg'),
      Image.asset('cards/5.jpg'),
      Image.asset('cards/3.jpg'),
      Image.asset('cards/6.jpg'),
      Image.asset('cards/4.jpg'),
    ],
    upperImageCards: [],
    wrongCards: [
      Image.asset('wrong_cards/1.jpg'),
      Image.asset('wrong_cards/2.jpg'),
      Image.asset('wrong_cards/3.jpg'),
      Image.asset('wrong_cards/4.jpg'),
      Image.asset('wrong_cards/5.jpg'),
      Image.asset('wrong_cards/6.jpg'),
    ],
    correctImageList: [
      'cards/1.jpg',
      'cards/2.jpg',
      'cards/3.jpg',
      'cards/4.jpg',
      'cards/5.jpg',
      'cards/6.jpg',
    ],
  );

  var secondQuestion = QuestionInfo(
    question: 'Зона очистки',
    bottomImageCards: [
      Image.asset('cards/9.jpg'),
      Image.asset('cards/7.jpg'),
      Image.asset('cards/10.jpg'),
      Image.asset('cards/12.jpg'),
      Image.asset('cards/8.jpg'),
      Image.asset('cards/11.jpg'),
    ],
    upperImageCards: [],
    wrongCards: [
      Image.asset('wrong_cards/7.jpg'),
      Image.asset('wrong_cards/8.jpg'),
      Image.asset('wrong_cards/9.jpg'),
      Image.asset('wrong_cards/10.jpg'),
      Image.asset('wrong_cards/11.jpg'),
      Image.asset('wrong_cards/12.jpg'),
    ],
    correctImageList: [
      'cards/7.jpg',
      'cards/8.jpg',
      'cards/9.jpg',
      'cards/10.jpg',
      'cards/11.jpg',
      'cards/12.jpg',
    ],
  );

  var thirdQuestion = QuestionInfo(
    question: 'Участок розлива',
    bottomImageCards: [
      Image.asset('cards/15.jpg'),
      Image.asset('cards/13.jpg'),
      Image.asset('cards/14.jpg'),
    ],
    upperImageCards: [],
    wrongCards: [
      Image.asset('wrong_cards/13.jpg'),
      Image.asset('wrong_cards/14.jpg'),
      Image.asset('wrong_cards/15.jpg'),
    ],
    correctImageList: [
      'cards/13.jpg',
      'cards/14.jpg',
      'cards/15.jpg',
    ],
  );

  QuestionInfo currentQuestion() {
    if (questionNumber == 1) return firstQuestion;
    if (questionNumber == 2) return secondQuestion;
    if (questionNumber == 3) return thirdQuestion;
    return QuestionInfo(
      question: 'NotImplementQuestion',
      bottomImageCards: [],
      upperImageCards: [],
      correctImageList: [],
      wrongCards: [],
    );
  }

  void moveToUpper(Image imageToMove) {
    setState(() {
      currentQuestion().upperImageCards.add(imageToMove);
      currentQuestion().bottomImageCards.remove(imageToMove);
      hideButton = false;
    });
  }

  void moveToBottom(Image imageToMove) {
    var wrongCardsCheck = imageToMove.image.toString();
    if (wrongCardsCheck.contains('wrong_cards/1.jpg')) {currentQuestion().upperImageCards.remove(imageToMove); imageToMove = Image.asset('cards/1.jpg');}
    if (wrongCardsCheck.contains('wrong_cards/2.jpg')) {currentQuestion().upperImageCards.remove(imageToMove); imageToMove = Image.asset('cards/2.jpg');}
    if (wrongCardsCheck.contains('wrong_cards/3.jpg')) {currentQuestion().upperImageCards.remove(imageToMove); imageToMove = Image.asset('cards/3.jpg');}
    if (wrongCardsCheck.contains('wrong_cards/4.jpg')) {currentQuestion().upperImageCards.remove(imageToMove); imageToMove = Image.asset('cards/4.jpg');}
    if (wrongCardsCheck.contains('wrong_cards/5.jpg')) {currentQuestion().upperImageCards.remove(imageToMove); imageToMove = Image.asset('cards/5.jpg');}
    if (wrongCardsCheck.contains('wrong_cards/6.jpg')) {currentQuestion().upperImageCards.remove(imageToMove); imageToMove = Image.asset('cards/6.jpg');}
    if (wrongCardsCheck.contains('wrong_cards/7.jpg')) {currentQuestion().upperImageCards.remove(imageToMove); imageToMove = Image.asset('cards/7.jpg');}
    if (wrongCardsCheck.contains('wrong_cards/8.jpg')) {currentQuestion().upperImageCards.remove(imageToMove); imageToMove = Image.asset('cards/8.jpg');}
    if (wrongCardsCheck.contains('wrong_cards/9.jpg')) {currentQuestion().upperImageCards.remove(imageToMove); imageToMove = Image.asset('cards/9.jpg');}
    if (wrongCardsCheck.contains('wrong_cards/10.jpg')) {currentQuestion().upperImageCards.remove(imageToMove); imageToMove = Image.asset('cards/10.jpg');}
    if (wrongCardsCheck.contains('wrong_cards/11.jpg')) {currentQuestion().upperImageCards.remove(imageToMove); imageToMove = Image.asset('cards/11.jpg');}
    if (wrongCardsCheck.contains('wrong_cards/12.jpg')) {currentQuestion().upperImageCards.remove(imageToMove); imageToMove = Image.asset('cards/12.jpg');}
    if (wrongCardsCheck.contains('wrong_cards/13.jpg')) {currentQuestion().upperImageCards.remove(imageToMove); imageToMove = Image.asset('cards/13.jpg');}
    if (wrongCardsCheck.contains('wrong_cards/14.jpg')) {currentQuestion().upperImageCards.remove(imageToMove); imageToMove = Image.asset('cards/14.jpg');}
    if (wrongCardsCheck.contains('wrong_cards/15.jpg')) {currentQuestion().upperImageCards.remove(imageToMove); imageToMove = Image.asset('cards/15.jpg');}

    setState(() {
      currentQuestion().bottomImageCards.add(imageToMove);
      currentQuestion().upperImageCards.remove(imageToMove);
      hideButton = false;
    });
  }

  bool isCorrectOrder() {
    bool falseAnyWay = false;
    bool out = false;
    for (int i = 0; i < currentQuestion().upperImageCards.length; i++) {
      if (currentQuestion().upperImageCards[i].image.toString().contains(currentQuestion().correctImageList[i])) {
        out = true;
      } else {
          falseAnyWay = true;
        setState(() {   // уже пора спать, но дедлайн завтра... Сорян :(
          var wrongImage = currentQuestion().upperImageCards[i].image;
          if (wrongImage.toString().contains('cards/1.jpg')) {firstQuestion.upperImageCards[i] = firstQuestion.wrongCards[0];}
          if (wrongImage.toString().contains('cards/2.jpg')) {firstQuestion.upperImageCards[i] = firstQuestion.wrongCards[1];}
          if (wrongImage.toString().contains('cards/3.jpg')) {firstQuestion.upperImageCards[i] = firstQuestion.wrongCards[2];}
          if (wrongImage.toString().contains('cards/4.jpg')) {firstQuestion.upperImageCards[i] = firstQuestion.wrongCards[3];}
          if (wrongImage.toString().contains('cards/5.jpg')) {firstQuestion.upperImageCards[i] = firstQuestion.wrongCards[4];}
          if (wrongImage.toString().contains('cards/6.jpg')) {firstQuestion.upperImageCards[i] = firstQuestion.wrongCards[5];}
          if (wrongImage.toString().contains('cards/7.jpg')) {secondQuestion.upperImageCards[i] = secondQuestion.wrongCards[0];}
          if (wrongImage.toString().contains('cards/8.jpg')) {secondQuestion.upperImageCards[i] = secondQuestion.wrongCards[1];}
          if (wrongImage.toString().contains('cards/9.jpg')) {secondQuestion.upperImageCards[i] = secondQuestion.wrongCards[2];}
          if (wrongImage.toString().contains('cards/10.jpg')) {secondQuestion.upperImageCards[i] = secondQuestion.wrongCards[3];}
          if (wrongImage.toString().contains('cards/11.jpg')) {secondQuestion.upperImageCards[i] = secondQuestion.wrongCards[4];}
          if (wrongImage.toString().contains('cards/12.jpg')) {secondQuestion.upperImageCards[i] = secondQuestion.wrongCards[5];}
          if (wrongImage.toString().contains('cards/13.jpg')) {thirdQuestion.upperImageCards[i] = thirdQuestion.wrongCards[0];}
          if (wrongImage.toString().contains('cards/14.jpg')) {thirdQuestion.upperImageCards[i] = thirdQuestion.wrongCards[1];}
          if (wrongImage.toString().contains('cards/15.jpg')) {thirdQuestion.upperImageCards[i] = thirdQuestion.wrongCards[2];}
        });
      }
    }
    //print(out);
    //print(!falseAnyWay);
    //print(out && !falseAnyWay);
    return out && !falseAnyWay;
  }

  void resetQuiz() {
    setState(() {
      firstQuestion.bottomImageCards = [
        Image.asset('cards/2.jpg'),
        Image.asset('cards/1.jpg'),
        Image.asset('cards/5.jpg'),
        Image.asset('cards/3.jpg'),
        Image.asset('cards/6.jpg'),
        Image.asset('cards/4.jpg'),
      ];
      firstQuestion.upperImageCards.removeRange(0, firstQuestion.upperImageCards.length);
      secondQuestion.bottomImageCards = [
        Image.asset('cards/9.jpg'),
        Image.asset('cards/7.jpg'),
        Image.asset('cards/10.jpg'),
        Image.asset('cards/12.jpg'),
        Image.asset('cards/8.jpg'),
        Image.asset('cards/11.jpg'),
      ];
      secondQuestion.upperImageCards.removeRange(0, secondQuestion.upperImageCards.length);
      thirdQuestion.bottomImageCards = [
        Image.asset('cards/15.jpg'),
        Image.asset('cards/13.jpg'),
        Image.asset('cards/14.jpg'),
      ];
      thirdQuestion.upperImageCards.removeRange(0, thirdQuestion.upperImageCards.length);

      hideButton = false;
      questionNumber = 1;
      tryNumber = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: currentQuestion().bottomImageCards.isEmpty && questionNumber < 4 && !hideButton
          ? AppBar(
            title: Image.asset(
              'cards/logo.png',
              scale: 2,
            ),
            backgroundColor: const Color.fromRGBO(255, 237, 0, 1),
            actions: [IconButton(
                  icon: const Icon(Icons.arrow_forward_ios, color: Colors.black,),
                  onPressed: () {
                    if(isCorrectOrder()) {
                      setState(() {
                        hideButton = false;
                        questionNumber++;
                      });
                    } else {
                      tryNumber++;
                      hideButton = true;
                    }
                    setState(() {});
                  }
              )]
            ) //appbar width button
          : AppBar(
              title: Image.asset(
                'cards/logo.png',
                scale: 2,
              ),
              backgroundColor: const Color.fromRGBO(255, 237, 0, 1),
            ),
        body: questionNumber < 4
          ? Column(
          children: [
            Question(currentQuestion().question),
            Expanded(child: Scroll(images: currentQuestion().upperImageCards, moveHandler: moveToBottom)),
            ScrollDivider(),
            Expanded(child: Scroll(images: currentQuestion().bottomImageCards, moveHandler: moveToUpper)),
          ],
        )
          : Result(tryNumber, resetQuiz),
      )
    );
  }
}
