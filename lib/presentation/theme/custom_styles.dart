import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:material_ui/material_ui.dart";

class const CustomStyles({required final CustomPalette _palette}) {
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

  WidgetStateProperty<Color> get _datePickerThemeForegroundColor =>
      .resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return _palette.background;
        }

        if (states.contains(WidgetState.disabled)) {
          return _palette.border;
        }

        return _palette.contrastSecondary;
      });

  WidgetStateProperty<Color> get _datePickerThemeBackgroundColor =>
      .resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return _palette.contrastSecondary;
        }

        return Colors.transparent;
      });

  ThemeData themeFromBrightness(Brightness brightness) => .new(
    extensions: <ThemeExtension<dynamic>>[_palette],
    brightness: brightness,
    scaffoldBackgroundColor: _palette.background,
    fontFamily: _openSansFamily,
    datePickerTheme: .new(
      backgroundColor: _palette.background,
      shape: shapeBorder(borderColor: _palette.border),
      dayForegroundColor: _datePickerThemeForegroundColor,
      dayBackgroundColor: _datePickerThemeBackgroundColor,
      todayForegroundColor: _datePickerThemeForegroundColor,
      todayBackgroundColor: _datePickerThemeBackgroundColor,
      yearForegroundColor: _datePickerThemeForegroundColor,
      yearBackgroundColor: _datePickerThemeBackgroundColor,
      todayBorder: borderSide(color: _palette.border),
      dividerColor: _palette.border,
      // TODO: use custom TextStyles
    ),
    dialogTheme: .new(
      backgroundColor: _palette.background,
      shape: shapeBorder(borderColor: _palette.border),
    ),
    progressIndicatorTheme: .new(
      color: _palette.contrastSecondary,
      refreshBackgroundColor: _palette.background,
      strokeWidth: 4,
    ),
    textSelectionTheme: .new(
      cursorColor: _palette.contrast,
      selectionColor: _palette.contrastSecondary.withAlpha(0x7F),
      selectionHandleColor: _palette.contrast,
    ),
  );

  InputDecoration inputDecoration({
    required String labelText,
    Widget? suffixIcon,
  }) => .new(
    label: Text(
      labelText,
      style: openSansRegular18_24.copyWith(color: _palette.contrastSecondary),
      overflow: .ellipsis,
      maxLines: 1,
    ),
    isDense: true,
    contentPadding: const .symmetric(vertical: 20, horizontal: 16),
    suffixIcon: suffixIcon,
    filled: true,
    fillColor: _palette.background,
    focusedBorder: inputBorder(borderColor: _palette.contrastSecondary),
    disabledBorder: inputBorder(borderColor: _palette.border),
    enabledBorder: inputBorder(borderColor: _palette.border),
  );

  OutlineInputBorder inputBorder({
    required Color borderColor,
    double strokeAlign = BorderSide.strokeAlignInside,
  }) => .new(
    borderSide: borderSide(color: borderColor, strokeAlign: strokeAlign),
    borderRadius: borderRadius,
  );

  RoundedRectangleBorder shapeBorder({
    required Color borderColor,
    double strokeAlign = BorderSide.strokeAlignInside,
  }) => .new(
    side: borderSide(color: borderColor, strokeAlign: strokeAlign),
    borderRadius: borderRadius,
  );

  Border boxBorder({
    required Color borderColor,
    double strokeAlign = BorderSide.strokeAlignInside,
  }) =>
      .fromBorderSide(borderSide(color: borderColor, strokeAlign: strokeAlign));

  BorderSide borderSide({
    required Color color,
    double strokeAlign = BorderSide.strokeAlignInside,
  }) => .new(color: color, width: 2, strokeAlign: strokeAlign);

  BorderRadius get borderRadius => const .all(.circular(8));
}
