import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:implement/widget/animated_background.dart';

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
            body: Stack(
              children: [
                Container(
                  child: WaveWidget( //user Stack() widget to overlap content and waves
                    config: CustomConfig(
                      colors: [
                        Colors.white.withOpacity(0.3),
                        Colors.white.withOpacity(0.3),
                        Colors.white.withOpacity(0.3),
//the more colors here, the more wave will be
                      ],
                      durations: [4000, 5000, 7000],
//durations of animations for each colors,
// make numbers equal to numbers of colors
                      heightPercentages: [0.81, 0.82, 0.83,],
//height percentage for each colors.
                      blur: MaskFilter.blur(BlurStyle.solid, 5),
//blur intensity for waves
                    ),
                    waveAmplitude: 35.00, //depth of curves
                    waveFrequency: 2,
                    //number of curves in waves
                     //background colors
                    size: Size(double.infinity, double.infinity,
                    ),
                  ),
                color: background
                    .evaluate(AlwaysStoppedAnimation(_controller.value)),
              ),
              MyAnimation(),
              ]
            ),
          );
        });
  }
}
