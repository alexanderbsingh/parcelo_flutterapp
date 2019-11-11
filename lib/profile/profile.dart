import 'package:flutter/material.dart';
import 'package:parcelo/argParcelo.dart';
import 'package:parcelo/colorsParcelo.dart';
import 'package:parcelo/profile/profileSpecificList.dart';
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
            profileTop(context),
            yourAddresses(context),
            profileSpecificList(context, 'Your Favourites', 'Everything you hearted', true, ColorsParcelo.PrimaryTextColor),
            profileSpecificList(context, 'All orders', 'Everyone of your orders, latest to the first', true, ColorsParcelo.PrimaryTextColor),
            Padding(
              padding: const EdgeInsets.only(top: 14, bottom: 8),
              child: Divider(color: Colors.black26, height: 0.5,),
            ),
            profileSpecificList(context, 'Go Pro', 'Unlimited Free Dilivery', false, Colors.orangeAccent),
            profileSpecificList(context, 'Invite friends', 'Get 1 Frree Dilivery per friend', false, ColorsParcelo.PrimaryTextColor),
            profileSpecificList(context, 'Gift Cards', 'The perfect gift', false, ColorsParcelo.PrimaryTextColor),

          ],
        )
    );
  }
}