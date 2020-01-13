import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parcelo/customAnimation/slideBottomRoute.dart';
import 'package:parcelo/models/product.dart';
import 'package:parcelo/product/productView.dart';

import '../../argParcelo.dart';
import '../../colorsParcelo.dart';

Widget productCell(BuildContext context, Product product) {
  return GestureDetector(
      onTap: () {
        print('pressed, product');
        Navigator.push(context, SlideBottomRoute(page: ProductView(pos1: 1, pos2: 1,)));
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
              image: DecorationImage(
                image: NetworkImage('https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MWYK2?wid=1144&hei=1144&fmt=jpeg&qlt=80&op_usm=0.5,0.5&.v=1567304928359'),
                fit: BoxFit.fitHeight
              ),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(ArgParcelo.cornerRadius)
            ),
          ),

          Padding(
          padding: const EdgeInsets.only(left: 2, top: 10.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(product.name,
              style: TextStyle(
                  color: ColorsParcelo.PrimaryTextColor,
                  fontWeight: FontWeight.w600,
                  fontSize: ArgParcelo.productTitleSmall
              ),
            ),

            Text(product.manufacturer,
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