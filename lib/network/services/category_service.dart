import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:parcelo/models/category.dart';

import '../../globalVar.dart';

Future<List<Category>> fetchCategories() async {
  List<Category> categories= new List<Category>();

  final response = await http.get(
    'http://' + host + ':3000/api/categories/',
  );
  final responseJson = json.decode(response.body);
  Iterable list = responseJson;
  categories = list.map((shop) => Category.fromJson(shop)).toList();

  //print(categories.length.toString() + " categories loaded");

  return categories;
}

Future<CategoryFull> fetchCategory(String categorySlug) async {
  CategoryFull category = new CategoryFull();

  final response = await http.get(
    'http://' + host + ':3000/api/categories/' + categorySlug,
  );

  Map categoryMap = jsonDecode(response.body);
  category = CategoryFull.fromJson(categoryMap);

  //print(category.name.toString() + " loaded");
  //print(categoryMap.toString() + " loaded this json response");

  return category;
}