import 'package:animations/animations.dart';
import 'package:implement/page/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

const double fabSize = 30;

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
            color: Theme.of(context).primaryColor,
          ),
          height: fabSize,
          width: fabSize,
          child: Icon(Icons.remove_red_eye, color: Colors.white),
        ),
      );
}
