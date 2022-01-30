import 'dart:math' as math;
import 'package:flutter/material.dart';

class CustomFABWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
         ExpandableFab(
          distance: 60.0,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                height: 500,
                width: 350,
                color: Colors.white,
                child:Stack(
                    children: [
                      AnimatedContainer(duration: Duration(milliseconds: 1000),
                        color: Color(0xffF48020),
                        child: Container(
                          margin: EdgeInsets.only(top: 50, bottom: 30,left: 20,right: 20),
                          child: Text("Please fill out the form below to start"
                              " chatting with the next available agent.",
                            style: TextStyle(color: Colors.black,wordSpacing: 2.0),),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 144),
                        transform: Matrix4.translationValues(0, 69, 1),
                        decoration: BoxDecoration(
                            color: Color(0xffF48020),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            )
                        ),
                      ),
                      AnimatedContainer(
                        margin: EdgeInsets.only(left: 25,right: 20,top: 20,bottom: 140),
                        transform: Matrix4.translationValues(0, 65, 1),
                        decoration:  BoxDecoration(
                            color: Colors.white,
                            boxShadow: [BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all( 10.0),
                                child: TextField(decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(color: Colors.orange),
                                    ),enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey)
                                ),
                                    labelText: 'Name'
                                ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all( 10.0),
                                child: TextField(decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(color: Colors.orange),
                                  ),enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey)
                                ),
                                  labelText: 'Email',
                                ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all( 10.0),
                                child: TextField(
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(color: Colors.orange),
                                    ),enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.grey)
                                  ),
                                    labelText: 'Discussion Topic',
                                  ),),
                              ),
                              ElevatedButton(
                                  style: TextButton.styleFrom(
                                      minimumSize: Size(280, 50),
                                      backgroundColor: Color(0xffF48020)
                                  ),onPressed: (){},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.send_rounded, color: Colors.black,),
                                      SizedBox(width: 10.0,),
                                      Text("Send ",
                                          style: TextStyle(color: Colors.black,wordSpacing: 2.0,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ))
                            ],
                          ),
                        ),
                        duration:Duration(milliseconds: 1000) ,
                      ),
                    ]
                ),
              ),
            )
          ],
        ),
      ],

      );
  }
}

@immutable
class ExpandableFab extends StatefulWidget {
  final bool initialOpen;
  final double distance;
  final List<Widget> children;

 ExpandableFab({
    this.initialOpen,
    this.distance,
    this.children,
  });


  @override
  _ExpandableFabState createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> expandAnimation;
  bool _open = false;


  _ExpandableFabState({this.expandAnimation, this.controller});

  @override
  void initState() {
    super.initState();
    _open = widget.initialOpen ?? false;
    controller = AnimationController(
      value: _open ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    expandAnimation = CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
      parent: controller,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _open = !_open;
      if (_open) {
        controller.forward();
      } else {
        controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.bottomRight,
        clipBehavior: Clip.none,
        children: [
          _buildTapToCloseFab(),
          ..._buildExpandingActionButtons(),
          _buildTapToOpenFab(),
        ],
      ),
    );
  }

  Widget _buildTapToCloseFab() {
    return SizedBox(
      width: 56.0,
      height: 56.0,
      child: Center(
        child: Material(
          color: Colors.orange,
          shape: CircleBorder(),
          clipBehavior: Clip.antiAlias,
          elevation: 4.0,
          child: InkWell(
            onTap: _toggle,
            child: Icon(
              Icons.close,
              color: Colors.black, size: 30.0,
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildExpandingActionButtons() {
    final children = <Widget>[];
    final count = widget.children.length;
    final step = 90.0 / (count - 1);
    for (var i = 0, angleInDegrees = 0.0;
    i < count;
    i++, angleInDegrees += step) {
      children.add(
        _ExpandingActionButton(
          directionInDegrees: angleInDegrees,
          maxDistance: widget.distance,
          progress: expandAnimation,
          child: widget.children[i],
        ),
      );
    }
    return children;
  }

  Widget _buildTapToOpenFab() {
    return AnimatedOpacity(
      opacity: _open ? 0.0 : 1.0,
      curve: Interval(0.25, 1.0, curve: Curves.easeInOut),
      duration: const Duration(milliseconds: 250),
      child: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: _toggle,
        child: const Icon(Icons.message_rounded,color: Colors.black, size: 30.0,),
      ),
    );
  }
}


class _ExpandingActionButton extends StatelessWidget {
  final double directionInDegrees;
  final double maxDistance;
  final Animation<double> progress;
  final Widget child;

  _ExpandingActionButton({this.directionInDegrees, this.maxDistance, this.progress, this.child,});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (context, child) {
        final offset = Offset.fromDirection(
          directionInDegrees * (math.pi / 180.0),
          progress.value * maxDistance,
        );
        return Positioned(
          right: 0.0 + offset.dx,
          bottom:40.0 + offset.dy,
          child: Transform.rotate(
            angle: (1.0 - progress.value) * math.pi / 2,
            child: child,
          ),
        );
      },
      child: FadeTransition(
        opacity: progress,
        child: child,
      ),
    );
  }
}





