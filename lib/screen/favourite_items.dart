import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_particle_background/flutter_particle_background.dart';
import 'package:implement/widget/favourite_widget.dart';

class FavouriteItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        titleTextStyle: TextStyle(color: Colors.black87, fontSize: 20.0,
            fontWeight: FontWeight.bold),
        title: Center(child: Text('Favourite')),
        flexibleSpace:ParticleBackground(
          backgroundColor: Colors.white,
          multiColor: true,
          particleColor: Colors.blue,
          numberOfParticles: 200,
          biggestSize: 6,
          smallestSize: 4,
          blur: false,
          allFilled: true,
          highestSpeed: 1.1,
          slowestSpeed: 0.2,
        ),
      ),
      body:MyTweenAnimate(),
    );
  }
}
