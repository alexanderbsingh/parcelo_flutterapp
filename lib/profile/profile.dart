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
                  specificList(context, 'Favoriter', 'Allt du gillat', true, true, ColorsParcelo.PrimaryTextColor, false, 'toWhere'),
                  specificList(context, 'Beställningshistorik', 'Alla dina beställningar, senaste till äldsta', true, true, ColorsParcelo.PrimaryTextColor, false, 'toWhere'),
                  Padding(
                    padding: EdgeInsets.only(top: 14, bottom: 8),
                    child: Divider(color: Colors.black26, height: 0.5,),
                  ),
                  specificList(context, 'Go Pro', 'Alltid gratis leverans', true, false, Colors.orangeAccent, false, 'toWhere'),
                  specificList(context, 'Bjud in en vän', 'Få 10 kr rabbatt per friend', true, false, ColorsParcelo.PrimaryTextColor, false, 'toWhere'),
                  specificList(context, 'Presentkort', 'Den perfekta presenten', true, false, ColorsParcelo.PrimaryTextColor, false, 'toWhere'),
                ],
              ),
            )
          ],
        )
    );
  }
}