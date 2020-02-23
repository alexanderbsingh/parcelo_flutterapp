
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:parcelo/models/cartModel.dart';
import '../../globalVar.dart';

Future<CartModel> fetchCart(String cartSlug) async {
  CartModel cart = new CartModel();

  final response = await http.get(
    'http://' + host + ':3000/api/carts/' + cartSlug, 
    headers: {"Authorization": "Bearer " + userToken}
  );

  Map cartMap = jsonDecode(response.body);
  cart = CartModel.fromJson(cartMap);

  print("Cart id: " + cart.id.toString() + " loaded");
  print(cartMap.toString() + " loaded this json response");

  return cart;
}