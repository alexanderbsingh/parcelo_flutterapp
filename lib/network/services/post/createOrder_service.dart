import 'dart:convert';
import 'package:http/http.dart';
import 'package:parcelo/models/cartModel.dart';
import 'package:parcelo/models/orderModel.dart';
import 'package:parcelo/models/product2_remove.dart';

import '../../../globalVar.dart';

createOrder(CartModel cart) async {
  Order order = Order(
    currency: 'sek', 
    products: orderProducts(cart.products),
    shops: ['1d1cfc2f-368c-4ec7-ad59-08ea47e27cb0'],
    addresses: ['712c0263-6969-4503-beb8-b8f2ca6cec9d']
  );


  String url = 'http://' + host + ':3000/api/orders/';
 // Map<String, dynamic> data = order as Map<String, dynamic>;

  Response response = await post(url, body: json.encode(order.toJson()), headers: {"Content-Type": "application/json", "Authorization": "Bearer " + userToken});
  //print(response.body);

}

List<OrderProduct> orderProducts(List<Product2> products) {
    List<OrderProduct> productsList = new List();

    for (var n = products.length; n >= 0; n--) {
      try {
        OrderProduct product = OrderProduct(id: products[n-1].id, shopId: '1d1cfc2f-368c-4ec7-ad59-08ea47e27cb0', price: products[n-1].prices[0].price.toString());
        productsList.add(product);

        //print(products[n-1].name);
      } catch (e) {
        print(e.toString() + " create order service");
        break;
      }
    }
    return productsList;
}

