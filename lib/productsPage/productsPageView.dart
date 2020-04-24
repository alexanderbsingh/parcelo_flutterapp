
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parcelo/argParcelo.dart';
import 'package:parcelo/cells/largeProductCell.dart';
import 'package:parcelo/models/category.dart';
import 'package:parcelo/models/product.dart';
import 'package:parcelo/network/services/category_service.dart';
import 'package:parcelo/network/services/product_service.dart';

import '../colorsParcelo.dart';

class ProductsPageView extends StatefulWidget {
  Category category;

  ProductsPageView({@required this.category});

  @override
  _ProductsPageViewState createState() => _ProductsPageViewState(category: category);
}

class _ProductsPageViewState extends State<ProductsPageView> {
  Category category;

  _ProductsPageViewState({@required this.category});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0,
        title: Text(category.name, 
        style: TextStyle(
          color: ColorsParcelo.PrimaryTextColor,
          fontSize: 17,
          fontWeight: FontWeight.w600
        ),),
        leading: GestureDetector(
          onTap: () {
            print('pressed, exit');
            Navigator.pop(context);
          },
          child: Icon(
            Icons.keyboard_arrow_left,
            size: 35,
            color: ColorsParcelo.PrimaryTextColor,
          )
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder(
          future: fetchCategory(category.slug),
          builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {     
                var category = snapshot.data as CategoryFull;
                var products = category.products;         
                return GridView.builder(
                  padding: EdgeInsets.only(left: ArgParcelo.margin, right: ArgParcelo.margin, top: ArgParcelo.smallMargin, bottom: MediaQuery.of(context).padding.bottom),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, pos) {
                    return Container(
                      alignment: Alignment.center,
                      child: largeProductCell(context, products[pos])
                      );
                  },
                  itemCount: products.length, 
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10, 
                    mainAxisSpacing: 0,
                    childAspectRatio: (61/100)
                    )
                );
            } else {
              return Container(height: 10, width: 10, color: Colors.white,);
            }
          }
        ),
      ),
    );
  }
}