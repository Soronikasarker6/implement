import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {

  final String imagePath;
  final VoidCallback onClicked;


  ProfileWidget({this.imagePath, this.onClicked});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return Center(
      child: Stack(
          children: [
            buildImage(),
            Positioned(
              child: buildEditIcon(color),
              bottom: 0,
              right: 4,)
    ])
    );
  }
  Widget buildImage() {
    final image = NetworkImage(imagePath);

    return ClipOval(
      child: Material(
        color: Colors.transparent ,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
        child: InkWell(onTap: onClicked,),
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color)=> buildCircle(
    color: Color(0xFF3793E5),
    all: 8,
    child: Icon( Icons.edit,
        color: Colors.white,
        size: 20,
      ),
  );
  buildCircle({Color color, double all, Icon child}) {
    return ClipOval(
      child: Container(
        padding: EdgeInsets.all(all),
        child: child,
        color: color,
      ),
    );
  }
}

