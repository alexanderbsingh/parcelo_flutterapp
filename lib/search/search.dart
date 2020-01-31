import 'package:flutter/material.dart';
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
                  padding: const EdgeInsets.only(right: 10),
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
                  child: Container(
                    height: 20,
                    alignment: Alignment.centerLeft,
                    child:  TextField(
                      decoration: InputDecoration.collapsed(
                        hintText: 'Search',
                      ),
                    ),
                  ),
                )
              ],
            ),
            Divider(
              color: Colors.black26,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: FutureBuilder(
                  future: fetchCategories(),
                  builder: (context, snapshot) {
                    var categories = snapshot.data as List<Category>;
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, pos) {
                        return categoriesCell(context, categories[pos]);
                      },
                      itemCount: categories.length,
                    );
                  }
                ),
              ),
            )
          ],
        )
    );
  }
}