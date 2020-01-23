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
  
  ProductView({@required this.productID});

  @override
  _ProductViewState createState() => _ProductViewState(productID: productID);
}

class _ProductViewState extends State<ProductView> {
    final String productID;
    bool isLiked = false;

    _ProductViewState({@required this.productID});


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
                  return ListView(   
                    children: <Widget>[
                      productTop(context, product),
                      productInfo(context, product),
                    
                    ],
                  );
                }
                else if (oldSnapshotProduct != null) {
                  ProductFull product = snapshot.data;
                  return ListView(   
                    children: <Widget>[
                      productTop(context, product),
                      productInfo(context, product),
                    
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
  
