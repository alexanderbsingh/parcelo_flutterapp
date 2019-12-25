import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parcelo/customAnimation/slideBottomRoute.dart';
import 'package:parcelo/product/productView.dart';

import '../../argParcelo.dart';
import '../../colorsParcelo.dart';

Widget productCell(BuildContext context, String typeHeader, int pos1, int pos2) {
  return GestureDetector(
      onTap: () {
        print('pressed, product');
        Navigator.push(context, SlideBottomRoute(page: ProductView(pos1: pos1, pos2: pos2,)));
      },
      child: Padding(
      padding: const EdgeInsets.only(top: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
          height: 165,
          width: 125,
          decoration: BoxDecoration(
              color: ColorsParcelo.LightGreyColor,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(ArgParcelo.cornerRadius)
            ),
          ),

          Padding(
          padding: const EdgeInsets.only(left: 2, top: 10.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Product Name',
              style: TextStyle(
                  color: ColorsParcelo.PrimaryTextColor,
                  fontWeight: FontWeight.w600,
                  fontSize: ArgParcelo.productTitleSmall
              ),
            ),

            Text('Company',
              style: TextStyle(
                  color: ColorsParcelo.SecondaryTextColor,
                  fontWeight: FontWeight.w500,
                  fontSize: ArgParcelo.productCompany
              ),
            ),

            Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.only(right: 4),
              width: 125,
              child: Text('100 kr',
                style: TextStyle(
                    color: ColorsParcelo.PrimaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: ArgParcelo.productCompany
                ),
              ),
            )
          ],
            ),
          ),

            
        ],
      ),
    ),
  );
}