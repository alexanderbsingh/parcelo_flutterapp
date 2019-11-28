import 'package:flutter/cupertino.dart';

import '../../argParcelo.dart';
import '../../colorsParcelo.dart';

Widget productCell(BuildContext context, String typeHeader) {
  return Padding(
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
                    fontSize: ArgParcelo.subHeader
                ),
              ),
            ],
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
                fontSize: ArgParcelo.subHeader
            ),
          ),
        )
      ],
    ),
  );
}