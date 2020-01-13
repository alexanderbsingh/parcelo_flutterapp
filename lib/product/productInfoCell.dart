import 'package:flutter/material.dart';

Widget productInfoCell(BuildContext context, String title, String info) {
  return Padding(
    padding: const EdgeInsets.only(top: 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Text(title ,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 13),
          ),
        ),
        
        Expanded(
          child: Text(info,
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 13
          ),
          )
        )
    ],),
  );
}