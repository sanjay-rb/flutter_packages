import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';

import 'package:responsiveness/responsiveness.dart';

void main() {
  test('get 150 width on mobile', () {
    Responsiveness.init(const Size(360.0, 728.0), Screen.mobile);
    expect(Responsiveness.width(150), 150);
  });

  test('get 150 height on mobile', () {
    Responsiveness.init(const Size(360.0, 728.0), Screen.mobile);
    expect(Responsiveness.height(150), 150);
  });

  test('get 150 width on desktop', () {
    Responsiveness.init(const Size(1536.0, 753.6), Screen.desktop);
    expect(Responsiveness.width(150), 150);
  });

  test('get 150 height on desktop', () {
    Responsiveness.init(const Size(1536.0, 753.6), Screen.desktop);
    expect(Responsiveness.height(150), 150);
  });

  test('get 50% width on mobile', () {
    Responsiveness.init(const Size(360.0, 728.0), Screen.mobile);
    expect(Responsiveness.widthRatio(0.5), 180);
  });

  test('get 50% height on mobile', () {
    Responsiveness.init(const Size(360.0, 728.0), Screen.mobile);
    expect(Responsiveness.heightRatio(0.5), 364);
  });

  test('get 50% width on desktop', () {
    Responsiveness.init(const Size(1536.0, 753.6), Screen.desktop);
    expect(Responsiveness.widthRatio(0.5), 768);
  });

  test('get 50% height on desktop', () {
    Responsiveness.init(const Size(1536.0, 753.6), Screen.desktop);
    expect(Responsiveness.heightRatio(0.5), 376.8);
  });
}
