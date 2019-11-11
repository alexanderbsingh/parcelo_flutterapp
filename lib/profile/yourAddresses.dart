import 'package:flutter/material.dart';
import 'package:parcelo/colorsParcelo.dart';

import '../argParcelo.dart';

Widget yourAddresses(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: ArgParcelo.margin, top: 35),
        child: Text(
          'Your Addresses',
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: ColorsParcelo.PrimaryTextColor
          ),
        ),
      ),

      Container(
        height: 106,
      )
    ],
  );
}