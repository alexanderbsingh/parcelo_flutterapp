
import 'package:parcelo/models/product.dart';

class CartModel {
  final String id;
  final int total;
  final String currency;
  final List<ProductStore> products;
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

List<ProductStore> findProducts(List<dynamic> json) {
    List<ProductStore> products = new List();
    var num = 10;

    for (var n = num; n >= 0; n--) {
      try {
        print(Product.fromJson(json[num - n]).toString() + ' products');
        products.add(ProductStore.fromJson(json[num - n]));
      } catch (e) {
        print(e);
        break;
      }
    }
    return products;
}