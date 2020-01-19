import 'package:flutter/material.dart';
import 'package:parcelo/Store/storeContent.dart';
import 'package:parcelo/globalVar.dart';
import 'package:parcelo/models/store.dart';

import '../argParcelo.dart';
import '../cellHeight.dart';
import '../colorsParcelo.dart';
import '../whichService.dart';

Widget storeBottom(BuildContext context, Store store) {
  var typeHeader = ['Popular', store.name + ' recomends'];
  var typeList = ['smallProduct', 'smallProduct'];


  print('old snapshot ' + oldSnapshot.toString());
  return Container(
    height: 700,
    color: Colors.white,
    child: ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, pos) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if(typeHeader[pos].isNotEmpty) Padding(
              padding: const EdgeInsets.only(left: 15, top: 10),
              child: Text(
                typeHeader[pos],
                style: TextStyle(
                  color: ColorsParcelo.PrimaryTextColor,
                  fontWeight: FontWeight.w600,
                  fontSize: ArgParcelo.subHeader
                ),
              ),
            ),

            Container(
              height: cellHeight(typeList[pos]),
              child: FutureBuilder(
                future: whichService(typeList[pos]),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    oldSnapshot = snapshot.data;
                    return storeContent(context, snapshot.data, typeList[pos]);
                    
                  } else if (oldSnapshot != null) {
                    return storeContent(context, oldSnapshot, typeList[pos]);

                  } else if (snapshot.connectionState == ConnectionState.none) {
                    return Container(height: 10, width: 10, color: Colors.white,);
                  } else if (snapshot.connectionState == ConnectionState.active) {
                    return Container(height: 10, width: 10, color: Colors.white,);
                  } else if (snapshot.connectionState == ConnectionState.waiting){
                    return Container(height: 10, width: 10, color: Colors.white,);
                  }
                },
              )
            ),
          ],
        );
      },
      itemCount: typeList.length,
    ),
  );/**/;
}