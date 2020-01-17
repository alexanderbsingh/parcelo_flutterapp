import 'package:flutter/material.dart';

import 'network/services/product_service.dart';
import 'network/services/shop_service.dart';

Future whichService(String type) async{
  if (type == 'top') {
    return ['Lorem ipsum,', 'Lorem ipsum,'];
  } else if (type == 'product') {
    return await fetchProducts();
  } else if (type == 'store') {
    return await fetchShops();
  } else if (type == 'smallProduct') {
    return await fetchProducts();
  } else {
    return ['Lorem ipsum,'];
  }
}