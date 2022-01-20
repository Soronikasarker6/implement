import 'package:flutter/material.dart';
import 'package:implement/widget/animated_background.dart'
    ;
class MyTweenAnimate extends StatefulWidget {

  @override
  _MyTweenAnimateState createState() => _MyTweenAnimateState();
}

class _MyTweenAnimateState extends State<MyTweenAnimate> with SingleTickerProviderStateMixin{
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();
  }

  Animatable<Color> background = TweenSequence<Color>([
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Colors.red,
        end: Colors.green,
      ),
    ),
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Colors.green,
        end: Colors.blue,
      ),
    ),
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Colors.blue,
        end: Colors.pink,
      ),
    ),
  ]);
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Scaffold(
            body: Container(
              child: MyAnimation(),
              color: background
                  .evaluate(AlwaysStoppedAnimation(_controller.value)),
            ),
          );
        });
  }
}
