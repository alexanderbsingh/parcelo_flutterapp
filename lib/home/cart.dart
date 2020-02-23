import 'package:flutter/material.dart';
import 'package:parcelo/cells/cartCell.dart';
import 'package:parcelo/customWidget/customExpanded.dart';
import 'package:parcelo/globalVar.dart';
import 'package:parcelo/models/cartModel.dart';
import 'package:parcelo/network/services/cart_service.dart';
import 'package:parcelo/network/services/post/createOrder_service.dart';

import '../argParcelo.dart';
import '../colorsParcelo.dart';

class Cart extends StatelessWidget {
  CartModel cart;
  @override
  Widget build(BuildContext context) {
    isInCart = true;
    return Stack(
      alignment: Alignment.bottomLeft,
      children: <Widget>[
        FutureBuilder(
          future: fetchCart("73c29a76-8124-4d6c-8417-7d95dec9ed5e"),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              oldSnapshotCart = snapshot.data;
              cart = snapshot.data as CartModel;
              return ListView.builder(
                itemBuilder: (context, pos) {
                  return cartCell(cart.products[pos]);
                },
                itemCount: cart.products.length,
              );
            
            } else if (snapshot.connectionState == ConnectionState.none) {
              return Container(height: 10, width: 10, color: Colors.white,);
            } else if (snapshot.connectionState == ConnectionState.active) {
              return Container(height: 10, width: 10, color: Colors.white,);
            } else if (snapshot.connectionState == ConnectionState.waiting){
              return Container(height: 10, width: 10, color: Colors.white,);
            }
          
          },
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
                    '700,00 kr',
                    style: TextStyle(
                      color: ColorsParcelo.PrimaryTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: ArgParcelo.header
                    ),
                  ),
                ]
               ),
             ),

             GestureDetector(
              onTap: () {
                print('pressed order');
                createOrder(cart);
              },
              child: Container(
                alignment: Alignment.center,
                height: 44,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: ColorsParcelo.PrimaryColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(22)
                ),
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
      ],
    );
  }
}
