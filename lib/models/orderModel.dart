class Order {
  final String currency;
  final List<OrderProduct> products;
  final List<String> shops;
  final List<String> addresses;

  Order({this.currency, this.products, this.shops, this.addresses});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      currency: json['currency'],
      products: json['products'],
      shops: json['shops'],
      addresses: json['addresses'],
    );
  }

  Map<String, dynamic> toJson() => {
      'currency': currency,
      'products': products,
      'shops': shops,
      'addresses': addresses,
  };
}

Map<String, dynamic> productsJson(List<OrderProduct> products) {
  Map<String, dynamic> productsJson;
  var num = products.length;

  for (var n = num; n >= 0; n--) {
    try {
      products[n].toJson;
    } catch (e) {
      //print(e);
      break;
    }
  }
  return productsJson;
}

class OrderProduct {
  final String id;
  final String shopId;
  final String price;

  OrderProduct({this.id, this.shopId, this.price});

  factory OrderProduct.fromJson(Map<String, dynamic> json) {
    return OrderProduct(
      id: json['id'],
      shopId: json['shopId'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'shopId': shopId,
    'price': price,
  };
}
