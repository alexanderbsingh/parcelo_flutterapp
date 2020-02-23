import 'package:http/http.dart';
import 'dart:convert';
import 'package:parcelo/globalVar.dart';

addToCart(String cartId, String productId) async {
  String url = 'http://' + host + ':3000/api/carts/' + cartId + '/add';
  Map<String, String> data = {"productId": productId,};

  Response response = await post(url, body: json.encode(data), headers: {"Content-Type": "application/json", "Authorization": "Bearer " + userToken});
  print(response.body);

}