import 'package:flutter/material.dart';
import 'package:houseoftomorrow/theme/dark_theme.dart';
import 'package:houseoftomorrow/theme/foundation/app_theme.dart';
import 'package:houseoftomorrow/theme/light_theme.dart';
import 'package:provider/provider.dart';

// 테마는 앱의 전역에서 공유되는 공유상태이므로 테마가 변경되는 경우 앱 전반에 알림을 보내는
// ThemeService 클래스를 생성하여 상태관리를 구현
class ThemeService with ChangeNotifier {
  ThemeService({AppTheme? theme}) : theme = theme ?? LightTheme();
  // 현재 테마
  AppTheme theme;

  // 테마 변경
  void toggleTheme() {
    if (theme.brightness == Brightness.light) {
      theme = DarkTheme();
    } else {
      theme = LightTheme();
    }
    notifyListeners();
  }

  /// Material ThemeData 커스텀
  ThemeData get themeData {
    return ThemeData(
      /// Scaffold
      scaffoldBackgroundColor: theme.color.surface,

      /// AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: theme.color.surface,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: theme.color.text),
        titleTextStyle: theme.typo.headline2.copyWith(color: theme.color.text),
      ),
    );
  }
}

extension ThemeServiceExt on BuildContext {
  ThemeService get themeService => watch<ThemeService>();
  AppTheme get theme => themeService.theme;
  AppColor get color => theme.color;
  AppDeco get deco => theme.deco;
  AppTypo get typo => theme.typo;
}
