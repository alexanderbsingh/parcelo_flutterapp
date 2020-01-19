import 'package:flutter/material.dart';
import 'package:parcelo/Store/storeBottom.dart';
import 'package:parcelo/Store/storeTop.dart';
import 'package:parcelo/globalVar.dart';
import 'package:parcelo/models/store.dart';

import '../argParcelo.dart';
import '../colorsParcelo.dart';

class StoreView extends StatefulWidget {
  final Store store;

  StoreView({@required this.store});

  @override
  _StoreViewState createState() => _StoreViewState(store: store);
}

class _StoreViewState extends State<StoreView> {
  var typeHeader = ['', 'Recent', 'Only on Parcelo'];
  var typeList = ['top', 'product', 'store'];  

  final Store store;
  bool isLiked = false;

  _StoreViewState({@required this.store});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('will pop');
        oldSnapshot = null;
      },
      child: Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
          children: <Widget>[
            ListView(   
              children: <Widget>[
                storeTop(context, store),
                storeBottom(context, store),
              
              ],
            ),
            Container(
              height: 134,
              child: AppBar(
                backgroundColor: Colors.transparent,
                brightness: Brightness.light,
                elevation: 0,
                actions: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: ArgParcelo.margin),
                    child: GestureDetector(
                      onTap: () {
                        print('pressed, save');
                        isLiked = !isLiked;
                        setState(() {});
                      },
                      child: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        size: 24,
                        color: ColorsParcelo.PrimaryTextColor,
                      )
                    ),
                  ),
                ],
                leading: GestureDetector(
                      onTap: () {
                        print('pressed, exit');
                        //oldSnapshot = null;
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.clear,
                        size: 24,
                        color: ColorsParcelo.PrimaryTextColor,
                      )
                    ),
              ),
            ),
          ]
        )
      ),
    );
  }
}