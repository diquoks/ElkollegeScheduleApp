import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:flutter/material.dart";

class CustomPalette extends ThemeExtension<CustomPalette> {
  const new _({
    required this.background,
    required this.border,
    required this.contrast,
    required this.contrastSecondary,
  });

  const new _light()
    : this._(
        background: const .new(0xFFEEEEEE),
        border: const .new(0xFFBFBFBF),
        contrast: const .new(0xFF111111),
        contrastSecondary: const .new(0xFF404040),
      );

  const new _dark()
    : this._(
        background: const .new(0xFF111111),
        border: const .new(0xFF404040),
        contrast: const .new(0xFFEEEEEE),
        contrastSecondary: const .new(0xFFBFBFBF),
      );

  factory _fromBrightness(Brightness brightness) => switch (brightness) {
    .light => const ._light(),
    .dark => const ._dark(),
  };

  final Color background;
  final Color border;
  final Color contrast;
  final Color contrastSecondary;

  @override
  CustomPalette copyWith() => throw UnimplementedError();

  @override
  CustomPalette lerp(covariant CustomPalette? other, double t) {
    if (other == null) {
      return this;
    }

    return ._(
      background: .lerp(background, other.background, t)!,
      border: .lerp(border, other.border, t)!,
      contrast: .lerp(contrast, other.contrast, t)!,
      contrastSecondary: .lerp(contrastSecondary, other.contrastSecondary, t)!,
    );
  }

  CustomStyles get _styles => .new(palette: this);

  static ThemeData themeFromBrightness(Brightness brightness) =>
      CustomPalette._fromBrightness(brightness)._styles
          .themeFromBrightness(brightness);
}

extension BuildContextCustomThemeX on BuildContext {
  CustomPalette get palette => Theme.of(this).extension<CustomPalette>()!;

  CustomStyles get styles => palette._styles;
}
