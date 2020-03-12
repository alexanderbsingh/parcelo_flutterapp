import 'dart:convert';

import 'package:http/http.dart';
import 'package:parcelo/models/cartModel.dart';

import '../../../globalVar.dart';

removeItemFromCart(String productId) async {
  var url = Uri.parse('http://' + host + ":3000/api/carts/73c29a76-8124-4d6c-8417-7d95dec9ed5e/remove");

  final request = Request("DELETE", url);
  request.headers.addAll(<String, String>{"Content-Type": "application/json", "Authorization": "Bearer " + userToken});
  request.body = jsonEncode({'productId' : productId});
  final response = await request.send();

  //print(response.statusCode);
}

emptyCart(CartModel cart) async {

  for (var n = cart.products.length; n >= 0; n--) {
    try {
      //print(cart.products[n -1].name);
      await removeItemFromCart(cart.products[n-1].id);
    } catch (e) {
      print(e.toString() + " removeFromCart");
      break;
    }
  }
}