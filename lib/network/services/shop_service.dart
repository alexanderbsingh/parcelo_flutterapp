import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:parcelo/models/store.dart';

Future<List<Store>> fetchStores() async {
  List<Store> shops= new List<Store>();

  final response = await http.get(
    'http://localhost:3000/api/shops/',
  );
  final responseJson = json.decode(response.body);
  Iterable list = responseJson;
  shops = list.map((shop) => Store.fromJson(shop)).toList();

  print(shops.length.toString() + " shops loaded");

  return shops;
}


Future<StoreFull> fetchStore(String storeID) async {
  StoreFull store = new StoreFull();

  final response = await http.get(
    'http://localhost:3000/api/shops/' + storeID,
  );

  Map storeMap = jsonDecode(response.body);
  store = StoreFull.fromJson(storeMap);

  print(store.name.toString() + " loaded");

  return store;
}



