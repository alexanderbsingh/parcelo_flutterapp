import 'package:flutter/material.dart';
import 'package:parcelo/customWidget/specificList.dart';

import '../argParcelo.dart';
import '../colorsParcelo.dart';

class FilterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      primary: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: ArgParcelo.margin),
            child: Row(
              children: <Widget>[
                GestureDetector(
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
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: ArgParcelo.margin, right: ArgParcelo.margin, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Filter your feed',
                  style: TextStyle(
                    fontSize: ArgParcelo.largeHeader,
                    fontWeight: FontWeight.w600,
                    color: ColorsParcelo.PrimaryTextColor
                  )
                ),

                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 10),
                  child: Text("It's great to be picky. Follow what you like and make the feed yours.",
                    style: TextStyle(
                      color: ColorsParcelo.SecondaryTextColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                ),

                specificList(context, 'Stores', 'Your favourite stores', true, ColorsParcelo.PrimaryTextColor),
                specificList(context, 'Categories', 'Your favourite Categories', true, ColorsParcelo.PrimaryTextColor),
                specificList(context, 'Price range', 'Get products recomended in your price range', true, ColorsParcelo.PrimaryTextColor),


              ],
            ),
          )
        ],
      ),
    );
  }
}