import "package:flutter/material.dart";

abstract final class CustomStyles {
  static const String _openSansFamily = "OpenSans";

  static TextStyle get openSansRegular24_28 => const .new(
    fontFamily: _openSansFamily,
    fontWeight: .w400,
    fontSize: 24,
    height: 28 / 24,
    letterSpacing: 0,
  );

  static TextStyle get openSansRegular18_24 => const .new(
    fontFamily: _openSansFamily,
    fontWeight: .w400,
    fontSize: 18,
    height: 24 / 18,
    letterSpacing: 0,
  );

  static TextStyle get openSansRegular14_18 => const .new(
    fontFamily: _openSansFamily,
    fontWeight: .w400,
    fontSize: 14,
    height: 18 / 14,
    letterSpacing: 0,
  );
}
