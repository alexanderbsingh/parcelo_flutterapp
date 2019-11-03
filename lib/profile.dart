import 'package:flutter/material.dart';
import 'package:parcelo/colorsParcelo.dart';

import 'home/main.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
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
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                      onTap: () {
                        print('pressed, filter home');
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
            )

          ],
        )
    );
  }
}