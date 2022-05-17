library responsiveness;

import 'dart:ui';

enum Screen { mobile, desktop }

/// This service helps to make the UI responsive and clean....
class Responsiveness {
  /// My final screen size....
  String tag = "Responsiveness";
  static const Size _myTestMobileSize = Size(360.0, 728.0);
  static const Size _myTestDesktopSize = Size(1536.0, 753.6);
  static Size screenSize = Size.zero;
  static Screen screenType = Screen.mobile;

  /// Create instance with the screen size and screen type....
  /// ```
  /// Responsiveness.init(MediaQuery.of(context).size, Screen.mobile);
  /// ```
  static void init(Size size, Screen type) {
    screenSize = size;
    screenType = type;
  }

  /// You can pass the fixed size width value it will automatically responsive for other mobile....
  /// ```
  /// Responsiveness.width(150),
  /// ```
  static double width(double value) {
    if (screenType == Screen.mobile) {
      return screenSize.width * (value / _myTestMobileSize.width);
    } else {
      return screenSize.width * (value / _myTestDesktopSize.width);
    }
  }

  /// You can pass the fixed size height value it will automatically responsive for other mobile....
  /// ```
  /// Responsiveness.height(150),
  /// ```
  static double height(double value) {
    if (screenType == Screen.mobile) {
      return screenSize.height * (value / _myTestMobileSize.height);
    } else {
      return screenSize.height * (value / _myTestDesktopSize.height);
    }
  }

  /// You can pass the ratio size width value it will automatically responsive for other mobile....
  /// ```
  /// Responsiveness.widthRatio(0.5),
  /// ```
  static double widthRatio(double value) {
    return screenSize.width * value;
  }

  /// You can pass the ratio size height value it will automatically responsive for other mobile....
  /// ```
  /// Responsiveness.heightRatio(0.5),
  /// ```
  static double heightRatio(double value) {
    return screenSize.height * value;
  }
}
