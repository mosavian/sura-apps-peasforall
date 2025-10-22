import 'package:flutter/material.dart';

import '../constants.dart';

class CustomErrorState extends StatelessWidget {
  const CustomErrorState({
    super.key,
    this.errorMsg = 'error',
    this.onTap,
    this.isPadding = true,
  });

  final String errorMsg;
  final VoidCallback? onTap;
  final bool isPadding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.all(isPadding ? Constants.paddingScreen : 0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(Constants.borderRadius),
        child: Container(
          constraints: BoxConstraints(minHeight: 30),
          padding: const EdgeInsets.symmetric(
            horizontal: Constants.defaultPadding,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.red.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(Constants.borderRadius),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  errorMsg,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.red,
                  ),
                ),
              ),
              const Icon(Icons.refresh, color: Colors.red),
            ],
          ),
        ),
      ),
    );
  }
}
