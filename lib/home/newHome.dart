import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parcelo/home/cart.dart';
import 'package:parcelo/home/cartBottom.dart';
import 'package:parcelo/models/cartModel.dart';

import '../globalVar.dart';
import 'browse.dart';
import 'homeToolbar.dart';

class NewHome extends StatefulWidget {
  @override
  NewHomeState createState() => NewHomeState();
}

class NewHomeState extends State<NewHome> with SingleTickerProviderStateMixin {
  TabController _tabController;
  bool isChosenTabCart = false;

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
    return Visibility(
        visible: !isInCart,
        child: Scaffold(
          backgroundColor: Colors.white,
          primary: false,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            brightness: Brightness.light,
            elevation: 0,
          ),
          body: Stack(children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: homeToolbar(context),
                ),
                Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: CustomScrollView(
                      slivers: <Widget>[
                        SliverAppBar(
                          floating: true,
                          snap: true,
                          elevation: 0,
                          pinned: false,
                          backgroundColor: Colors.white,
                          expandedHeight: 60,
                          brightness: Brightness.light,
                          flexibleSpace: FlexibleSpaceBar(
                              background: Padding(
                                  padding: EdgeInsets.only(top: 25, left: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      TabBar(
                                        labelColor: Colors.black,
                                        labelStyle: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Asap'),
                                        labelPadding: EdgeInsets.only(right: 10),
                                        indicator: UnderlineTabIndicator(
                                          insets: EdgeInsets.only(right: 10),
                                          borderSide: BorderSide(
                                              width: 1.4, color: Colors.black),
                                        ),
                                        isScrollable: true,
                                        controller: _tabController,
                                        tabs: [Text("Upptäck"), Text("Kundvagn")],
                                        onTap: (index) {
                                          print(
                                              'index of tabbar: ' + index.toString());
                                          if (_tabController.index == 0) {
                                            isInCart = false;
                                            streamCartBottom.add(false);
                                            streamHomeContainerHeight.add(800);
                                          } else {
                                            isInCart = true;
                                            streamCartBottom.add(true);
                                            //streamHomeContainerHeight.add(300);
                                          }
                                        },
                                      ),
                                    ],
                                  ))),
                        ),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                            return StreamBuilder<double>(
                                stream: streamHomeContainerHeight.stream,
                                builder: (context, snapshot) {
                                  return Container(
                                    height: /*snapshot.hasData ? snapshot.data: */ 800.0,
                                    child: TabBarView(
                                        controller: _tabController,
                                        physics: NeverScrollableScrollPhysics(),
                                        children: [
                                          Browse(),
                                          Cart(
                                            streamCartModel: streamCartModel,
                                          )
                                        ]),
                                  );
                                });
                          }, childCount: 1),
                        )
                      ],
                    )),
              ],
            ),
            StreamBuilder<bool>(
                stream: streamCartBottom.stream,

                builder: (context, snapshot) {
                  return Visibility(
                    visible: snapshot.hasData ? snapshot.data : false,
                    child: cartBottom(context, streamCartModel)
                    );

                })
          ]),
        ),
      );
  }
}
