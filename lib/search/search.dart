import 'package:flutter/material.dart';
import 'package:parcelo/argParcelo.dart';
import 'package:parcelo/cells/categoriesCell.dart';
import 'package:parcelo/models/category.dart';
import 'package:parcelo/network/services/category_service.dart';

import '../colorsParcelo.dart';
import '../main.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 0, right: ArgParcelo.smallMargin),
                  child: GestureDetector(
                      onTap: () {
                        print('pressed, back');
                        MainViewState.pageController.animateToPage(1, duration: Duration(milliseconds: 200), curve: Curves.linear);
                      },
                      child: Icon(
                        Icons.keyboard_arrow_left,
                        size: 35,
                        color: ColorsParcelo.PrimaryTextColor,
                      )
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 45,
                        alignment: Alignment.topLeft,
                        child:  TextField(
                          decoration: InputDecoration.collapsed(
                            hintText: 'Sök',
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Divider(
              color: Colors.black26,
            ),

            Padding(
              padding: EdgeInsets.only(top: ArgParcelo.margin, right: ArgParcelo.margin, left: ArgParcelo.margin,),
              child: Text('Kategorier',
                style: TextStyle(
                  fontSize: ArgParcelo.productTitleSmall,
                  fontWeight: FontWeight.w800,
                  color: ColorsParcelo.PrimaryTextColor

                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: FutureBuilder(
                  future: fetchCategories(),
                  builder: (context, snapshot) {
                    var categories = snapshot.data as List<Category>;
                    if (snapshot.connectionState == ConnectionState.done) {
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, pos) {
                          return categoriesCell(context, categories[pos]);
                        },
                        itemCount: categories.length,
                      );
                    } else if (snapshot.connectionState == ConnectionState.none) {
                      return Container(height: 10, width: 10, color: Colors.white,);
                    } else if (snapshot.connectionState == ConnectionState.active) {
                      return Container(height: 10, width: 10, color: Colors.white,);
                    } else if (snapshot.connectionState == ConnectionState.waiting){
                      return Container(height: 10, width: 10, color: Colors.white,);
                    }
                  }
                ),
              ),
            )
          ],
        )
    );
  }
}