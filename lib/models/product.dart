import 'package:parcelo/models/price.dart';

class Product {
  final String id;
  final String name;
  final String manufacturer;
  final String description;
  final String image;
  final List<PriceProduct> prices;

  Product({this.id, this.name, this.description, this.manufacturer, this.image, this.prices});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      manufacturer: json['manufacturer'],
      description: json['description'],
      image: json['image'],
      prices: findPrices(json['prices']),
    );
  }
}

class ProductStore {
  final String id;
  final String slug;
  final String name;
  final String serialNumber;
  final String manufacturer;
  final String description;
  final String image;

  ProductStore({this.id, this.slug, this.name, this.description, this.serialNumber, this.manufacturer, this.image});

  factory ProductStore.fromJson(Map<String, dynamic> json) {
    return ProductStore(
      id: json['id'],
      slug: json['slug'],
      name: json['name'],
      serialNumber: json['serialNumber'],
      manufacturer: json['manufacturer'],
      description: json['description'],
      image: json['image'],
    );
  }
}

class ProductFull {
  final String id;
  final String slug;
  final String name;
  final String manufacturer;
  final String description;
  final String color;
  final String multiFunction;
  final bool exclusive;
  final String width;
  final String height;
  final String depth;
  final String weight;
  final List<dynamic> images;
  final List<dynamic> alternatives;
  final List<dynamic> categories;
  final List<PriceProduct> prices;
  final List<dynamic> reviews;
  final String barcode;

  ProductFull({this.id, this.slug, this.name, this.manufacturer, this.description, this.color, this.multiFunction, this.exclusive, this.width, this.height, this.depth, this.weight, this.images, this.alternatives, this.categories, this.prices, this.reviews, this.barcode});

  factory ProductFull.fromJson(Map<String, dynamic> json) {

    return ProductFull(
      id: json['id'],
      slug: json['slug'],
      name: json['name'],
      manufacturer: json['manufacturer'],
      description: json['description'],
      color: json['color'],
      multiFunction: json['multiFunction'],
      exclusive: json['exclusive'],
      width: json['width'].toString(),
      height: json['height'].toString(),
      depth: json['depth'].toString(),
      weight: json['weight'].toString(),
      images: json['images'],
      alternatives: json['alternatives'],
      categories: json['categories'],
      prices: findPrices(json['prices']),
      reviews: json['reviews'],
      barcode: json['barcode'],
    );
  }
}

List<PriceProduct> findPrices(List<dynamic> json) {
    List<PriceProduct> pricesUnsorted = new List();

    for (var n = json.length; n >= 0; n--) {
      try {
        print(PriceProduct.fromJson(json[n -1]).toString() + ' prices');
        pricesUnsorted.add(PriceProduct.fromJson(json[n -1]));
      } catch (e) {
        print(e);
        break;
      }
    }

    List<PriceProduct> pricesSorted = sortByPrice(pricesUnsorted);

    return pricesSorted;
}

List<PriceProduct> sortByPrice(List<PriceProduct> prices) {
  prices.sort((a, b) => a.price.compareTo(b.price));
  List<PriceProduct> sortedByPrice = prices;
  return sortedByPrice;
}