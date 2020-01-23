import 'package:flutter/material.dart';
import 'package:parcelo/argParcelo.dart';
import 'package:parcelo/colorsParcelo.dart';
import 'package:parcelo/customAnimation/slideBottomRoute.dart';
import 'package:parcelo/customWidget/customExpanded.dart';
import 'package:parcelo/models/product.dart';
import 'package:parcelo/product/productView.dart';

Widget smallProductCell(BuildContext context, ProductStore product, int price) {
  return GestureDetector(
      onTap: () {
        print('pressed, product');
        Navigator.push(context, SlideBottomRoute(page: ProductView(productID: product.id)));
      },
      child: Padding(
      padding: EdgeInsets.only(right: ArgParcelo.smallMargin, top: ArgParcelo.smallMargin),
      child: Container(
        height: 110,
        width: 270,
        padding: EdgeInsets.all(ArgParcelo.smallMargin),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: ColorsParcelo.LightGreyColor,
          borderRadius: BorderRadius.circular(ArgParcelo.cornerRadius)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Column(
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

                customExpanded(),

                Container(
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.only(right: 4),
                  width: 125,
                  child: Text(price.toString(),
                    style: TextStyle(
                        color: ColorsParcelo.PrimaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: ArgParcelo.productCompany
                    ),
                  ),
                )
              ],
              ),

            customExpanded(),

            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(product.image),
                  fit: BoxFit.fitHeight
                ),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(ArgParcelo.cornerRadius)
              ),
            ),
              
          ],
        ),
      ),
    ),
  );
}