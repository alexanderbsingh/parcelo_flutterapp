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
        body: Padding(
          padding: EdgeInsets.only(left: ArgParcelo.margin, right: ArgParcelo.margin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              profileTop(context),
              yourAddresses(context),
              specificList(context, 'Your Favourites', 'Everything you hearted', true, ColorsParcelo.PrimaryTextColor),
              specificList(context, 'All orders', 'Everyone of your orders, latest to the first', true, ColorsParcelo.PrimaryTextColor),
              Padding(
                padding: const EdgeInsets.only(top: 14, bottom: 8),
                child: Divider(color: Colors.black26, height: 0.5,),
              ),
              specificList(context, 'Go Pro', 'Unlimited Free Dilivery', false, Colors.orangeAccent),
              specificList(context, 'Invite friends', 'Get 1 Frree Dilivery per friend', false, ColorsParcelo.PrimaryTextColor),
              specificList(context, 'Gift Cards', 'The perfect gift', false, ColorsParcelo.PrimaryTextColor),

            ],
          ),
        )
    );
  }
}