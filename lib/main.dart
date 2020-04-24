import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parcelo/colorsParcelo.dart';
import 'package:parcelo/network/services/post/signIn_service.dart';

import 'package:parcelo/profile/profile.dart';
import 'package:parcelo/search/search.dart';
import 'package:parcelo/signIn/firstSignInView.dart';

import 'home/home.dart';
import 'home/newHome.dart';

void main() {
  runApp(MaterialApp(
      title: 'Parcelo',
      theme: ThemeData(fontFamily: 'Asap'),
      debugShowCheckedModeBanner: false,
      home: MainView()));
}

class MainView extends StatefulWidget {
  @override
  MainViewState createState() => MainViewState();
}

class MainViewState extends State<MainView>
    with SingleTickerProviderStateMixin {
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
        statusBarColor: Colors.white, statusBarBrightness: Brightness.dark));

    makeSignInRequest();
    return Scaffold(
        backgroundColor: Colors.white,
        primary: false,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.dark,
            child: PageView(
              controller: pageController,
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Profile(),
                NewHome(),
                FirstSignInView(),
                Search()
              ],
            )));
  }
}
