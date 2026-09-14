import "package:material_ui/material_ui.dart";

class CustomRefreshIndicator extends StatelessWidget {
  const new({super.key, required this._onRefresh, required this._child});

  final RefreshCallback _onRefresh;
  final Widget _child;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return RefreshIndicator(
      onRefresh: _onRefresh,
      color: theme.progressIndicatorTheme.color,
      backgroundColor: theme.progressIndicatorTheme.refreshBackgroundColor,
      strokeWidth: theme.progressIndicatorTheme.strokeWidth! * 0.75,
      child: _child,
    );
  }
}
