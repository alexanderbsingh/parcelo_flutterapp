import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:parcelo/models/product.dart';
import 'package:parcelo/product/expansionTileHeader.dart';
import 'package:parcelo/product/productInfoCell.dart';

import '../argParcelo.dart';
import '../colorsParcelo.dart';

Widget productInfo(BuildContext context, ProductFull product, String price) {
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
                  Text(product.name,
                    style: TextStyle(
                        color: ColorsParcelo.PrimaryTextColor,
                        fontWeight: FontWeight.w600,
                        fontSize: ArgParcelo.header
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 1),
                    child: Text(product.manufacturer,
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
                  Text(price + ' kr',
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
                child: productInfoCell(context, 'Description', product.description.toString()),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: productInfoCell(context, 'Manufacturer', product.manufacturer.toString()),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: productInfoCell(context, 'Serial Number', product.serialNumber.toString()),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: productInfoCell(context, 'Height', product.height.toString()),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: productInfoCell(context, 'Width', product.width.toString()),
              ),
              
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: productInfoCell(context, 'Depth', product.depth.toString()),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: productInfoCell(context, 'Weight', product.weight.toString()),
              ),
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