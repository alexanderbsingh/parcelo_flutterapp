import 'package:parcelo/models/product.dart';

class Category {
  final String slug;
  final String name;
  final String description;
  final String createdAt;
  final String updatedAt;


  Category({this.slug, this.name, this.description, this.createdAt, this.updatedAt});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      slug: json['slug'],
      name: json['name'],
      description: json['description'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt']
    );
  }
}

class CategoryFull {
  final String slug;
  final String name;
  final String description;
  final String createdAt;
  final String updatedAt;
  final List<Product> products;

  CategoryFull({this.slug, this.name, this.description, this.createdAt, this.updatedAt, this.products});

  factory CategoryFull.fromJson(Map<String, dynamic> json) {
    return CategoryFull(
      slug: json['slug'],
      name: json['name'],
      description: json['description'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      products: findProducts(json['products']),
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