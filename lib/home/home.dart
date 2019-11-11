import 'package:flutter/material.dart';

import '../argParcelo.dart';
import 'browse.dart';
import 'delivery.dart';
import 'homeToolbar.dart';

import 'package:parcelo/colorsParcelo.dart';

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
        body: Column(
          children: <Widget>[
            homeToolbar(context),
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
                          padding: EdgeInsets.only(right: ArgParcelo.margin),
                        ),
                        TabBar(
                          labelColor: ColorsParcelo.PrimaryTextColor,
                          labelStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Asap'
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
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: TabBarView(
                        controller: _tabController,
                        children: [
                          Browse(),
                          Delivery()
                        ]
                    ),
                  ),
                ],
              ),
            )
          ],
        )
    );
  }
}
