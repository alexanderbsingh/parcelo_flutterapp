import 'package:flutter/material.dart';
import 'package:parcelo/cells/cartCell.dart';
import 'package:parcelo/globalVar.dart';

import '../whichService.dart';
import 'home.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    isInCart = true;
    return Stack(
      alignment: Alignment.bottomLeft,
      children: <Widget>[
        FutureBuilder(
          future: whichService('cart'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              oldSnapshotCart = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, pos) {
                  return cartCell();
                },
                itemCount: 2,
              );
            
            } else if (oldSnapshotCart != null) {
              return ListView.builder(
                itemBuilder: (context, pos) {
                  return cartCell();
                },
                itemCount: 2,
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
          height: 100,
          width: MediaQuery.of(context).size.width,
          color: Colors.green,
        ),
      ],
    );
  }
}
