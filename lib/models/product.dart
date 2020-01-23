import 'package:flutter/material.dart' as prefix0;

class Product {
  final String id;
  final String slug;
  final String name;
  final String serialNumber;
  final String manufacturer;
  final String description;
  final String color;
  final String multiFunction;
  final bool exclusive;
  final int width;
  final int height;
  final int depth;
  final int weight;
  final List<dynamic> images;
  final List<dynamic> alternatives;
  final String barcode;
  final String createdAt;
  final String updatedAt;
  final String categories;
  final List<dynamic> prices;

  Product({this.id, this.slug, this.name, this.description, this.serialNumber, this.manufacturer, this.color, this.multiFunction, this.exclusive, this.width, this.height, this.depth, this.weight, this.images, this.alternatives, this.barcode, this.createdAt, this.updatedAt, this.categories, this.prices});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      slug: json['slug'],
      name: json['name'],
      serialNumber: json['serialNumber'],
      manufacturer: json['manufacturer'],
      description: json['description'],
      color: json['color'],
      multiFunction: json['multiFunction'],
      exclusive: json['exclusive'],
      width: json['width'],
      height: json['height'],
      depth: json['depth'],
      weight: json['weight'],
      images: json['images'],
      alternatives: json['alternatives'],
      barcode: json['barcode'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      prices: json['prices'],
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
  final String serialNumber;
  final String manufacturer;
  final String description;
  final String color;
  final String multiFunction;
  final bool exclusive;
  final int width;
  final int height;
  final int depth;
  final int weight;
  final List<dynamic> images;
  final List<dynamic> alternatives;
  final List<dynamic> categories;
  final List<dynamic> prices;
  final List<dynamic> reviews;
  final String barcode;

  ProductFull({this.id, this.slug, this.name, this.serialNumber, this.manufacturer, this.description, this.color, this.multiFunction, this.exclusive, this.width, this.height, this.depth, this.weight, this.images, this.alternatives, this.categories, this.prices, this.reviews, this.barcode});

  factory ProductFull.fromJson(Map<String, dynamic> json) {
    return ProductFull(
      id: json['id'],
      slug: json['slug'],
      name: json['name'],
      serialNumber: json['serialNumber'],
      manufacturer: json['manufacturer'],
      description: json['description'],
      color: json['color'],
      multiFunction: json['multiFunction'],
      exclusive: json['exclusive'],
      width: json['width'],
      height: json['height'],
      depth: json['depth'],
      weight: json['weight'],
      images: json['images'],
      alternatives: json['alternatives'],
      categories: json['categories'],
      prices: json['prices'],
      reviews: json['reviews'],
      barcode: json['barcode'],
    );
  }
}