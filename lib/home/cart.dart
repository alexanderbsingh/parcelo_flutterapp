
import 'package:flutter/material.dart';
import 'package:parcelo/cells/cartCell.dart';
import 'package:parcelo/customWidget/customExpanded.dart';
import 'package:parcelo/globalVar.dart';
import 'package:parcelo/models/cartModel.dart';
import 'package:parcelo/models/product2_remove.dart';
import 'package:parcelo/network/services/cart_service.dart';
import 'package:parcelo/network/services/post/createOrder_service.dart';
import 'package:parcelo/network/services/post/removeFromCart_service.dart';

import '../argParcelo.dart';
import '../colorsParcelo.dart';

class Cart extends StatelessWidget {
  CartModel cartModel;
  @override
  Widget build(BuildContext context) {
    isInCart = true;
    return FutureBuilder(
      future: fetchCart("73c29a76-8124-4d6c-8417-7d95dec9ed5e"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data != null) {
            oldSnapshotCart = snapshot.data;
            cartModel = snapshot.data as CartModel;
            return Stack(
                alignment: Alignment.bottomLeft,
                children: <Widget>[
                  ListView.builder(
                    itemBuilder: (context, pos) {
                      return cartCell(cartModel.products[pos]);
                    },
                    itemCount: cartModel.products.length,
                  ),
                  Container(
                    padding: EdgeInsets.all(ArgParcelo.margin),
                    height: MediaQuery.of(context).padding.bottom != 0 ? 60 + MediaQuery.of(context).padding.bottom : 130,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [BoxShadow(
                          color: Colors.black12,
                          blurRadius: 17.0,
                        ),]
                    ),
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
                                      fontSize: ArgParcelo.header
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Text(
                                    'Inkl. moms',
                                    style: TextStyle(
                                        color: ColorsParcelo.SecondaryTextColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: ArgParcelo.smallDescription
                                    ),
                                  ),
                                ),

                                customExpanded(),

                                Text(
                                  calcTotal(cartModel.products),
                                  style: TextStyle(
                                      color: ColorsParcelo.PrimaryTextColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: ArgParcelo.header
                                  ),
                                ),
                              ]
                          ),
                        ),

                        FlatButton(onPressed: (){
                          print('pressed order');
                          if (cartModel.products.length != 0) {
                            _showOrderDialog(context, cartModel);
                          } else {
                            _showNoOrderDialog(context);
                          }
                        },
                          color: ColorsParcelo.PrimaryColor,
                          shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(22.0)),
                          child: Container(
                            alignment: Alignment.center,
                            height: 44,
                            width: MediaQuery.of(context).size.width - ArgParcelo.margin *2,
                            child: Text(
                              'Beställ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16
                              )
                            ),
                          ),
                        )
                      ],
                    ),
                  )
            ]);

          } else {
            return Container(
              height: 100,
              width: 100,);
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

String calcTotal(List<Product2> products){
  int total = 0;

  for (var n = products.length; n >= 0; n--) {
    try {
      total = total + products[n  -1].prices[0].price;
    } catch (e) {
      print(e);
      break;
    }
  }
  return total.toString() + ' kr';
}

void _showOrderDialog(BuildContext context, CartModel cartModel) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(ArgParcelo.cornerRadius)),
          title: new Text("Beställ"),
          content: new Text("Beställ " + cartModel.products.length.toString() + " varor för totalt: " + calcTotal(cartModel.products) + "."),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Beställ",
              style: TextStyle(
                color: ColorsParcelo.PrimaryColor
              ),),
              onPressed: () {
                createOrder(cartModel);
                emptyCart(cartModel);
                Navigator.of(context).pop();
                
              },
            ),
          ],
        );
      },
    );
  }

  void _showNoOrderDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(ArgParcelo.cornerRadius)),
          title: new Text("Kundvagnen är tom  : ("),
          content: new Text("Din kundvagn är förtillfället tom. Upptäck nya spännande varor bland våra kategorier."),
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


