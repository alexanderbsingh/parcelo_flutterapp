import 'package:flutter/material.dart';
import 'package:parcelo/customWidget/customExpanded.dart';
import 'package:parcelo/product/productToolbar.dart';
import 'package:parcelo/product/smallPicture.dart';

import '../argParcelo.dart';
import '../colorsParcelo.dart';

Widget productTop(BuildContext context, int pos1, int pos2) {
  return Stack(
    alignment: Alignment.topLeft,
    children: <Widget>[
      Container(
      height: MediaQuery.of(context).size.height * 0.6,
      color: ColorsParcelo.LightGreyColor,
        ),
      Container(
        height: MediaQuery.of(context).size.height * 0.6,
        child: Column(
          children: <Widget>[
            //Container(height: 100, child: productToolbar(context)),

            customExpanded(),

            Padding(
              padding: const EdgeInsets.only(left: ArgParcelo.margin, bottom: ArgParcelo.margin),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  smallPicture(context),
                  smallPicture(context),
                  smallPicture(context),
                  Text('+2',
                    style: TextStyle(
                      color: ColorsParcelo.PrimaryTextColor,
                      fontSize: ArgParcelo.productTitleSmall,
                      fontWeight: FontWeight.bold
                    )
                  ) 

                ],
              ),
            ),
          ],
        ),
      ),
    ],
    );
}