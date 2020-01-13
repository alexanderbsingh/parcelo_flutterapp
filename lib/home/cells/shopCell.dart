import 'package:flutter/material.dart';

import '../../argParcelo.dart';
import '../../colorsParcelo.dart';

Widget shopCell() {
  return Padding(
    padding: const EdgeInsets.only(right: 10, top: 5, bottom: 10),
    child: Container(
      height: 160,
      width: 300,
      decoration: BoxDecoration(
          color: ColorsParcelo.PrimaryColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(ArgParcelo.cornerRadius)
      ),
    ),
  );
}