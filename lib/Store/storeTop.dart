
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:parcelo/customWidget/customExpanded.dart';
import 'package:parcelo/models/store.dart';

import '../argParcelo.dart';
import '../colorsParcelo.dart';

Widget storeTop(BuildContext context, StoreFull store){
  return Stack(
    alignment: Alignment.center,
    children: <Widget>[
      Container(
        height: MediaQuery.of(context).size.height * 0.6 + MediaQuery.of(context).padding.top,
        color: ColorsParcelo.LightGreyColor,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(store.banner),
                fit: BoxFit.cover
              ),          
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(ArgParcelo.cornerRadius)
            ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              color: Colors.white.withOpacity(0.3),
            ),
          ),
        ),
      ),
      
      Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: 130.0,
            height: 130.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(store.logo),
                fit: BoxFit.cover
              ),
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),

          Text(
            store.name,
            style: TextStyle(
              color: ColorsParcelo.PrimaryTextColor,
              fontSize: ArgParcelo.largeHeader,
              fontWeight: FontWeight.w800,
            )
          ),

          Text(
            store.description,
            style: TextStyle(
              color: ColorsParcelo.PrimaryTextColor,
              fontSize: ArgParcelo.header,
              fontWeight: FontWeight.w600,
            )
          ),

        ],
      ),

      Container(
        alignment: Alignment.bottomLeft,
        padding: EdgeInsets.only(left: ArgParcelo.margin, right: ArgParcelo.margin, bottom: ArgParcelo.margin),
        height: MediaQuery.of(context).size.height * 0.6 + MediaQuery.of(context).padding.top,
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          
          GestureDetector(
            onTap: () {
              print('pressed, filter search');
            },
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.sort,
                  size: 24,
                  color: ColorsParcelo.PrimaryTextColor,
                ),

                Text(
                  'Filter',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: ArgParcelo.productTitleSmall
                  ),
                ),
              ],
            )
          ),

          customExpanded(),

          GestureDetector(
            onTap: () {
              print('pressed, search');
            },
            child: Icon(
              Icons.search,
              size: 24,
              color: ColorsParcelo.PrimaryTextColor,
            )
          ),
        ],),
      )
    ],
    );
}

