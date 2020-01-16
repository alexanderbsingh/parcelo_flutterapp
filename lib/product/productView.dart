import 'package:flutter/material.dart';
import 'package:parcelo/models/product.dart';
import 'package:parcelo/product/productInfo.dart';
import 'package:parcelo/product/productTop.dart';

import '../argParcelo.dart';
import '../colorsParcelo.dart';

class ProductView extends StatelessWidget {
  final Product product;

  ProductView({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.white,
    body: Stack(
        children: <Widget>[
          ListView(   
            children: <Widget>[
              productTop(context, product),
              productInfo(context, product),
            
            ],
          ),
          Container(
            height: 134,
            child: AppBar(
              backgroundColor: Colors.transparent,
              brightness: Brightness.light,
              elevation: 0,
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: ArgParcelo.margin),
                  child: GestureDetector(
                    onTap: () {
                      print('pressed, save');
                    },
                    child: Icon(
                      Icons.favorite_border,
                      size: 24,
                      color: ColorsParcelo.PrimaryTextColor,
                    )
                  ),
                ),
              ],
              leading: GestureDetector(
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
          ),
        ]
      )
    );
  }
}
