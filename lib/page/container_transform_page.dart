import 'package:animations/animations.dart';

import 'package:implement/screen/favourite_items.dart';
import 'package:implement/screen/search.dart';
import 'package:implement/screen/user_profile.dart';
import 'package:implement/widget/card_widget.dart';
import 'package:implement/widget/custom_fab_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'details_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:carousel_pro/carousel_pro.dart';


class ContainerTransformPage extends StatefulWidget {

  @override
  State<ContainerTransformPage> createState() => _ContainerTransformPageState();
}

class _ContainerTransformPageState extends State<ContainerTransformPage> {
  static bool isCheck = true;
  int _selectedIndex = 0;
  PageController pageController = PageController();


  final ContainerTransformPage _containerTransformPage= ContainerTransformPage();
  final Search _search= Search();
  final FavouriteItem _favouriteItem= FavouriteItem();
  final MyPainter _userProfile= MyPainter();

  Widget _showPage ;

  Widget _pageChooser(int page){
    switch(page){
      case 0:
        return _containerTransformPage;
        break;
      case 1:
        return _search;
        break;
      case 2:
        return _favouriteItem;
        break;
      case 3:
        return _userProfile;
        break;
      default:
        return Container(
          child: Center(
            child: Text(
              'No Data Found'
            ),
          ),
        );
    }
  }

  void onTapped(int index) {
    setState(() {
      _showPage = _pageChooser(index) ;
    });
    pageController.jumpToPage(index);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

   Widget build(BuildContext context) {

      final icon = CupertinoIcons.moon_stars;
     final isDarkMode = isCheck? ThemeData.dark(): ThemeData.light();
     final transitionType = ContainerTransitionType.fade;
     final List<Widget> items = <Widget>[
       Icon(Icons.home, size: 30, color: Colors.black, ),
       Icon(Icons.search, size: 30,color: Colors.black),
       Icon(Icons.favorite_outlined, size: 30,color: Colors.black),
       Icon(Icons.person, size: 30,color: Colors.black),
     ];

    return Scaffold(

      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        child: Stack(
          clipBehavior: Clip.none,
          children:[ Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Expanded(
                flex: 8,
                child: PageView(
                  controller: pageController,
                  onPageChanged: (index){
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  children: [ Container(
                      child: Column(
                                children: [
                                      Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Icon(Icons.search, color: Color(0xff797A7C),),
                            filled: true,
                            hintText: "Search Restaurant....",
                            hintStyle: TextStyle(color: Color(0xff797A7C),),
                            suffixIcon: Icon(Icons.mic, color: Color(0xff797A7C),),
                          ),),
                        SizedBox(
                            height: 200.0,
                            width: double.infinity,
                            child: Carousel(
                              images: [
                                NetworkImage('https://upload.wikimedia.org/wikipedia/commons/6/62/Barbieri_-_ViaSophia25668.jpg'),
                                NetworkImage('https://i0.wp.com/theluxurytravelexpert.com/wp-content/uploads/2018/10/header.jpg?fit=1267%2C713&ssl=1'),
                                NetworkImage('https://previews.123rf.com/images/dit26978/dit269781611/dit26978161100101/69966223-3d-rendering-nice-view-from-luxury-hotel-restaurant.jpg'),
                                NetworkImage('http://architizer-prod.imgix.net/media/1448872317573Commercial_3D_Interior_Rendering_Restaurant_Night_View.jpg?q=60&auto=format,compress&cs=strip&w=1680'),
                              ],
                              dotSize: 4.0,
                              dotSpacing: 15.0,
                              dotColor: Colors.orange,
                              indicatorBgPadding: 5.0,
                              dotBgColor: Colors.transparent.withOpacity(0.5),
                              borderRadius: true,
                              moveIndicatorFromBottom: 180.0,
                              noRadiusForIndicator: true,
                            )),
                        SizedBox(
                          height: 15.0,
                        ),
                      ],
                    ),),
                                  Expanded(flex: 8,
                  child: StaggeredGridView.countBuilder(

                    crossAxisCount: 4,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    itemCount: 10,
                    staggeredTileBuilder: (index) {
                      final crossAxisCount = 2;
                      final mainAxisCount = index.isEven ? 5 : 3;

                      return StaggeredTile.count(crossAxisCount, mainAxisCount);
                    },
                    itemBuilder: (context, index) => OpenContainer(
                      transitionType: transitionType,
                      transitionDuration: Duration(seconds: 1),
                      openBuilder: (context, _) => DetailsPage(index: index),
                      closedBuilder: (context, VoidCallback openContainer) =>
                          CardWidget(
                            index: index,
                            onClicked: openContainer,
                          ),),),
                  ),
                ],
              ),),
                    _showPage,
                    _favouriteItem,
                    _userProfile
                  ],
                ),
              ),
            ],
          )],
        ),),

      bottomNavigationBar:
      CurvedNavigationBar
        (
        buttonBackgroundColor: Color(0xff355B60),
        backgroundColor: Color(0xFFDDC2A2),
        height: 60, index: _selectedIndex,
        onTap: onTapped, items: items,
      ),
      floatingActionButton:   CustomFABWidget(transitionType: transitionType),
    );
  }
}


