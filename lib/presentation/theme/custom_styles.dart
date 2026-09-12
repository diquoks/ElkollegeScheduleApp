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
      focusedBorder: outlineInputBorder(color: _palette.contrastSecondary),
      disabledBorder: outlineInputBorder(),
      enabledBorder: outlineInputBorder(),
    ),
    progressIndicatorTheme: progressIndicatorThemeData,
    dropdownMenuTheme: .new(
      menuStyle: .new(
        backgroundColor: .all(_palette.background),
        elevation: .all(0),
        padding: .all(.zero),
        maximumSize: .all(.infinite),
        shape: .all(roundedRectangleBorder()),
        visualDensity: .compact,
      ),
    ),
    textSelectionTheme: .new(
      cursorColor: _palette.contrast,
      selectionColor: _palette.contrastSecondary.withAlpha(0x7F),
      selectionHandleColor: _palette.contrast,
    ),
  );

  OutlineInputBorder outlineInputBorder({Color? color, double? strokeAlign}) =>
      .new(
        borderSide: borderSide.copyWith(color: color, strokeAlign: strokeAlign),
        borderRadius: borderRadius,
      );

  RoundedRectangleBorder roundedRectangleBorder({
    Color? color,
    double? strokeAlign,
  }) => .new(
    side: borderSide.copyWith(color: color, strokeAlign: strokeAlign),
    borderRadius: borderRadius,
  );

  Border border({Color? color, double? strokeAlign}) => .fromBorderSide(
    borderSide.copyWith(color: color, strokeAlign: strokeAlign),
  );

  BorderSide get borderSide => .new(color: _palette.border, width: 2);

  BorderRadius get borderRadius => const .all(.circular(8));

  ProgressIndicatorThemeData get progressIndicatorThemeData => .new(
    color: _palette.contrastSecondary,
    refreshBackgroundColor: _palette.background,
    strokeWidth: 4,
  );
}
