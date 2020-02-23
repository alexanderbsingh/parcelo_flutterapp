import 'dart:convert';
import 'package:http/http.dart';
import 'package:parcelo/home/cart.dart';
import 'package:parcelo/models/cartModel.dart';
import 'package:parcelo/models/orderModel.dart';
import 'package:parcelo/models/product.dart';

import '../../../globalVar.dart';

createOrder(CartModel cart) async {
  Order order = Order(
    currency: 'sek', 
    products: orderProducts(cart.products),
    shops: ['0b22e44e-b110-4a44-b287-9271a85bbbca'],
    addresses: ['712c0263-6969-4503-beb8-b8f2ca6cec9d']
  );


  String url = 'http://' + host + ':3000/api/orders/';
 // Map<String, dynamic> data = order as Map<String, dynamic>;

  Response response = await post(url, body: json.encode(order.toJson()), headers: {"Content-Type": "application/json", "Authorization": "Bearer " + userToken});
  print(response.body);

}

List<OrderProduct> orderProducts(List<ProductStore> products) {
    List<OrderProduct> productsList = new List();

    for (var n = products.length; n >= 0; n--) {
      try {
        OrderProduct product = OrderProduct(id: '1dfb80c5-2ac0-4670-925e-59e9400d6c2f', shopId: '0b22e44e-b110-4a44-b287-9271a85bbbca', price: '7000'); 
        productsList.add(product);

        print(products[n-1].name);
      } catch (e) {
        print(e);
        break;
      }
    }
    return productsList;
}