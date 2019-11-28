import 'package:flutter/material.dart';
import 'package:parcelo/colorsParcelo.dart';
import 'package:parcelo/home/cells/productCell.dart';
import 'package:parcelo/home/cells/topCell.dart';
import '../argParcelo.dart';
import 'cellHeight.dart';

class Browse extends StatelessWidget {
  var headers = ['Lorem ipsum,', 'Lorem ipsum,', 'Lorem ipsum,', 'Lorem ipsum,'];
  var subHeaders = ['dolor sit amet'];
  var typeHeader = ['', 'Recent', 'Only on Parcelo', 'Only on Parcelo'];
  var typeList = ['top', 'product', '', ''];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, position1) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if(typeHeader[position1].isNotEmpty) Padding(
              padding: const EdgeInsets.only(left: 15, top: 10),
              child: Text(
                typeHeader[position1],
                style: TextStyle(
                  color: ColorsParcelo.PrimaryTextColor,
                  fontWeight: FontWeight.w600,
                  fontSize: ArgParcelo.subHeader
                ),
              ),
            ),

            Container(
              height: CellHeight(typeList[position1]),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, position2) {
                  if(typeList[position1] == 'top') {
                    if(position2 != 0) {
                      return topCell(context, headers[0], subHeaders[0]);
                    } else {
                      return Padding(padding: EdgeInsets.only(left: 15),);
                    }

                  } else if(typeList[position1] == 'product'){
                    if(position2 != 0) {
                      return productCell(context, typeHeader[0]);
                    } else {
                      return Padding(padding: EdgeInsets.only(left: 15),);
                    }

                  } else {
                    if(position2 != 0) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 5, top: 5, bottom: 10),
                        child: Container(
                          height: 150,
                          width: 100,
                          color: ColorsParcelo.LightGreyColor,
                        ),
                      );                    } else {
                      return Padding(padding: EdgeInsets.only(left: 15),);
                    }


                  }
                },
                itemCount: 4,
              ),
            ),
          ],
        );

      },
      itemCount: typeList.length,
    );
  }
}