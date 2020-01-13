import 'package:flutter/material.dart';
import 'package:parcelo/colorsParcelo.dart';
import 'package:parcelo/home/browseContent.dart';
import 'package:parcelo/home/cells/productCell.dart';
import 'package:parcelo/home/cells/shopCell.dart';
import 'package:parcelo/home/cells/topCell.dart';
import 'package:parcelo/models/product.dart';
import 'package:parcelo/network/services/product_service.dart';
import 'package:parcelo/whichService.dart';
import '../argParcelo.dart';
import 'cellHeight.dart';

import '../network/services/shop_service.dart';
import 'package:parcelo/models/shop.dart';

class Browse extends StatefulWidget {
  @override
  _BrowseState createState() => _BrowseState();
}

class _BrowseState extends State<Browse> {
  var headers = ['Lorem ipsum,', 'Lorem ipsum,', 'Lorem ipsum,', 'Lorem ipsum,'];

  var subHeaders = ['dolor sit amet'];

  var typeHeader = ['', 'Recent', 'Only on Parcelo'];

  var typeList = ['top', 'product', 'shop'];

  List<int> itemCount;

  List<Shop> shops;

  List<Product> products;

  void calcItemCount() async {
    shops =  await fetchShops();
    products = await fetchProducts();

    itemCount = [3, products.length, shops.length];
  } 

  @override
  Widget build(BuildContext context) {
    //calcItemCount();

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, position1) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if(typeHeader[position1].isNotEmpty) Padding(
              padding: const EdgeInsets.only(left: 15, top: 10),
              child: Text(
                typeHeader[position1],
                style: TextStyle(
                  color: ColorsParcelo.PrimaryTextColor,
                  fontWeight: FontWeight.w600,
                  fontSize: ArgParcelo.subHeader
                ),
              ),
            ),

            Container(
              height: CellHeight(typeList[position1]),
              child: FutureBuilder(
                future: whichService(typeList[position1]),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return browseContent(context, snapshot.data, typeList[position1]);
                    
                  } else if (snapshot.connectionState == ConnectionState.none) {
                    return null;
                  }
                },
              )
              
              
            ),
          ],
        );
      },
      itemCount: typeList.length,
    );
  }
}