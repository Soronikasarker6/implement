import 'package:animations/animations.dart';
import 'package:implement/page/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

const double fabSize = 60;

class CustomFABWidget extends StatelessWidget {
  final ContainerTransitionType transitionType;

  const CustomFABWidget({
    Key key,
    @required this.transitionType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => OpenContainer(
        transitionDuration: Duration(seconds: 1),
        openBuilder: (context, _) => DetailsPage(),
        closedShape: CircleBorder(),
        closedColor: Theme.of(context).primaryColor,
        closedBuilder: (context, openContainer) => Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.pink,
          ),
          height: fabSize,
          width: fabSize,
          child: Icon(Icons.message_rounded, color: Colors.black, size: 30.0,),
        ),
      );
}
