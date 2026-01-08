import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:menuapp/util/model/offer.dart';

class OfferProvider extends ChangeNotifier {
  List<ImagePath> _images = [];

  List<ImagePath> get images => _images;

  Future<void> loadFromFile() async {
    final String jsonString = await rootBundle.loadString(
      'assets/data/offers.json',
    );

    final Map<String, dynamic> data = json.decode(jsonString);

    _images =
        (data['images'] as List).map((e) => ImagePath.fromJson(e)).toList();

    notifyListeners();
  }

  List<Map<String, dynamic>> toJson() {
    return _images.map((e) => e.toJson()).toList();
  }
}
