import 'package:flutter/material.dart';
import 'package:parcelo/colorsParcelo.dart';

class HomeToolbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: GestureDetector(
            onTap: () {
              print('pressed, profile');
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
              print('pressed, search');
            },
            child: Icon(
              Icons.playlist_add,
              size: 24,
              color: ColorsParcelo.PrimaryTextColor,
            )
        ),
        Padding(
          padding: const EdgeInsets.only(left:5, right: 20),
          child: GestureDetector(
              onTap: () {
                print('pressed, filter home');
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
}
