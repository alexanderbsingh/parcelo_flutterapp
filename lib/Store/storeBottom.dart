import 'package:flutter/material.dart';
import 'package:parcelo/Store/storeContent.dart';
import 'package:parcelo/globalVar.dart';
import 'package:parcelo/models/store.dart';

import '../argParcelo.dart';
import '../cellHeight.dart';
import '../colorsParcelo.dart';
import '../whichService.dart';

Widget storeBottom(BuildContext context, StoreFull store) {
  var typeHeader = ['Popular', store.name + ' recomends'];
  var typeList = ['smallProduct', 'smallProduct'];


  print('old snapshot ' + oldSnapshotStore.toString());
  return Container(
    height: 700,
    color: Colors.white,
    child: ListView.builder(
      padding: EdgeInsets.only(top: 0),
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
              child: storeContent(context, store.prices, typeList[pos], store.logo)
            ),
          ],
        );
      },
      itemCount: typeList.length,
    ),
  );
}