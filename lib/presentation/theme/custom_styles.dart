import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:flutter/material.dart";

class CustomStyles {
  const new({required this._palette});

  final CustomPalette _palette;

  static const String _openSansFamily = "OpenSans";

  TextStyle get openSansRegular24_28 => const .new(
    fontFamily: _openSansFamily,
    fontWeight: .w400,
    fontSize: 24,
    height: 28 / 24,
    letterSpacing: 0,
  );

  TextStyle get openSansRegular18_24 => const .new(
    fontFamily: _openSansFamily,
    fontWeight: .w400,
    fontSize: 18,
    height: 24 / 18,
    letterSpacing: 0,
  );

  TextStyle get openSansRegular14_18 => const .new(
    fontFamily: _openSansFamily,
    fontWeight: .w400,
    fontSize: 14,
    height: 18 / 14,
    letterSpacing: 0,
  );

  ThemeData themeFromBrightness(Brightness brightness) => .new(
    brightness: brightness,
    extensions: <ThemeExtension<dynamic>>[_palette],
    inputDecorationTheme: InputDecorationThemeData(
      labelStyle: openSansRegular18_24.copyWith(
        color: _palette.contrastSecondary,
      ),
      contentPadding: const .only(left: 16, top: 4, bottom: 4, right: 4),
      focusedBorder: _outlineInputBorder(_palette.contrastSecondary),
      enabledBorder: _outlineInputBorder(_palette.border),
    ),
    textSelectionTheme: .new(cursorColor: _palette.contrast),
  );

  InputBorder _outlineInputBorder(Color color) => OutlineInputBorder(
    borderSide: .new(color: color, width: 2),
    borderRadius: const .all(.circular(8)),
  );
}
