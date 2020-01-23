import 'package:flutter/material.dart';
import 'package:parcelo/globalVar.dart';
import 'package:parcelo/models/product.dart';
import 'package:parcelo/network/services/product_service.dart';
import 'package:parcelo/product/productInfo.dart';
import 'package:parcelo/product/productTop.dart';

import '../argParcelo.dart';
import '../colorsParcelo.dart';

class ProductView extends StatefulWidget {
  final String productID;
  final int price;
  String imgURL;
  
  ProductView({@required this.productID, this.price, this.imgURL});

  @override
  _ProductViewState createState() => _ProductViewState(productID: productID, price: price, imgURL: imgURL);
}

class _ProductViewState extends State<ProductView> {
    final String productID;
    final int price;
    String imgURL;
    String strPrice;

    bool isLiked = false;

    _ProductViewState({@required this.productID, this.price, this.imgURL});

  @override
  Widget build(BuildContext context) {
    

    return SafeArea(
      top: false,
      bottom: false,
          child: Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
          children: <Widget>[
            FutureBuilder(
              future: fetchProduct(productID),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  ProductFull product = snapshot.data;
                  oldSnapshotProduct = snapshot.data;
                  if (price != null) {
                    strPrice = price.toString();
                  } else {
                    strPrice = product.prices[0].price.toString();
                    imgURL = product.prices[0].store.logo.toString();
                  }
                  return ListView(   
                    children: <Widget>[
                      productTop(context, product, imgURL),
                      productInfo(context, product, strPrice),
                    
                    ],
                  );
                }
                else if (oldSnapshotProduct != null) {
                  ProductFull product = snapshot.data;
                  return ListView(   
                    children: <Widget>[
                      productTop(context, product, imgURL),
                      productInfo(context, product, strPrice),
                    
                    ],
                  );
                } else if (snapshot.connectionState == ConnectionState.none) {
                  return Container(height: 10, width: 10, color: Colors.white,);
                } else if (snapshot.connectionState == ConnectionState.active) {
                  return Container(height: 10, width: 10, color: Colors.white,);
                } else if (snapshot.connectionState == ConnectionState.waiting){
                  return Container(height: 10, width: 10, color: Colors.white,);
                  
                }
              },
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
                        isLiked = !isLiked;
                        setState(() {});
                      },
                      child: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,                        
                        size: 24,
                        color: ColorsParcelo.PrimaryTextColor,
                      )
                    ),
                  ),
                ],
                leading: GestureDetector(
                      onTap: () {
                        print('pressed, exit');
                        oldSnapshotProduct = null;
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
      ),
    );;
  }
}
  
