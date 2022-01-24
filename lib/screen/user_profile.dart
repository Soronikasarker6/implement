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
      body:
          Column(
            children: [
              Stack(
      alignment: Alignment.center,
                children: [
                    ClipPath(
                     clipper: WaveClipper(),
                     child: Container(height: 180.0,
                       decoration: BoxDecoration(
                           gradient: LinearGradient(
                               begin:Alignment.bottomLeft,
                               end:Alignment.topRight,
                           colors: [Color(0xffEC797B),Color(0xffc675e7)])

                     ),
                       child: ProfileWidget(
                         imagePath: user.imagePath,
                         onClicked: ()async{  },
                       ),
                   ),
                  ),
                ]
              ),
              buildName(user),
            ],
          ),


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
        SizedBox(height: 10.0,),
        FadeInImage.assetNetwork(fadeInDuration:Duration(seconds: 2),
            height: 200.0,
            placeholder: 'asset/friends-loading.gif',
            image: 'https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dmlld3xlbnwwfHwwfHw%3D&w=1000&q=80'),
        MySkewAnimationScreen(),

      ]
    );
  }
}

class WaveClipper extends  CustomClipper<Path> {
  @override
   getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    path.lineTo(0.0, height-20 );

    var firstControlPoint =new Offset (width/4, height/2);
    var firstEndPoint =new Offset (width/2.0, height-30);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var SecondControlPoint =new Offset (width/1.5, height);
    var SecondEndPoint =new Offset (width, height-50);
    path.quadraticBezierTo(SecondControlPoint.dx, SecondControlPoint.dy,
        SecondEndPoint.dx, SecondEndPoint.dy);

    path.lineTo(width, height-50);
    path.lineTo(width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip( CustomClipper oldClipper) {

    return true;
  }
}


