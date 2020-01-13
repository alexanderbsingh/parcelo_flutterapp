import 'package:flutter/material.dart';
import 'package:parcelo/argParcelo.dart';
import 'package:parcelo/customWidget/customExpanded.dart';

import '../colorsParcelo.dart';

Widget profileSpecificList(BuildContext context, String title, String description, bool showArrow, Color textColor) {
  return GestureDetector(
    onTap: () {
      print('pressed, ' + title);
    },
    child: Padding(
      padding: const EdgeInsets.only(left: ArgParcelo.margin, right: ArgParcelo.margin, top: 8, bottom: 8),
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
                  fontSize: ArgParcelo.header,
                  fontWeight: FontWeight.w500
                ),
              ),

              Padding(padding: EdgeInsets.only(top: 3),),

              Text(
                description,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: textColor,
                    fontSize: ArgParcelo.subHeader,
                  fontStyle: FontStyle.normal
                ),
              )
            ],
          ),

          customExpanded(),


          Visibility(
            visible: showArrow,
            child: Icon(
              Icons.keyboard_arrow_right,
              size: 30,
              color: ColorsParcelo.PrimaryTextColor,
            ),
          ),
        ],
      ),
    ),
  );
}