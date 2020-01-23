import 'package:parcelo/models/price.dart';

class Store {
  final String id;
  final String slug;
  final String name;
  final String description;
  final String logo;
  final String banner;
  final String type;

  Store({this.id, this.slug, this.name, this.description, this.logo, this.banner, this.type});

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      id: json['id'],
      slug: json['slug'],
      name: json['name'],
      description: json['description'],
      logo: json['logo'],
      banner: json['banner'],
      type: json['type'],
    );
  }
}

class StoreFull {
  final String id;
  final String slug;
  final String name;
  final String description;
  final String type;
  final String logo;
  final String banner;
  final List<Price> prices;

  StoreFull({this.id, this.slug, this.name, this.description, this.logo, this.banner, this.type, this.prices});

  factory StoreFull.fromJson(Map<String, dynamic> json) {
    

    return StoreFull(
      id: json['id'],
      slug: json['slug'],
      name: json['name'],
      description: json['description'],
      logo: json['logo'],
      banner: json['banner'],
      type: json['type'],
      prices: findPrices(json['prices']),
    );
  }
}

List<Price> findPrices(List<dynamic> json) {
    List<Price> prices = new List();
    var num = 10;

    for (var n = num; n >= 0; n--) {
      try {
        print(Price.fromJson(json[num - n]).toString() + ' prices');
        prices.add(Price.fromJson(json[num - n]));
      } catch (e) {
        print(e);
        break;
      }
    }
    return prices;
}