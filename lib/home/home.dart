import 'dart:async';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parcelo/customWidget/customExpanded.dart';
import 'package:parcelo/globalVar.dart';
import 'package:parcelo/home/cart.dart';
import 'package:parcelo/home/cartBottom.dart';
import 'package:parcelo/models/cartModel.dart';

import '../argParcelo.dart';
import 'browse.dart';
import 'homeToolbar.dart';

import 'package:parcelo/colorsParcelo.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
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

  StreamController<double> streamHomeContainerHeight =
      StreamController.broadcast();
  StreamController<bool> streamCartBottom = StreamController.broadcast();
  StreamController<CartModel> streamCartModel = StreamController.broadcast();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        primary: false,
        body: Column(
          children: <Widget>[
            homeToolbar(context),
            Padding(
              padding: EdgeInsets.only(bottom: ArgParcelo.smallMargin),
            ),
            Expanded(
              child: Stack(alignment: Alignment.topLeft, children: <Widget>[
                ListView(
                  shrinkWrap: true,
                  physics: /*isInCart ? NeverScrollableScrollPhysics() : */ AlwaysScrollableScrollPhysics(),
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
                            onTap: (index) {
                              print('index of tabbar: ' + index.toString());
                              if (_tabController.index == 0) {
                                isInCart = false;
                                streamCartBottom.add(false);
                                streamHomeContainerHeight.add(800);
                              } else {
                                isInCart = true;
                                streamCartBottom.add(true);
                                streamHomeContainerHeight.add(300);
                              }
                              //setState(() {});
                            },
                            labelStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Asap'),
                            labelPadding:
                                EdgeInsets.only(right: ArgParcelo.smallMargin),
                            indicator: UnderlineTabIndicator(
                              insets: EdgeInsets.only(
                                  right: ArgParcelo.smallMargin, bottom: 0),
                              borderSide: BorderSide(
                                  width: 1.4,
                                  color: ColorsParcelo.PrimaryTextColor),
                            ),
                            isScrollable: true,
                            controller: _tabController,
                            tabs: [Text("Upptäck"), Text("Kundvagn")],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: ArgParcelo.smallMargin),
                    ),
                    StreamBuilder<double>(
                        stream: streamHomeContainerHeight.stream,
                        builder: (context, snapshot) {
                          return Container(
                            height: snapshot.hasData ? snapshot.data : 800.0,
                            child: TabBarView(
                                physics: NeverScrollableScrollPhysics(),
                                key: tabKey,
                                controller: _tabController,
                                children: [
                                  Browse(),
                                  Cart(
                                    streamCartModel: streamCartModel,
                                  )
                                ]),
                          );
                        }),
                  ],
                ),
                StreamBuilder<bool>(
                    stream: streamCartBottom.stream,
                    builder: (context, snapshot) {
                      return Visibility(
                          visible: snapshot.data,
                          child: cartBottom(context, streamCartModel));
                    })
              ]),
            )
          ],
        ));
  }
}
