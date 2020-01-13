import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:parcelo/models/product.dart';

Future<List<Product>> fetchProducts() async {
  List<Product> products= new List<Product>();

  final response = await http.get(
    'http://localhost:3000/api/products/',
  );
  final responseJson = json.decode(response.body);
  Iterable list = responseJson;
  products = list.map((product) => Product.fromJson(product)).toList();

  print(products.length.toString() + " products loaded");

  return products;
}



