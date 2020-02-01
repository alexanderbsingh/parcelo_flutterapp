import 'package:flutter/material.dart';
import 'package:parcelo/argParcelo.dart';
import 'package:parcelo/customWidget/customExpanded.dart';
import 'package:parcelo/productsPage/productsPageView.dart';

import '../colorsParcelo.dart';

Widget specificList(BuildContext context, String title, String description,  bool showDescription, bool showArrow, Color textColor, bool isSmall, String toWhere) {
  double titleSize;
  double iconSize;
  if (isSmall) {
    titleSize = ArgParcelo.productCompany;
    iconSize = 25;
  } else {
    titleSize = ArgParcelo.header;
    iconSize = 30;
  }

  return GestureDetector(
    onTap: () {
      print('pressed, ' + title);
    },
    child: Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: textColor,
                  fontSize: titleSize,
                  fontWeight: FontWeight.w500
                ),
              ),

              Visibility(visible: showDescription, child: Padding(padding: EdgeInsets.only(top: 3),)),

              Visibility(
                visible: showDescription,
                  child: Text(
                  description,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: textColor,
                      fontSize: ArgParcelo.subHeader,
                    fontStyle: FontStyle.normal
                  ),
                ),
              )
            ],
          ),

          customExpanded(),


          Visibility(
            visible: showArrow,
            child: Icon(
              Icons.keyboard_arrow_right,
              size: iconSize,
              color: ColorsParcelo.PrimaryTextColor,
            ),
          ),
        ],
      ),
    ),
  );
}