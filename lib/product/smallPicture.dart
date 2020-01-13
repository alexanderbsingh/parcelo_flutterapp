import 'package:flutter/material.dart';

import '../argParcelo.dart';
import '../colorsParcelo.dart';

Widget smallPicture(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(right: ArgParcelo.smallMargin),
    child: GestureDetector(
      onTap: () {
              print('pressed, image');
            },
      child: Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          color: ColorsParcelo.DarkGreyColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(ArgParcelo.cornerRadius)
        ),
      ),
    ),
  );
}