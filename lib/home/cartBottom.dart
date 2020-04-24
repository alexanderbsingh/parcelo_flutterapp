import 'dart:async';

import 'package:flutter/material.dart';
import 'package:parcelo/customWidget/customExpanded.dart';
import 'package:parcelo/globalVar.dart';
import 'package:parcelo/models/cartModel.dart';
import 'package:parcelo/models/product2_remove.dart';
import 'package:parcelo/network/services/post/createOrder_service.dart';
import 'package:parcelo/network/services/post/removeFromCart_service.dart';

import '../argParcelo.dart';
import '../colorsParcelo.dart';
import 'cart.dart';

Widget cartBottom(BuildContext context, StreamController<CartModel> streamCartModel) {
  return Align(
      alignment: Alignment.bottomLeft,
      child: StreamBuilder<Object>(
          stream: streamCartModel.stream,
          builder: (context, snapshot) {
            CartModel cartModel = snapshot.data as CartModel;
            return Container(
              padding: EdgeInsets.all(ArgParcelo.margin),
              height: 120 + MediaQuery.of(context).padding.bottom,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topRight: Radius.circular(ArgParcelo.bigCornerRadius), topLeft: Radius.circular(ArgParcelo.bigCornerRadius)), boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 17.0,
                ),
              ]),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: ArgParcelo.smallMargin),
                    height: 40,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'Totalt belopp',
                            style: TextStyle(
                                color: ColorsParcelo.PrimaryTextColor,
                                fontWeight: FontWeight.bold,
                                fontSize: ArgParcelo.header),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              'Inkl. moms',
                              style: TextStyle(
                                  color: ColorsParcelo.SecondaryTextColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: ArgParcelo.smallDescription),
                            ),
                          ),
                          customExpanded(),
                          Text(
                            snapshot.hasData ? calcTotal(cartModel.products) : '0 kr',
                            //'160 kr',
                            style: TextStyle(
                                color: ColorsParcelo.PrimaryTextColor,
                                fontWeight: FontWeight.bold,
                                fontSize: ArgParcelo.header),
                          ),
                        ]),
                  ),
                  FlatButton(
                    onPressed: () {
                      print('pressed order');
                      if (cartModel.products.length != 0) {
                        _showOrderDialog(context, cartModel);
                      } else {
                        _showNoOrderDialog(context);
                      }
                    },
                    color: ColorsParcelo.PrimaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0)),
                    child: Container(
                      alignment: Alignment.center,
                      height: 44,
                      width: MediaQuery.of(context).size.width -
                          ArgParcelo.margin * 2,
                      child: Text('Beställ',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16)),
                    ),
                  )
                ],
              ),
            );
          }));
}

_showOrderDialog(BuildContext context, CartModel cartModel) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ArgParcelo.cornerRadius)),
        title: new Text("Beställ"),
        content: new Text("Beställ " +
            cartModel.products.length.toString() +
            " varor för totalt: " +
            calcTotal(cartModel.products) +
            "."),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new FlatButton(
            child: new Text(
              "Beställ",
              style: TextStyle(color: ColorsParcelo.PrimaryColor),
            ),
            onPressed: () async {
              await createOrder(cartModel);
              await emptyCart(cartModel);
              Navigator.of(context).pop();
              /*setState(() {
                  
                });*/
            },
          ),
        ],
      );
    },
  );
}

_showNoOrderDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ArgParcelo.cornerRadius)),
        title: new Text("Kundvagnen är tom  : ("),
        content: new Text(
            "Din kundvagn är förtillfället tom. Upptäck nya spännande varor bland våra kategorier."),
        actions: <Widget>[
          new FlatButton(
            child: new Text("ok"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

String calcTotal(List<Product2> products){
  int total = 0;

  for (var n = products.length; n >= 0; n--) {
    try {
      total = total + products[n  -1].prices[0].price;
    } catch (e) {
      //print(e);
      break;
    }
  }
  return total.toString() + ' kr';
}
