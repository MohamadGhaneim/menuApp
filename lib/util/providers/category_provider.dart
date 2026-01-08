import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:menuapp/util/model/category.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> _items = [];
  bool _isLoaded = false;

  List<Category> get items => _items;
  bool get isLoaded => _isLoaded;

  Future<void> loadCategoryJson() async {
    if (_isLoaded) return;

    try {
      final String response = await rootBundle.loadString(
        'assets/data/categories.json',
      );

      final List<dynamic> data = json.decode(response);

      _items = data.map((e) => Category.fromJson(e)).toList();
      _isLoaded = true;
      notifyListeners();
    } catch (e) {
      debugPrint('Error loading categories: $e');
    }
  }
}
