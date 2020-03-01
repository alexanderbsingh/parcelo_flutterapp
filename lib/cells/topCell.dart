
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../argParcelo.dart';
import '../colorsParcelo.dart';


Widget topCell(int pos) {
  String title;
  String subTitle;
  String imageUrl;
  Color textColor;
  if (pos == 1) {
    title = 'Första leveransen gratis';
    subTitle = 'Vi leverar snabbt';
    imageUrl = 'https://i.imgur.com/GF3zD3h.jpg';
    textColor = ColorsParcelo.PrimaryColor;
  } else {
    title = 'Bjud in en vän,';
    subTitle = 'Få 10 kr rabbatt'; 
    imageUrl = 'https://i.imgur.com/rdUnRXc.jpg';
    textColor = Color(0xf0DE5B13);
  }

    return Padding(
      padding: EdgeInsets.only(top: 0, bottom: 10, right: 12),
      child: Container(
        height: 270,
        width: 421,
        padding: EdgeInsets.only(left: 24, top: 24),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover
          ),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(ArgParcelo.cornerRadius)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                  fontSize: 28,//ArgParcelo.largeHeader,
                  fontWeight: FontWeight.w600,
                  color: textColor
              ),
            ),
            Text(
              subTitle,
              style: TextStyle(
                  fontSize: 18,//ArgParcelo.subHeader,
                  color: textColor,
                  fontStyle: FontStyle.normal
              ),
            )
          ],
        ),
      ),
    );
}