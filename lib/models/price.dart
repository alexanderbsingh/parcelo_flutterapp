import 'package:parcelo/models/product.dart';
import 'package:parcelo/models/store.dart';

class PriceStore {
  final int price;
  final String currency;
  final ProductStore product;

  PriceStore({this.price, this.currency, this.product});

  factory PriceStore.fromJson(Map<String, dynamic> json) {
    return PriceStore(
      price: json['price'],
      currency: json['currency'],
      product: ProductStore.fromJson(json['product'])
    );
  }
}

class PriceProduct {
  final int price;
  final String currency;
  final StoreProduct store;

  PriceProduct({this.price, this.currency, this.store});

  factory PriceProduct.fromJson(Map<String, dynamic> json) {
    return PriceProduct(
      price: json['price'],
      currency: json['currency'],
      store: StoreProduct.fromJson(json['shop'])
    );
  }
}