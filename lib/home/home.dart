import 'package:flutter/material.dart';
import 'package:parcelo/globalVar.dart';
import 'package:parcelo/home/cart.dart';

import '../argParcelo.dart';
import 'browse.dart';
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
            Padding(padding: EdgeInsets.only(bottom: ArgParcelo.smallMargin),),
            Expanded(
              child: ListView(
                physics: isBrowse == true ? AlwaysScrollableScrollPhysics() : NeverScrollableScrollPhysics(),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 15),
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
                          labelPadding: EdgeInsets.only(right: ArgParcelo.smallMargin),
                          indicator: UnderlineTabIndicator(
                            insets: EdgeInsets.only(right: ArgParcelo.smallMargin, bottom: 0),
                            borderSide: BorderSide(
                                width: 1.4,
                                color: ColorsParcelo.PrimaryTextColor
                            ),
                          ),
                          isScrollable: true,
                          controller: _tabController,
                          tabs: [Text("Browse"), Text("Cart")],
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: ArgParcelo.smallMargin),
                  ),

                  Container(
                    height: 740,
                    padding: EdgeInsets.only(left: 0, right: 0),
                    child: TabBarView(
                        controller: _tabController,
                        children: [
                          Browse(),
                          Cart()
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
