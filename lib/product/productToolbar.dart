import 'package:flutter/material.dart';
import 'package:parcelo/customWidget/customExpanded.dart';

import '../argParcelo.dart';
import '../colorsParcelo.dart';

Widget productToolbar(BuildContext context) {
  return Row(
    children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: ArgParcelo.margin),
          child: GestureDetector(
            onTap: () {
              print('pressed, exit');
              Navigator.pop(context);
            },
            child: Icon(
              Icons.clear,
              size: 24,
              color: ColorsParcelo.PrimaryTextColor,
            )
          ),
        ),
        customExpanded(),
        Padding(
          padding: const EdgeInsets.only(right: ArgParcelo.margin),
          child: GestureDetector(
            onTap: () {
              print('pressed, exit');
              Navigator.pop(context);
            },
            child: Icon(
              Icons.favorite_border,
              size: 24,
              color: ColorsParcelo.PrimaryTextColor,
            )
          ),
        ),
      ],
    );
}