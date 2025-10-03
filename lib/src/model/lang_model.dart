import 'package:houseoftomorrow/util/helper/intl_helper.dart';

class LangModel {
  final String ko;
  final String en;

  LangModel({required this.ko, required this.en});

  factory LangModel.fromJson(Map<String, dynamic> json) {
    return LangModel(ko: json['ko'] ?? '', en: json['en'] ?? '');
  }

  @override
  String toString() => IntlHelper.isKo ? ko : en;
}
