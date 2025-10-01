// foundation - 앱에서 사용할 기초 요소
import 'package:flutter/material.dart';
import 'package:houseoftomorrow/theme/res/typo.dart';

part 'app_color.dart';
part 'app_deco.dart';
part 'app_typo.dart';

abstract class AppTheme {
  late final Brightness brightness;
  late final AppColor color;
  late final AppDeco deco;
  late final AppTypo typo;
}
