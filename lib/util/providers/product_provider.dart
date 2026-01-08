import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:menuapp/util/model/product.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _products = [];
  List<Product> _discountedProducts = [];

  List<Product> get products => _products;
  List<Product> get discountedProducts => _discountedProducts;
  Future<void> loadProducts(String path) async {
    final jsonString = await rootBundle.loadString(path);
    final data = json.decode(jsonString);
    final List<dynamic> productsJson = data['product'] ?? [];
    final products = productsJson.where((e) => e['oldPrice'] == 0).toList();
    _products = products.map((e) => Product.fromJson(e)).toList();
    notifyListeners();
  }

  Future<void> loadDiscountedProducts(String path) async {
    final jsonString = await rootBundle.loadString(path);
    final data = json.decode(jsonString);
    final List<dynamic> productsJson = data['product'] ?? [];
    final products = productsJson.where((e) => e['oldPrice'] > 0).toList();
    _discountedProducts = products.map((e) => Product.fromJson(e)).toList();
    notifyListeners();
  }
}
