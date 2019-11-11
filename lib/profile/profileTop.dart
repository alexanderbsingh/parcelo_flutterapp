import 'package:flutter/material.dart';
import 'package:parcelo/home/main.dart';

import '../argParcelo.dart';
import '../colorsParcelo.dart';

Widget profileTop(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: ArgParcelo.margin, top: ArgParcelo.margin),
        child: Container(
          alignment: Alignment.topLeft,
          width: 130.0,
          height: 130.0,
          decoration: new BoxDecoration(
            color: ColorsParcelo.LightGreyColor,
            shape: BoxShape.circle,
          ),
        ),
      ),

      Expanded(
        child: Container(
          height: 150,
          padding: EdgeInsets.only(right: 10, top: 3),
          alignment: Alignment.centerRight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Alexander Singh',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: ColorsParcelo.PrimaryTextColor,
                ),
              ),
              Text(
                'email@email.com',
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 13,
                  color: ColorsParcelo.SecondaryTextColor,
                ),
              ),

              Padding(padding: EdgeInsets.only(top: 5)),

              Container(
                alignment: Alignment.center,
                width: 52,
                height: 20,
                decoration: new BoxDecoration(
                    color: ColorsParcelo.PrimaryColor,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10)
                ),
                child:
                Text('Basic',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              )
            ],
          ),
        ),
      ),

      Padding(
        padding: const EdgeInsets.only(right: 10),
        child: GestureDetector(
            onTap: () {
              print('pressed, back');
              MainViewState.pageController.animateToPage(1, duration: Duration(milliseconds: 200), curve: Curves.linear);
            },
            child: Icon(
              Icons.keyboard_arrow_right,
              size: 35,
              color: ColorsParcelo.PrimaryTextColor,
            )
        ),
      ),
    ],
  );
}