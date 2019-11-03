import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:parcelo/profile.dart';
import 'home.dart';
import 'package:parcelo/search.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      primary: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        elevation: 0,
      ),
      body: PageView(
        controller: pageController,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Profile(),
          Home(),
          Search()
        ],
      )
    );
  }
}



