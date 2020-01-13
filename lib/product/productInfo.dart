import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:parcelo/product/expansionTileHeader.dart';
import 'package:parcelo/product/productInfoCell.dart';

import '../argParcelo.dart';
import '../colorsParcelo.dart';

Widget productInfo(BuildContext context, int pos1, int pos2) {
  return Container(
  color: Colors.white,
  child: Padding(
    padding: EdgeInsets.all(0),//EdgeInsets.only(left: ArgParcelo.margin, top: 24, right: ArgParcelo.margin),
    child: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: ArgParcelo.margin, top: 24, right: ArgParcelo.margin),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Product Name',
                    style: TextStyle(
                        color: ColorsParcelo.PrimaryTextColor,
                        fontWeight: FontWeight.w600,
                        fontSize: ArgParcelo.header
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 1),
                    child: Text('Company',
                      style: TextStyle(
                          color: ColorsParcelo.SecondaryTextColor,
                          fontWeight: FontWeight.w500,
                          fontSize: ArgParcelo.productCompany
                      ),
                    ),
                  ),
                ]
              ),

              Expanded(child: Divider(color: Colors.transparent)),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text('100 kr',
                    style: TextStyle(
                        color: ColorsParcelo.PrimaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: ArgParcelo.header
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 1),
                    child: Text('Inkl. moms',
                      style: TextStyle(
                          color: ColorsParcelo.SecondaryTextColor,
                          fontWeight: FontWeight.normal,
                          fontSize: ArgParcelo.smallDescription
                      ),
                    ),
                  ),
                ],
              )

            ],
          ),
        ),
        
        Padding(
          padding: EdgeInsets.only(left: ArgParcelo.margin, top: 20, right: ArgParcelo.margin),
          child: ConfigurableExpansionTile(
            headerExpanded: expansionTileHeader(context, 'Product Info', Icons.keyboard_arrow_up),
            header: expansionTileHeader(context, 'Product Info', Icons.keyboard_arrow_down),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: productInfoCell(context, 'Title', 'Info'),
              ),
              /*ListView.builder(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, pos) {return productInfoCell(context, 'Title', 'Info');},
                itemCount: 3,
              ),*/
            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.only(left: ArgParcelo.margin, top: 6),
          child: Divider(
            color: ColorsParcelo.DarkGreyColor,
            height: 2,
          ),
        )
      ],
    ),
  ),
  );
}