import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:parcelo/models/shop.dart';

Future<List<Shop>> fetchShops() async {
  List<Shop> shops= new List<Shop>();

  final response = await http.get(
    'http://localhost:3000/api/shops/',
  );
  final responseJson = json.decode(response.body);
  Iterable list = responseJson;
  shops = list.map((shop) => Shop.fromJson(shop)).toList();

  print(shops.length.toString() + " shops loaded");

  return shops;
}



