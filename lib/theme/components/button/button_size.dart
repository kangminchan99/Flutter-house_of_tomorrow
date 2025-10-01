part of 'button.dart';

enum ButtonSize {
  small,
  medium,
  large;

  // 사이즈에 따라 패딩 크기 반환
  double get padding {
    switch (this) {
      case ButtonSize.small:
        return 8.0;
      case ButtonSize.medium:
        return 12.0;
      case ButtonSize.large:
        return 16.0;
    }
  }

  TextStyle getTextStyle(BuildContext context) {
    switch (this) {
      case ButtonSize.small:
        return context.typo.subtitle2;
      case ButtonSize.medium:
        return context.typo.subtitle1;
      case ButtonSize.large:
        return context.typo.headline6;
    }
  }
}
