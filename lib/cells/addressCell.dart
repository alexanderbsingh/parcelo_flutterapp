
import 'package:flutter/material.dart';
import 'package:parcelo/colorsParcelo.dart';
import 'package:parcelo/customWidget/customExpanded.dart';

import '../argParcelo.dart';

Widget addressCell(String locationName, String location) {
  return Padding(
    padding: EdgeInsets.only(right: ArgParcelo.smallMargin),
    child: Container(
      height: 80,
      width: 235,
      padding: EdgeInsets.all(ArgParcelo.smallMargin + 5),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(ArgParcelo.cornerRadius),
        color: ColorsParcelo.LightGreyColor
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(locationName,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: ArgParcelo.header,
                  color: ColorsParcelo.PrimaryTextColor
                ),
              ),

              Text(location,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: ArgParcelo.productCompany,
                  color: ColorsParcelo.PrimaryTextColor
                ),
              ),
            ],
          ),

          customExpanded(),

          Container(
            height: 34,
            width: 34,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(17),
              color: Colors.white
            ),
            child: Icon(
              Icons.home,
              color: ColorsParcelo.LightGreyColor,
            ),
          )
        ],
      ),
    ),
  );
}