import 'package:flutter/material.dart';
import 'package:parcelo/argParcelo.dart';
import 'package:parcelo/colorsParcelo.dart';
import 'package:parcelo/customWidget/specificList.dart';
import 'package:parcelo/profile/profileTop.dart';
import 'package:parcelo/profile/yourAddresses.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: ArgParcelo.margin, right: ArgParcelo.margin),
              child: profileTop(context),
            ),
            yourAddresses(context),

            Padding(
              padding: EdgeInsets.only(left: ArgParcelo.margin, right: ArgParcelo.margin),
              child: Column(
                children: <Widget>[
                  specificList(context, 'Your Favourites', 'Everything you hearted', true, true, ColorsParcelo.PrimaryTextColor, false, 'toWhere'),
                  specificList(context, 'All orders', 'Everyone of your orders, latest to the first', true, true, ColorsParcelo.PrimaryTextColor, false, 'toWhere'),
                  Padding(
                    padding: EdgeInsets.only(top: 14, bottom: 8),
                    child: Divider(color: Colors.black26, height: 0.5,),
                  ),
                  specificList(context, 'Go Pro', 'Unlimited Free Dilivery', true, false, Colors.orangeAccent, false, 'toWhere'),
                  specificList(context, 'Invite friends', 'Get 1 Frree Dilivery per friend', true, false, ColorsParcelo.PrimaryTextColor, false, 'toWhere'),
                  specificList(context, 'Gift Cards', 'The perfect gift', true, false, ColorsParcelo.PrimaryTextColor, false, 'toWhere'),
                ],
              ),
            )
          ],
        )
    );
  }
}