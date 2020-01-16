import 'package:flutter/material.dart';
import 'package:parcelo/models/shop.dart';

import '../../argParcelo.dart';
import '../../colorsParcelo.dart';

Widget shopCell(Shop shop) {
  return GestureDetector(
      onTap: () {
        print('pressed, shop');
        //Navigator.push(context, SlideBottomRoute(page: ProductView(product: product)));
      },
      child: Padding(
      padding: const EdgeInsets.only(top: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: Alignment.topRight,
            children: <Widget>[
              
              Container(
              height: 160,
              width: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(shop.banner),
                    fit: BoxFit.fill
                  ),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(ArgParcelo.cornerRadius)
                ),
              ),

              Padding(
                padding: EdgeInsets.only(right: ArgParcelo.smallMargin, top: ArgParcelo.smallMargin),
                child: GestureDetector(
                  onTap: () {
                    print('pressed, save');
                  },
                  child: Icon(
                    Icons.favorite_border,
                    size: 24,
                    color: Colors.white,
                  )
                ),
              ),
            ],
          ),

          Padding(
          padding: const EdgeInsets.only(left: 2, top: 10.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(shop.name,
              style: TextStyle(
                  color: ColorsParcelo.PrimaryTextColor,
                  fontWeight: FontWeight.w600,
                  fontSize: ArgParcelo.productTitleSmall
              ),
            ),

            Text(shop.description,
              style: TextStyle(
                  color: ColorsParcelo.AccentColor,
                  fontWeight: FontWeight.w500,
                  fontSize: ArgParcelo.productCompany
              ),
            ),
          ],
            ),
          ),

            
        ],
      ),
    ),
  );
}