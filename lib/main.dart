import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:parcelo/profile/profile.dart';
import 'package:parcelo/search/search.dart';

import 'home/home.dart';

void main(){
  runApp(MaterialApp(
    title: 'Parcelo',
      theme: ThemeData(fontFamily: 'Asap'),
      
      home: MainView()
  ));
}

class MainView extends StatefulWidget {
  @override
  MainViewState createState() => MainViewState();
}

class MainViewState extends State<MainView> with SingleTickerProviderStateMixin {
  static TabController tabController;
  static PageController pageController;

  @override
  void initState() {
    super.initState();

    pageController = PageController(initialPage: 1);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.light
    ));
    return Scaffold(
        backgroundColor: Colors.white,
        primary: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          brightness: Brightness.light,
          elevation: 0,
        ),
        body: AnnotatedRegion<SystemUiOverlayStyle>(
         value: SystemUiOverlayStyle.light,
         child: PageView(
            controller: pageController,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Profile(),
              Home(),
              Search()
            ],
          )
        )
        );
  }
}



