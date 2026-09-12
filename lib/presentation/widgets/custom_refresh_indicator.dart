import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:flutter/material.dart";

class CustomRefreshIndicator extends StatelessWidget {
  const new({super.key, required this._onRefresh, required this._child});

  final RefreshCallback _onRefresh;
  final Widget _child;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      color: context.styles.progressIndicatorThemeData.color,
      backgroundColor:
          context.styles.progressIndicatorThemeData.refreshBackgroundColor,
      strokeWidth:
          context.styles.progressIndicatorThemeData.strokeWidth! * 0.75,
      child: _child,
    );
  }
}
