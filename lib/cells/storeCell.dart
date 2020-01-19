import 'package:flutter/material.dart';
import 'package:parcelo/Store/storeView.dart';
import 'package:parcelo/customAnimation/slideBottomRoute.dart';
import 'package:parcelo/home/home.dart';
import 'package:parcelo/models/store.dart';

import '../argParcelo.dart';
import '../colorsParcelo.dart';

class StoreCell extends StatefulWidget {
  Store store;
  StoreCell({Key key, @required this.store}) : super(key: key);

  @override
  _StoreCellState createState() => _StoreCellState(store: store);
}
class _StoreCellState extends State<StoreCell> {
  Store store;
  _StoreCellState({Key key, @required this.store});
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('pressed, shop');
        Navigator.push(context, SlideBottomRoute(page: StoreView(store: store)));
      },
      child: Padding(
      padding: const EdgeInsets.only(top: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: Alignment.topRight,
            children: <Widget>[
              
              Container(
              height: 160,
              width: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(store.banner),
                    fit: BoxFit.fill
                  ),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(ArgParcelo.cornerRadius)
                ),
              ),

              Padding(
                padding: EdgeInsets.only(right: ArgParcelo.smallMargin, top: ArgParcelo.smallMargin),
                child: GestureDetector(
                  onTap: () {
                    print('pressed, save');
                    isLiked = !isLiked;
                    setState(() {});
                  },
                  child: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    size: 24,
                    color: Colors.white,
                  )
                ),
              ),
            ],
          ),

          Padding(
          padding: const EdgeInsets.only(left: 2, top: 10.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(store.name,
              style: TextStyle(
                  color: ColorsParcelo.PrimaryTextColor,
                  fontWeight: FontWeight.w600,
                  fontSize: ArgParcelo.productTitleSmall
              ),
            ),

            Text(store.description,
              style: TextStyle(
                  color: ColorsParcelo.AccentColor,
                  fontWeight: FontWeight.w500,
                  fontSize: ArgParcelo.productCompany
              ),
            ),
          ],
            ),
          ),

            
        ],
      ),
    ),
  );
  } 
}

