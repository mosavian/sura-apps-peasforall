import 'package:flutter/material.dart';

import '../constants.dart';
import 'responsive.dart';

class CustomSnackBar {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? _controller;

  static void success(BuildContext context, {String message = "success"}) {
    _show(
      context,
      message: message,
      icon: Icons.check_circle,
      // textColor: Color(0xff3EE08A),
    );
  }

  static void error(BuildContext context, {String message = "error"}) {
    _show(
      context,
      message: message,
      icon: Icons.error,
      color: Colors.red.shade600,
      textColor: Colors.white,
    );
  }

  static void warning(
    BuildContext context, {
    String message = "Warning",
    bool longTime = false,
  }) {
    _show(
      context,
      message: message,
      icon: Icons.warning_rounded,
      color: Colors.amber.shade600,
      textColor: Colors.black,
      longTime: longTime,
    );
  }

  static void close() {
    _controller?.close();
    _controller = null;
  }

  static void _show(
    BuildContext context, {
    required String message,
    required IconData icon,
    Color? color,
    Color? textColor,
    bool longTime = false,
  }) {
    final scaffold = ScaffoldMessenger.of(context);
    final theme = Theme.of(context);

    if (Responsive.isMobile(context)) {
      _controller = scaffold.showSnackBar(
        SnackBar(
          duration: longTime ? Duration(days: 1) : Duration(seconds: 3),
          backgroundColor: Colors.transparent,
          elevation: 0,
          behavior: longTime ? SnackBarBehavior.fixed : null,
          dismissDirection: longTime ? DismissDirection.none : null,
          padding: const EdgeInsets.all(Constants.paddingScreen),
          content: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: Constants.defaultPadding,
              vertical: Constants.defaultPadding * 0.8,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Constants.borderRadius),
              color: color ?? theme.hoverColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  blurRadius: 15,
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(icon, color: textColor ?? theme.shadowColor, size: 27),
                const SizedBox(width: Constants.defaultPadding),
                Expanded(
                  child: Text(
                    message,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: textColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      _controller = scaffold.showSnackBar(
        SnackBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          dismissDirection: DismissDirection.horizontal,
          padding: const EdgeInsets.all(Constants.paddingScreen),
          content: Row(
            children: [
              Expanded(
                flex: Responsive.isTablet(context) ? 3 : 2,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Constants.defaultPadding,
                    vertical: Constants.defaultPadding * 0.8,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Constants.borderRadius),
                    color: color ?? theme.hoverColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.3),
                        blurRadius: 15,
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        icon,
                        color: textColor ?? theme.shadowColor,
                        size: 27,
                      ),
                      const SizedBox(width: Constants.defaultPadding),
                      Expanded(
                        child: Text(
                          message,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(flex: 3, child: SizedBox()),
            ],
          ),
        ),
      );
    }
    _controller?.closed.then((value) {
      _controller = null;
    });
  }
}
