import 'package:flutter/material.dart';
import 'package:parcelo/argParcelo.dart';
import 'package:parcelo/cells/addressCell.dart';
import 'package:parcelo/colorsParcelo.dart';

Widget yourAddresses(BuildContext context) {
  var title = ['Göteborg'];
  var subTitle = ['Altarbacken 11'];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(left: ArgParcelo.margin, top: 35),
        child: Text(
          'Your Addresses',
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: ColorsParcelo.PrimaryTextColor
          ),
        ),
      ),

      Padding(
        padding: EdgeInsets.only(top: ArgParcelo.smallMargin, bottom: 5),
        child: Container(
          height: 95,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, pos) {
              if (pos == 0) {
                return Padding(padding: EdgeInsets.only(left: ArgParcelo.margin),);
              } else if (pos < title.length +1 && pos != 0) {
                return addressCell();
              } else {
                return Container(
                  height: 80,
                  width: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(ArgParcelo.cornerRadius),
                    color: ColorsParcelo.LightGreyColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white
                      ),
                      child: Icon(
                        Icons.add,
                        color: ColorsParcelo.LightGreyColor,
                      ),
                    ),
                  )
                );
              }
                
              
            },
            itemCount: title.length + 2,
          ),
        ),
      )
    ],
  );
}