import 'package:implement/model/user.dart';
import 'package:implement/widget/ProfileWidget.dart';
import 'package:implement/screen/user_profile_implement.dart';
import 'package:flutter/material.dart';
import 'package:implement/widget/transform_animation.dart';

class MyPainter extends StatefulWidget {
  @override
  State<MyPainter> createState() => _MyPainterState();
}

class _MyPainterState extends State<MyPainter>{


  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      body:  ListView(
        children: [
          Stack(
      alignment: Alignment.center,
            children: [
              Container(decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.bottomLeft, end:Alignment.topRight,
                colors: [Color(0xffEC797B),Color(0xff8E44AD)])
              ),
               child: ClipPath(
                 clipper: WaveClipper(),
                 child: ProfileWidget(
                    imagePath: user.imagePath,
                    onClicked: ()async{  },
                  ),
               ),
              ),
            ]
          ),
          SizedBox(height: 24,),
          buildName(user),
        ],
      )
    );
  }

  Widget buildName(User user) {
   return Column(
      children: [
        Text(
          user.name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(
          user.email,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.grey),
        ),
        FadeInImage.assetNetwork(fadeInDuration:Duration(seconds: 1),
            placeholder: 'asset/friends-loading.gif',
            image: 'https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dmlld3xlbnwwfHwwfHw%3D&w=1000&q=80'),
        MySkewAnimationScreen(),

      ]
    );
  }
}

class WaveClipper extends  CustomClipper<Path> {
  @override
  Path getClip(Size size) {}

  @override
  bool shouldReclip( CustomClipper<Path> oldClipper) {

    return false;
  }
}


