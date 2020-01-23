import 'package:flutter/material.dart';
import 'package:parcelo/colorsParcelo.dart';
import 'package:parcelo/customAnimation/slideBottomRoute.dart';
import 'package:parcelo/customWidget/customExpanded.dart';

import '../argParcelo.dart';
import '../main.dart';
import 'filterHome.dart';

Widget homeToolbar(BuildContext context) {
  return Row(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(left: ArgParcelo.margin),
        child: GestureDetector(
          onTap: () {
            print('pressed, profile');
            MainViewState.pageController.animateToPage(0, duration: Duration(milliseconds: 200), curve: Curves.linear);
          },
          child: Container(
            height: 37,
            width: 37,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-oF9WRTkUmgbMG19EZBHWE6cLNOCsUYKq1xN-y4T7B5WaEa7V&s'),
                fit: BoxFit.cover
              ),
              shape: BoxShape.circle,
          ) ,
          ),
        ),
      ),
      customExpanded(),

      GestureDetector(
          onTap: () {
            print('pressed, filter home');
            Navigator.push(context, SlideBottomRoute(page: FilterHome()));
          },
          child: Icon(
            Icons.playlist_add,
            size: 24,
            color: ColorsParcelo.PrimaryTextColor,
          )
      ),
      Padding(
        padding: const EdgeInsets.only(left: 5, right: ArgParcelo.margin),
        child: GestureDetector(
            onTap: () {
              print('pressed, search');
              MainViewState.pageController.animateToPage(2, curve: Curves.linear, duration: Duration(milliseconds: 200));
            },
            child: Icon(
              Icons.search,
              size: 24,
              color: ColorsParcelo.PrimaryTextColor,
            )
        ),
      ),
    ],
  );
}

