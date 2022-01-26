import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wave/config.dart';
import 'package:particles_flutter/particles_flutter.dart';
import 'package:flutter_particle_background/flutter_particle_background.dart';
import 'package:wave/wave.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WaveDemoHomePage extends StatefulWidget {
  @override
  _WaveDemoHomePageState createState() => _WaveDemoHomePageState();
}

class _WaveDemoHomePageState extends State<WaveDemoHomePage> {

  _buildCard({
     Config config,
    Color backgroundColor = Colors.transparent,
     DecorationImage backgroundImage,

  })
  {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: WaveWidget(
        config: config,
        backgroundColor: backgroundColor,
        backgroundImage: backgroundImage,
        size: Size(double.infinity, double.infinity),
        waveAmplitude: 0,
      ),
    );
  }

  MaskFilter _blur;
  final List<MaskFilter> _blurs = [
    MaskFilter.blur(BlurStyle.normal, 10.0),
    MaskFilter.blur(BlurStyle.inner, 10.0),
    MaskFilter.blur(BlurStyle.outer, 10.0),
    MaskFilter.blur(BlurStyle.solid, 16.0),
  ];
  int _blurIndex = 0;
  MaskFilter _nextBlur() {
    if (_blurIndex == _blurs.length-1 ) {
      _blurIndex = 0;
    } else {
      _blurIndex = _blurIndex + 1;
    }
    _blur = _blurs[_blurIndex];
    return _blurs[_blurIndex];
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
        title: Center(child: Text('Search')),
        flexibleSpace:ParticleBackground(
          backgroundColor: Colors.black,
          multiColor: true,
          numberOfParticles: 50,
          biggestSize: 6,
          smallestSize: 3,
          blur: false,
          allFilled: true,
          highestSpeed: 2.0,
          slowestSpeed: 0.2,
        ),
        elevation: 10.0,
        backgroundColor: Colors.blueGrey[800],
        actions: <Widget>[
          IconButton(
            icon: Icon(_blur == null ? Icons.blur_off : Icons.blur_on),
            onPressed: () {
              setState(() {
                _blur = _nextBlur();
              });
            },
          )
        ],
      ),
      body: Stack(
        children: [
          CircularParticle(
            key: UniqueKey(),
            awayRadius: 80,
            numberOfParticles: 100,
            speedOfParticles: 1,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            particleColor: Colors.black.withOpacity(0.2),
            onTapAnimation: true,
            awayAnimationDuration: Duration(milliseconds: 500),
            maxParticleSize: 8,
            isRandSize: true,
            isRandomColor: true,
            randColorList: [
              Colors.red.withOpacity(0.8),
              Colors.green.withOpacity(0.8),
            ],
            awayAnimationCurve: Curves.easeInOut,
            enableHover: true,
            hoverColor: Colors.orange,
            hoverRadius: 90,
            connectDots: true, //not recommended
          ),
          _buildCard(
          config: CustomConfig(
            gradients: [
              [Colors.black26, Color(0xEE360602)],
              [Colors.grey, Colors.blueGrey],
              [Colors.blueGrey, Color(0x66FF9800)],
              [ Color(0x55FFEB3B),Colors.white70,]
            ],
            durations: [35000, 19440, 10800, 6000],
            heightPercentages: [0.81, 0.82, 0.83, 0.85],
            blur: _blur,
            gradientBegin: Alignment.bottomLeft,
            gradientEnd: Alignment.topRight,
          ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                        decoration:BoxDecoration(
                          shape: BoxShape.rectangle,
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://www.northeastern.edu/graduate/blog/wp-content/"
                                        "uploads/2021/03/Leadership-and-Professional-Success.jpg")
                            )
                        )
                    ),
                  ),
                   SizedBox(width: 10.0,),
                   Expanded(
                     flex: 7,
                     child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children:<Widget>  [
                          AnimatedTextKit(
                            isRepeatingAnimation: false,
                            animatedTexts: [
                              TyperAnimatedText("Speeding Up Your Business’s Success",
                      textStyle: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold,
                          decoration:TextDecoration.underline ),
                  ),
                            ],),
                          AnimatedTextKit(
                            pause: Duration(milliseconds: 1000),
                            isRepeatingAnimation: false,
                            animatedTexts: [
                              TypewriterAnimatedText("To make more successful is our key to business. So, we always ensure that "
                                  "your needs come first. As one of the major creators and publishers in the market by releasing"
                                  " many successful products, we have become a trusted partner of our clients. Now, we hope to "
                                  "earn your trust by delivering you customized solutions and services and be a part of your success.",
                                textStyle: TextStyle( color: Colors.black87, fontSize: 15.0, fontWeight: FontWeight.normal),
                              ),
                            ],)
                        ]
                  ),
                   ),
                ],
              ),
            ),
          ),


        ]
      ),
    );
  }
}