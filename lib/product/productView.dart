import 'package:flutter/material.dart';
import 'package:parcelo/globalVar.dart';
import 'package:parcelo/models/price.dart';
import 'package:parcelo/models/product.dart';
import 'package:parcelo/network/services/post/addToCart_service.dart';
import 'package:parcelo/network/services/product_service.dart';
import 'package:parcelo/product/productInfo.dart';
import 'package:parcelo/product/productTop.dart';
import 'package:dropdown_banner/dropdown_banner.dart';

import '../argParcelo.dart';
import '../colorsParcelo.dart';

class ProductView extends StatefulWidget {
  final String productID;
  final int price;
  final String imgURL;
  
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
    final navigatorKeyProductView = GlobalKey<NavigatorState>();

    return DropdownBanner(
      navigatorKey: navigatorKeyProductView,
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
                  strPrice = sortByPrice(product.prices)[0].price.toString();
                  imgURL = sortByPrice(product.prices)[0].store.logo.toString();
                }
                return content(context, product, imgURL, strPrice);
              }
              else if (oldSnapshotProduct != null) {
                //print('oldSnapShotProduct');
                ProductFull product = oldSnapshotProduct;
                if (price != null) {
                  strPrice = price.toString();
                } else {
                  strPrice = sortByPrice(product.prices)[0].price.toString();
                  imgURL = sortByPrice(product.prices)[0].store.logo.toString();
                }
                return content(context, product, imgURL, strPrice);
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
            height: MediaQuery.of(context).padding.top + 56,
            child: AppBar(
              backgroundColor: Colors.transparent,
              brightness: Brightness.light,
              elevation: 0,
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: ArgParcelo.margin),
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
          ],
          ),
        ),
    );
  }
}

List<PriceProduct> sortByPrice(List<PriceProduct> prices) {
  prices.sort((a, b) => a.price.compareTo(b.price));
  List<PriceProduct> sortedByPrice = prices;
  return sortedByPrice;
}

Widget content(BuildContext context, ProductFull product, String imgURL, String strPrice){
 return Container(
   child: Column(
     children: <Widget>[
       Expanded(
          child: ListView(   
           padding: EdgeInsets.only(top: 0),
           children: <Widget>[
             productTop(context, product, imgURL),
             productInfo(context, product, strPrice),
           ],
         ),
       ),

       Container(
         padding: EdgeInsets.all(ArgParcelo.margin),
         height: MediaQuery.of(context).padding.bottom != 0 ? 60 + MediaQuery.of(context).padding.bottom : 84,
         alignment: Alignment.topLeft,
         decoration: BoxDecoration(
           color: Colors.white,
           boxShadow: [BoxShadow(
            color: Colors.black12,
            blurRadius: 0//17.0,
          ),]
         ),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.end,
           children: <Widget>[
             /*GestureDetector(
               onTap: () {
                 print('pressed multi func');
               },
                child: Container(
                alignment: Alignment.center,
                height: 44,
                width: 126,
                decoration: BoxDecoration(
                  color: ColorsParcelo.DarkGreyColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(22)
                ),
                child: Text(
                  'Antal (1)',
                  style: TextStyle(
                    color: ColorsParcelo.PrimaryTextColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16
                  )
                ),
                ),
             ),*/

             /*Expanded(
               child:*/ Container(
               width: 200,
                 child: FlatButton(onPressed: () async{
                  print('pressed add to cart');
                  await addToCart('73c29a76-8124-4d6c-8417-7d95dec9ed5e', product.id);
                  DropdownBanner.showBanner(
                    text: 'La till ' + product.name + ' i varukorgen',
                    color: ColorsParcelo.PrimaryColor,
                    textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
                    
                  );
                 },
                   color: ColorsParcelo.PrimaryColor,
                   shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(22.0)),
                    child: Container(
                      alignment: Alignment.center,
                      height: 44,
                      width: 200,
                      child: Text(
                        'Lägg i kundvagn',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16
                        )
                  ),
                  ),
                 )
               ),
             //)
           ],
         ),
       )
     ],
   ),
 );
}
  
