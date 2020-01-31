import 'package:flutter/material.dart';
import 'package:parcelo/argParcelo.dart';
import 'package:parcelo/colorsParcelo.dart';
import 'package:parcelo/customWidget/customExpanded.dart';

Widget expansionTileHeader(BuildContext context, String title, IconData icon) {
  return Flexible(
            child: Row(
              children: <Widget>[
                Text(title,
                style: TextStyle(
                  fontSize: ArgParcelo.productCompany,
                  color: ColorsParcelo.PrimaryTextColor,
                  fontWeight: FontWeight.w600
                ),),
                customExpanded(),
                Icon(icon)
            ]));
}