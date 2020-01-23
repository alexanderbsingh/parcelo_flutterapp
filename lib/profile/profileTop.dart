import 'package:flutter/material.dart';

import '../colorsParcelo.dart';
import '../main.dart';

Widget profileTop(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        alignment: Alignment.topLeft,
        width: 130.0,
        height: 130.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-oF9WRTkUmgbMG19EZBHWE6cLNOCsUYKq1xN-y4T7B5WaEa7V&s'),
            fit: BoxFit.cover
          ),
        shape: BoxShape.circle,
        ),
      ),

      Expanded(
        child: Container(
          height: 150,
          padding: EdgeInsets.only(top: 3),
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
                'alexander@parcelo.se',
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
                decoration: BoxDecoration(
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

      GestureDetector(
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
    ],
  );
}