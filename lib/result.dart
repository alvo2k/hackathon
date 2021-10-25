import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Result extends StatelessWidget {
  int tryNumber;
  Function reset;
  Result(this.tryNumber, this.reset);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
       children: [
         Container(
           margin: const EdgeInsets.only(top: 30, bottom: 60),
           child: const Text(
             'Вы успешно прошли квиз!',
             textAlign: TextAlign.center,
             style: TextStyle(fontSize: 28, color: Colors.black),

           ),
         ),
         Container(
           margin: const EdgeInsets.only(bottom: 30),
           child: Text(
             'Количество попыток: ' + tryNumber.toString(),
             textAlign: TextAlign.center,
             style: TextStyle(fontSize: 22, color: Colors.black),
           ),
         ),
         tryNumber == 1
         ? Container(
           child: Image.asset('cards/source.gif'),
           margin: const EdgeInsets.only(top: 10, bottom: 60),
         )
         : Container(
           child: Image.asset('cards/meh.gif'),
           margin: const EdgeInsets.only(top: 10, bottom: 60),
         ),
         ElevatedButton(
             style: ButtonStyle(
               backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(255, 237, 0, 1)),
               fixedSize: MaterialStateProperty.all(const Size.fromHeight(50)),
             ),
             onPressed: () => reset(),
             child: const Text(
                 'Пройти заново',
               style: TextStyle(
                   color: Colors.black,
                 fontSize: 16,
               ),
             )
         )
       ]
      )
    );
  }
}
