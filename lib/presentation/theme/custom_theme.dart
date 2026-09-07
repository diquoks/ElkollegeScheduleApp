import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:flutter/material.dart";

class CustomTheme extends ThemeExtension<CustomTheme> {
  const new({required this.palette});

  final CustomPalette palette;

  @override
  CustomTheme copyWith({CustomPalette? palette}) =>
      .new(palette: palette ?? this.palette);

  @override
  CustomTheme lerp(covariant CustomTheme? other, double t) =>
      .new(palette: palette.lerp(other?.palette, t));

  static CustomTheme of(BuildContext context) =>
      Theme.of(context).extension<CustomTheme>()!;
}

extension BuildContextCustomThemeX on BuildContext {
  CustomTheme get customTheme => CustomTheme.of(this);
}
