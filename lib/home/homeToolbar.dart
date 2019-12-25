import 'package:flutter/material.dart';
import 'package:parcelo/colorsParcelo.dart';
import 'package:parcelo/customAnimation/slideBottomRoute.dart';

import '../argParcelo.dart';
import 'filterHome.dart';
import 'main.dart';

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
                color: ColorsParcelo.LightGreyColor,
                borderRadius: BorderRadius.circular(18.5)
            ),
          ),
        ),
      ),
      Expanded(
        child: Divider(
          color: Colors.transparent,
        ),
      ),
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

