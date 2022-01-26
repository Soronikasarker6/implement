import 'package:flutter/material.dart';
import 'package:flutter_particle_background/flutter_particle_background.dart';
import 'package:particles_flutter/particles_flutter.dart';
import 'package:implement/widget/circular_particle.dart';
import 'package:implement/widget/animated_background.dart';
class Search extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(

      body: WaveDemoHomePage(),
    );
  }
}
