import 'package:flutter/material.dart';

class CustomLoadingState extends StatelessWidget {
  const CustomLoadingState({
    super.key,
    this.color,
    this.size = 25,
    this.strokeWidth = 3,
  });
  final Color? color;
  final double size;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: SizedBox(
        height: size,
        width: size,
        child: CircularProgressIndicator(
          color: color ?? theme.shadowColor,
          strokeWidth: strokeWidth,
        ),
      ),
    );
  }
}
