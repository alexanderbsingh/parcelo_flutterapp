import 'package:flutter/material.dart';
import 'package:parcelo/Store/storeBottom.dart';
import 'package:parcelo/Store/storeTop.dart';
import 'package:parcelo/models/store.dart';
import 'package:parcelo/network/services/shop_service.dart';

import '../argParcelo.dart';
import '../colorsParcelo.dart';
import '../globalVar.dart';

class StoreView extends StatefulWidget {
  final String storeID;

  StoreView({@required this.storeID});

  @override
  _StoreViewState createState() => _StoreViewState(storeID: storeID);
}

class _StoreViewState extends State<StoreView> {
  var typeHeader = ['', 'Recent', 'Only on Parcelo'];
  var typeList = ['top', 'product', 'store'];  

  final String storeID;
  bool isLiked = false;

  _StoreViewState({@required this.storeID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          FutureBuilder(
            future: fetchStore(storeID),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                StoreFull store = snapshot.data;
                oldSnapshotStore = snapshot.data;
                return ListView( 
                  padding: EdgeInsets.only(top: 0),  
                  children: <Widget>[
                    storeTop(context, store),
                    storeBottom(context, store),
                  ],
                );
              }
              else if (oldSnapshotStore != null) {
              StoreFull store = snapshot.data;
                return ListView( 
                  padding: EdgeInsets.only(top: 0),  
                  children: <Widget>[
                    storeTop(context, store),
                    storeBottom(context, store),
                  ]
                );
              } else if (snapshot.connectionState == ConnectionState.none) {
                return Container(height: 10, width: 10, color: Colors.white,);
              } else if (snapshot.connectionState == ConnectionState.active) {
                return Container(height: 10, width: 10, color: Colors.white,);
              } else if (snapshot.connectionState == ConnectionState.waiting){
                return Container(height: 10, width: 10, color: Colors.white,);
                
              }
            },
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
    );
  }
}