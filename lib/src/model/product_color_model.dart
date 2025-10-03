import 'package:flutter/widgets.dart';

class ProductColorModel {
  final String imageUrl;
  final Color color;

  ProductColorModel({required this.imageUrl, required this.color});

  factory ProductColorModel.fromJson(Map<String, dynamic> json) {
    return ProductColorModel(
      imageUrl: json['imageUrl'] ?? '',
      color: Color(int.tryParse(json['hexColor']) ?? 0xFF000000),
    );
  }
}
