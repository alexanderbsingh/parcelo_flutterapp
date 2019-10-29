import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'browse.dart';
import 'delivery.dart';
import 'homeToolbar.dart';

import 'package:parcelo/colorsParcelo.dart';

void main(){
  runApp(MaterialApp(
    title: 'Parcelo',
    home: Home()
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
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
      body: Column(
        children: <Widget>[
          HomeToolbar(),
          Padding(padding: EdgeInsets.only(bottom: 10),),
          Expanded(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                Container(
                  height: 40,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                      ),
                      TabBar(
                        labelColor: ColorsParcelo.PrimaryTextColor,
                        labelStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        labelPadding: EdgeInsets.only(right: 10),
                        indicator: UnderlineTabIndicator(
                          insets: EdgeInsets.only(right: 10, bottom: 0),
                          borderSide: BorderSide(
                            width: 1.4,
                            color: ColorsParcelo.PrimaryTextColor
                          ),
                        ),
                        isScrollable: true,
                        controller: _tabController,
                        tabs: [Text("Browse"), Text("Delivery")],
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),

                Container(
                  height: 10000,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Browse(),
                      Delivery()
                    ]
                  ),
                )

              ],
            ),
          )
        ],
      )
    );
  }
}



