
import 'package:parcelo/models/product2_remove.dart';

class CartModel {
  final String id;
  final int total;
  final String currency;
  final List<Product2> products;
  final String userId;

  CartModel({this.id, this.total, this.currency, this.products, this.userId});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      total: json['total'],
      currency: json['currency'],
      products: findProducts(json['products']),
      userId: json['userId'],
    );
  }
}

List<Product2> findProducts(List<dynamic> json) {
    List<Product2> products = new List();

    for (var n = json.length; n >= 0; n--) {
      try {
        products.add(Product2.fromJson(json[n-1]));
      } catch (e) {
        //print(e);
        break;
      }
    }
    return products;
}