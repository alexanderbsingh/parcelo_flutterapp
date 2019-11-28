
import 'package:flutter/cupertino.dart';

import '../../argParcelo.dart';
import '../../colorsParcelo.dart';

Widget topCell(BuildContext context, String titleHeader, titleSubHeader) {
  return Padding(
    padding: const EdgeInsets.only(top: 0, bottom: 10, right: 10),
    child: Container(
      height: 218,
      width: 340,
      padding: EdgeInsets.only(left: 24, top: 24),
      decoration: BoxDecoration(
          color: ColorsParcelo.PrimaryColorLight,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(ArgParcelo.cornerRadius)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            titleHeader,
            style: TextStyle(
                fontSize: ArgParcelo.largeHeader,
                fontWeight: FontWeight.w600,
                color: ColorsParcelo.PrimaryColor
            ),
          ),
          Text(
            titleSubHeader,
            style: TextStyle(
                fontSize: ArgParcelo.subHeader,
                color: ColorsParcelo.PrimaryColor,
                fontStyle: FontStyle.normal
            ),
          )
        ],
      ),
    ),
  );
}