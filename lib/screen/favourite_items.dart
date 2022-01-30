import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_particle_background/flutter_particle_background.dart';
import 'package:implement/widget/favourite_widget.dart';
import 'package:implement/menu/setting_page.dart';

class FavouriteItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        titleTextStyle: TextStyle(color: Colors.black87, fontSize: 20.0,
            fontWeight: FontWeight.bold),
        title: Center(child: Text('Favourite')),
        actions: [
          PopupMenuButton<int>(
              onSelected: (item)=> onSelected(context,item),
              itemBuilder: (context)=>[
            PopupMenuItem<int>(
                value: 0,
                child: Text('Settings'))
          ])
        ],
        flexibleSpace:ParticleBackground(
          backgroundColor: Colors.black,
          multiColor: true,
          particleColor: Colors.blue,
          numberOfParticles: 200,
          biggestSize: 6,
          smallestSize: 4,
          blur: true,
          allFilled: true,
          highestSpeed: 1.1,
          slowestSpeed: 0.2,
        ),
      ),
      body:MyTweenAnimate(),
    );
  }

  onSelected(BuildContext context, int item) {
    switch(item){
      case 0:
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SettingPage()),
        );
        break;
    }
  }
}
