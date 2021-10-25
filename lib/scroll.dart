import 'package:flutter/material.dart';

class Scroll extends StatefulWidget {
  //Scroll({Key? key}) : super(key: key);
  List<Image> images;
  final Function moveHandler;

  Scroll({required this.images, required this.moveHandler});

  @override
  _ScrollState createState() => _ScrollState();
}

class _ScrollState extends State<Scroll> {

  List<Widget> gestureImageBuilder() {
    List<Widget> gestureImageList = [];
    for (int i = 0; i < widget.images.length; i++) {
      gestureImageList.add(
        Container(
          margin: const EdgeInsets.only(right: 5, left: 5, bottom: 15, top: 15),
          decoration: const BoxDecoration(boxShadow: [BoxShadow(color: Colors.black45, offset: Offset(2, 2), blurRadius: 15)]),
          child: GestureDetector(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18.0),
              child: Container(
                  child: widget.images[i],
              ),
            ),
            onTap: () {
              setState(() {
                widget.moveHandler(widget.images[i]);
              });
            },
          ),
        )
      );
    }
    return gestureImageList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: gestureImageBuilder(),
      ),
    );
  }
}
