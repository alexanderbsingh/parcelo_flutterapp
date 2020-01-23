import 'package:flutter/material.dart';
import 'package:parcelo/cells/productCell.dart';
import 'package:parcelo/cells/storeCell.dart';
import 'package:parcelo/cells/topCell.dart';
import 'package:parcelo/models/product.dart';
import 'package:parcelo/models/store.dart';

import '../argParcelo.dart';
import '../colorsParcelo.dart';

Widget browseContent(BuildContext context, List data, String type){
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, pos) {
      if (pos != 0) {
        if(type == 'top') {
          return topCell(pos);

        } else if(type == 'product'){
          var product = data[pos-1] as Product;
          return productCell(context, product);

        } else if (type == 'store'){
          var store = data[pos-1] as Store;
          return StoreCell(store: store,);

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
    itemCount: data != null ? data.length + 1 : 0,
  );
}