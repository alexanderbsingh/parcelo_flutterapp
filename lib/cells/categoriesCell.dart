import 'package:flutter/material.dart';
import 'package:parcelo/customWidget/specificList.dart';
import 'package:parcelo/models/category.dart';
import 'package:parcelo/productsPage/productsPageView.dart';

import '../argParcelo.dart';
import '../colorsParcelo.dart';

Widget categoriesCell(BuildContext context, Category category) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductsPageView(category: category,)),
        );
    },
      child: Container(
        color: Colors.white,
        child: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(left: ArgParcelo.margin, top: 0, right: ArgParcelo.margin),
              child: specificList(context, category.name, 'description', false, true, ColorsParcelo.PrimaryTextColor, true, '')
            ),

            Padding(
              padding: EdgeInsets.only(left: ArgParcelo.margin, top: 6),
              child: Divider(
                color: ColorsParcelo.DarkGreyColor,
                height: 2,
              ),
            )
        ],
    ),
      ),
  );
}