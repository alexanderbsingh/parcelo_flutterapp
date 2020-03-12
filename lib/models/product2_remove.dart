import 'package:parcelo/models/price.dart';

class Product2 {
  final String id;
  final String name;
  final String manufacturer;
  final String description;
  final String image;
  final List<PriceProduct2> prices;

  Product2({this.id, this.name, this.description, this.manufacturer, this.image, this.prices});

  factory Product2.fromJson(Map<String, dynamic> json) {
    return Product2(
      id: json['id'],
      name: json['name'],
      manufacturer: json['manufacturer'],
      description: json['description'],
      image: json['image'],
      prices: findPrices2(json['prices']),
    );
  }
}


List<PriceProduct2> findPrices2(List<dynamic> json) {
    List<PriceProduct2> pricesUnsorted = new List();
    var num = 10;

    for (var n = json.length; n >= 0; n--) {
      try {
        //print(PriceProduct2.fromJson(json[n -1]).toString() + ' prices');
        pricesUnsorted.add(PriceProduct2.fromJson(json[n-1]));
      } catch (e) {
        //print(e.toString() + ' price error');
        break;
      }
    }
    //print(pricesUnsorted.length.toString() + ' list of prices');
    List<PriceProduct2> pricesSorted = sortByPrice(pricesUnsorted);

    return pricesSorted;
}

List<PriceProduct2> sortByPrice(List<PriceProduct2> prices) {
  prices.sort((a, b) => a.price.compareTo(b.price));
  List<PriceProduct2> sortedByPrice = prices;
  return sortedByPrice;
}