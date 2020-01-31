import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:parcelo/customWidget/expansionTileHeader.dart';
import 'package:parcelo/customWidget/specificList.dart';
import 'package:parcelo/models/category.dart';

import '../argParcelo.dart';
import '../colorsParcelo.dart';

Widget categoriesCell(BuildContext context, Category category) {
  return Column(
    children: <Widget>[
      Padding(
          padding: EdgeInsets.only(left: ArgParcelo.margin, top: 0, right: ArgParcelo.margin),
          child: specificList(context, category.name, 'description', false, true, ColorsParcelo.PrimaryTextColor, true)
        ),

        Padding(
          padding: EdgeInsets.only(left: ArgParcelo.margin, top: 6),
          child: Divider(
            color: ColorsParcelo.DarkGreyColor,
            height: 2,
          ),
        )
    ],
  );
}