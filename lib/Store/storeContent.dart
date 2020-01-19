import 'package:flutter/material.dart';
import 'package:parcelo/cells/smallProductCell.dart';
import 'package:parcelo/models/product.dart';

import '../argParcelo.dart';
import '../colorsParcelo.dart';

Widget storeContent(BuildContext context, List data, String type) {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, pos) {
      if (pos != 0) {
        if(type == 'smallProduct') {
          var product = data[pos -1] as Product;
          return smallProductCell(context, product);

        } else {
          return Padding(
            padding: const EdgeInsets.only(right: 10, top: 5, bottom: 10),
            child: Container(
              height: 160,
              width: 300,
              decoration: BoxDecoration(
                  color: ColorsParcelo.LightGreyColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(ArgParcelo.cornerRadius)
              ),
            ),
          );
        }
      } else {
        return Padding(padding: EdgeInsets.only(left: 15),);
      }

    },
    itemCount: data.length +1,
  );
}