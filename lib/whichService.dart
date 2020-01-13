import 'package:flutter/material.dart';

import 'network/services/product_service.dart';
import 'network/services/shop_service.dart';

Future whichService(String type) async{
  if (type == 'top') {
    return null;
  } else if (type == 'product') {
    return await fetchProducts();
  } else if (type == 'shop') {
    return await fetchShops();
  } else {
    return null;
  }
}