
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:parcelo/cells/cartCell.dart';
import 'package:parcelo/customWidget/customExpanded.dart';
import 'package:parcelo/globalVar.dart';
import 'package:parcelo/models/cartModel.dart';
import 'package:parcelo/models/product2_remove.dart';
import 'package:parcelo/network/services/cart_service.dart';
import 'package:parcelo/network/services/post/createOrder_service.dart';
import 'package:parcelo/network/services/post/removeFromCart_service.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../argParcelo.dart';
import '../colorsParcelo.dart';
import 'home.dart';

class Cart extends StatefulWidget {
  StreamController<CartModel> streamCartModel;
  Cart({Key key, @required this.streamCartModel});
  @override
  _CartState createState() => _CartState(streamCartModel: streamCartModel);
}

class _CartState extends State<Cart> {
  StreamController<CartModel> streamCartModel;
  _CartState({Key key, @required this.streamCartModel});

  final RefreshController _refreshController = RefreshController();

  CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    isInCart = true;
    print('building the cart');
    return Visibility(
      visible: isInCart,
      child: FutureBuilder(
        future: fetchCart("73c29a76-8124-4d6c-8417-7d95dec9ed5e"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data != null) {
              oldSnapshotCart = snapshot.data;
              cartModel = snapshot.data as CartModel;
              streamCartModel.add(cartModel);
              //heightOfHome = (cartModel.products.length * 122.0);
              return Stack(
                  alignment: Alignment.bottomLeft,
                  children: <Widget>[
                    SmartRefresher(
                      controller: _refreshController,
                      enablePullDown: true,
                      onRefresh: () async {
                        _refreshController.refreshCompleted();
                        setState(() {});
                      },
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, pos) {
                          return cartCell(cartModel.products[pos]);
                        },
                        itemCount: cartModel.products.length,
                      ),
                    ),
                    // Container(
                    //   padding: EdgeInsets.all(ArgParcelo.margin),
                    //   height: MediaQuery.of(context).padding.bottom != 0 ? 60 + MediaQuery.of(context).padding.bottom : 130,
                    //   width: MediaQuery.of(context).size.width,
                    //   alignment: Alignment.topLeft,
                    //   decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       boxShadow: [BoxShadow(
                    //         color: Colors.black12,
                    //         blurRadius: 17.0,
                    //       ),]
                    //   ),
                    //   child: Column(
                    //     children: <Widget>[
                    //       Container(
                    //         padding: EdgeInsets.only(bottom: ArgParcelo.smallMargin),
                    //         height: 40,
                    //         child: Row(
                    //             crossAxisAlignment: CrossAxisAlignment.end,
                    //             children: <Widget>[
                    //               Text(
                    //                 'Totalt belopp',
                    //                 style: TextStyle(
                    //                     color: ColorsParcelo.PrimaryTextColor,
                    //                     fontWeight: FontWeight.bold,
                    //                     fontSize: ArgParcelo.header
                    //                 ),
                    //               ),

                    //               Padding(
                    //                 padding: EdgeInsets.only(left: 5),
                    //                 child: Text(
                    //                   'Inkl. moms',
                    //                   style: TextStyle(
                    //                       color: ColorsParcelo.SecondaryTextColor,
                    //                       fontWeight: FontWeight.w400,
                    //                       fontSize: ArgParcelo.smallDescription
                    //                   ),
                    //                 ),
                    //               ),

                    //               customExpanded(),

                    //               Text(
                    //                 calcTotal(cartModel.products),
                    //                 style: TextStyle(
                    //                     color: ColorsParcelo.PrimaryTextColor,
                    //                     fontWeight: FontWeight.bold,
                    //                     fontSize: ArgParcelo.header
                    //                 ),
                    //               ),
                    //             ]
                    //         ),
                    //       ),

                    //       FlatButton(onPressed: (){
                    //         print('pressed order');
                    //         if (cartModel.products.length != 0) {
                    //           _showOrderDialog(context, cartModel);
                    //         } else {
                    //           _showNoOrderDialog(context);
                    //         }
                    //       },
                    //         color: ColorsParcelo.PrimaryColor,
                    //         shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(22.0)),
                    //         child: Container(
                    //           alignment: Alignment.center,
                    //           height: 44,
                    //           width: MediaQuery.of(context).size.width - ArgParcelo.margin *2,
                    //           child: Text(
                    //             'Beställ',
                    //             style: TextStyle(
                    //                 color: Colors.white,
                    //                 fontWeight: FontWeight.w600,
                    //                 fontSize: 16
                    //             )
                    //           ),
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // )
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
      ),
    );
  }

  
}




  


