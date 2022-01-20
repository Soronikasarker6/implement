import 'package:flutter/material.dart';

class MySkewAnimationScreen extends StatefulWidget {
  @override
  _MySkewAnimationScreenState createState() => _MySkewAnimationScreenState();
}

class _MySkewAnimationScreenState extends State<MySkewAnimationScreen> with SingleTickerProviderStateMixin{

  AnimationController myAnimationController;

  @override
  void initState() {
    super.initState();
    myAnimationController = AnimationController(
        duration: Duration(seconds: 5),
        vsync: this);
    myAnimationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      alignment: Alignment.center,
      child: AnimatedBuilder(
        animation: myAnimationController,
        child: Container(
          width: 100,
          height: 300,
          child: Image.asset('asset/restaurant.jpg'),
        ),
        builder: (context, widget) => Transform.scale(
          // transform: Matrix4.skewY(myAnimationController.value * 0.6),
          scale: myAnimationController.value * 1,
          child: widget,
        ),
      ),
    );
  }
}