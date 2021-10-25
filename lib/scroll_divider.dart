import 'package:flutter/material.dart';

class ScrollDivider extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 0,),
        const Divider(color: Colors.black, thickness: 3, indent: 15, endIndent: 15,),
        Container(height: 0,),
      ]
    );
  }
}
