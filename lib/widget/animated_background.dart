import 'dart:math';

import 'package:flutter/material.dart';
import 'package:floating_bubbles/floating_bubbles.dart';

class MyClipPath extends AnimatedWidget {
  final Animation<double> animation;

  MyClipPath(this.animation)
      : super(listenable: animation);

  final Color backgroundColor = Colors.white70;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50),
      ],
    );
  }
}


class MyAnimation extends StatefulWidget {
  @override
  _MyAnimationState createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation>
    {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: FloatingBubbles.alwaysRepeating(
            noOfBubbles: 20,
            colorOfBubbles: Colors.white70,
            sizeFactor: 0.06 ,
            opacity: 50,
            paintingStyle: PaintingStyle.stroke,
            strokeWidth: 10,
            shape: BubbleShape.roundedRectangle, // circle is the default. No need to explicitly mention if its a circle.
          ),
        ),
      ],);
    // return
  }
}


