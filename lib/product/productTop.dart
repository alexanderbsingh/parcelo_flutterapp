import 'package:flutter/material.dart';
import 'package:parcelo/models/product.dart';

import '../argParcelo.dart';
import '../colorsParcelo.dart';

Widget productTop(BuildContext context, Product product) {
  return Stack(
    alignment: Alignment.topLeft,
    children: <Widget>[
      Container(
        padding: EdgeInsets.only(bottom: 20, top: 40),
        height: MediaQuery.of(context).size.height * 0.6,
        color: ColorsParcelo.LightGreyColor,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(product.images[0]),
                fit: BoxFit.fitHeight
              ),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(ArgParcelo.cornerRadius)
            ),
        ),
      ),
      
      /*Container(
        height: MediaQuery.of(context).size.height * 0.6,
        child: Column(
          children: <Widget>[
            //Container(height: 100, child: productToolbar(context)),

            customExpanded(),

            Padding(
              padding: const EdgeInsets.only(left: ArgParcelo.margin, bottom: ArgParcelo.margin),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  smallPicture(context),
                  smallPicture(context),
                  smallPicture(context),
                  Text('+2',
                    style: TextStyle(
                      color: ColorsParcelo.PrimaryTextColor,
                      fontSize: ArgParcelo.productTitleSmall,
                      fontWeight: FontWeight.bold
                    )
                  ) 

                ],
              ),
            ),
          ],
        ),
      ),*/
    ],
    );
}