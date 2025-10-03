import 'package:houseoftomorrow/src/model/lang_model.dart';
import 'package:houseoftomorrow/src/model/product_color_model.dart';

class ProductModel {
  final LangModel name;
  final LangModel brand;
  final LangModel desc;
  final int price;
  final String priceUnit;
  final String rating;
  final List<ProductColorModel> productColorList;

  ProductModel({
    required this.name,
    required this.brand,
    required this.desc,
    required this.price,
    required this.priceUnit,
    required this.rating,
    required this.productColorList,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: LangModel.fromJson(json['name'] ?? {}),
      brand: LangModel.fromJson(json['brand'] ?? {}),
      desc: LangModel.fromJson(json['desc'] ?? {}),
      price: json['price'] ?? 0,
      priceUnit: json['priceUnit'] ?? '₩',
      rating: json['rating'] ?? '0.0',
      productColorList: (json['colorList'] ?? []).map<ProductColorModel>((c) {
        return ProductColorModel.fromJson(c);
      }).toList(),
    );
  }
}
