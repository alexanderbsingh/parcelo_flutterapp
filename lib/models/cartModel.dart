
import 'package:parcelo/models/product.dart';

class CartModel {
  final String id;
  final int total;
  final String currency;
  final List<Product> products;
  final String userId;


  CartModel({this.id, this.total, this.currency, this.products, this.userId});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      total: json['total'],
      currency: json['currency'],
      products: findProducts(json['products']),
      userId: json['userId']
    );
  }
}

List<Product> findProducts(List<dynamic> json) {
    List<Product> products = new List();
    var num = 10;

    for (var n = num; n >= 0; n--) {
      try {
        print(Product.fromJson(json[num - n]).toString() + ' products');
        products.add(Product.fromJson(json[num - n]));
      } catch (e) {
        print(e);
        break;
      }
    }
    return products;
}