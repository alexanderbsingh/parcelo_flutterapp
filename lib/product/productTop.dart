import 'package:flutter/material.dart';
import 'package:parcelo/customWidget/customExpanded.dart';
import 'package:parcelo/models/product.dart';
import 'package:parcelo/product/smallPicture.dart';

import '../argParcelo.dart';
import '../colorsParcelo.dart';

Widget productTop(BuildContext context, ProductFull product, String imgURL) {
  return Stack(
    alignment: Alignment.topLeft,
    children: <Widget>[
      Container(
        padding: EdgeInsets.only(bottom: 42, top: 40 + MediaQuery.of(context).padding.top),
        height: MediaQuery.of(context).size.height * 0.6 + MediaQuery.of(context).padding.top,
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
      
      Container(
        height: MediaQuery.of(context).size.height * 0.6 + MediaQuery.of(context).padding.top,
        child: Column(
          children: <Widget>[

            customExpanded(),

            Padding(
              padding: const EdgeInsets.only(left: ArgParcelo.margin, bottom: ArgParcelo.smallMargin),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  /*smallPicture(context),
                  smallPicture(context),
                  smallPicture(context),
                  Text('+2',
                    style: TextStyle(
                      color: ColorsParcelo.PrimaryTextColor,
                      fontSize: ArgParcelo.productTitleSmall,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  */
                  customExpanded(),

                  Visibility(
                    visible: imgURL != null ? true : false,
                      child: Padding(
                      padding: EdgeInsets.only(right: ArgParcelo.smallMargin),
                      child: imgURL != null ? Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          image: DecorationImage(
                            image: NetworkImage(imgURL), 
                            fit: BoxFit.cover
                          )
                        ),
                      ) : null,
                    ),
                  ) 

                ],
              ),
            ),
          ],
        ),
      ),
    ],
    );
}