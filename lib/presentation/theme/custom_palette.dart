import "package:flutter/material.dart";

class CustomPalette {
  const new _({
    required this.background,
    required this.border,
    required this.contrast,
    required this.contrastSecondary,
  });

  const new light()
    : this._(
        background: const .new(0xFFEEEEEE),
        border: const .new(0xFFBFBFBF),
        contrast: const .new(0xFF111111),
        contrastSecondary: const .new(0xFF404040),
      );

  const new dark()
    : this._(
        background: const .new(0xFF111111),
        border: const .new(0xFF404040),
        contrast: const .new(0xFFEEEEEE),
        contrastSecondary: const .new(0xFFBFBFBF),
      );

  final Color background;
  final Color border;
  final Color contrast;
  final Color contrastSecondary;

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
}
