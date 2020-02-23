import 'package:flutter/material.dart';
import 'package:parcelo/colorsParcelo.dart';
import 'package:parcelo/customWidget/customExpanded.dart';
import 'package:parcelo/models/product.dart';

import '../argParcelo.dart';

Widget cartCell(ProductStore product) {
  return Container(
    height: 122,
    //color: ColorsParcelo.LightGreyColor,
    child: Padding(
      padding: EdgeInsets.only(left: ArgParcelo.margin, right: ArgParcelo.margin, top: ArgParcelo.margin /2, bottom: ArgParcelo.margin /2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              width: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(product.image),
                  fit: BoxFit.cover
                ),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(ArgParcelo.cornerRadius)
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: ArgParcelo.margin, top: 2, bottom: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(product.name,
                    style: TextStyle(
                        color: ColorsParcelo.PrimaryTextColor,
                        fontWeight: FontWeight.w600,
                        fontSize: ArgParcelo.productTitleSmall
                    ),
                  ), 

                  Padding(
                    padding: EdgeInsets.only(top: 4, bottom: 4),
                    child: Text(product.manufacturer,
                      style: TextStyle(
                          color: ColorsParcelo.SecondaryTextColor,
                          fontWeight: FontWeight.w500,
                          fontSize: ArgParcelo.productCompany
                      ),
                    ),
                  ),

                  Text('Color: Silver',
                    style: TextStyle(
                        color: ColorsParcelo.SecondaryTextColor,
                        fontWeight: FontWeight.w500,
                        fontSize: ArgParcelo.productCompany
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Row(
                      children: <Widget>[
                        Text('Size: M, ',
                          style: TextStyle(
                              color: ColorsParcelo.SecondaryTextColor,
                              fontWeight: FontWeight.w500,
                              fontSize: ArgParcelo.productCompany
                          ),
                        ),
                        Text('Qty: 1',
                          style: TextStyle(
                              color: ColorsParcelo.SecondaryTextColor,
                              fontWeight: FontWeight.w500,
                              fontSize: ArgParcelo.productCompany
                          ),
                        ),
                      ],
                    ),
                  ),

                  customExpanded(),

                  Container(
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.only(right: 4),
                    width: 125,
                    child: Text('5 000 kr',
                      style: TextStyle(
                          color: ColorsParcelo.PrimaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: ArgParcelo.productCompany
                      ),
                    ),
                  ),
                ],
                ),
            ),

            customExpanded(),

            GestureDetector(
                    onTap: () {
                      print('pressed, options');
                    },
                    child: Icon(
                      Icons.more_vert,
                      size: 24,
                      color: ColorsParcelo.PrimaryTextColor,
                    )
                  ),
        ],
      ),
    ),
  );
}