import 'package:flutter/material.dart';
import 'package:flutter_particle_background/flutter_particle_background.dart';
import 'package:particles_flutter/particles_flutter.dart';

class Search extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(

      home: Scaffold(
        appBar: AppBar(
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20.0,
          fontWeight: FontWeight.bold),
         title: Center(child: Text('Search')),
         flexibleSpace:ParticleBackground(
            backgroundColor: Colors.black,
            multiColor: true,
            numberOfParticles: 50,
            biggestSize: 6,
            smallestSize: 3,
            blur: false,
            allFilled: true,
            highestSpeed: 1.1,
            slowestSpeed: 0.2,
          ),
        ),
        body: CircularParticle(
          key: UniqueKey(),
          awayRadius: 80,
          numberOfParticles: 100,
          speedOfParticles: 1,
          height: screenHeight,
          width: screenWidth,
          onTapAnimation: true,
          particleColor: Colors.black,
          awayAnimationDuration: Duration(milliseconds: 1000),
          maxParticleSize: 8,
          isRandSize: true,
          isRandomColor: true,
          randColorList: [
            Colors.red,
            Colors.green,
          ],
          awayAnimationCurve: Curves.easeInOut,
          enableHover: false,
          hoverColor: Colors.orange,
          hoverRadius: 90,
          connectDots: true, //not recommended
        ),

      )
    );
  }
}
