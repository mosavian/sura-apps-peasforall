import 'package:flutter/material.dart';

import '../assets.dart';
import '../constants.dart';
import '../ming_cute_font.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog(this.child, {super.key, this.closeTap});
  final Widget child;
  final VoidCallback? closeTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.sizeOf(context).height;

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 270,
            padding: EdgeInsets.symmetric(
              horizontal: Constants.defaultPadding,
              vertical: 6,
            ),
            constraints: BoxConstraints(
              minHeight: 200,
              maxHeight: screenHeight * 0.8,
            ),
            decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(Constants.borderRadius),
            ),
            child: Material(color: Colors.transparent, child: child),
          ),
          Positioned(
            top: 0,
            width: 270,
            child: IgnorePointer(
              child: Image.asset(
                Assets.dialogTopDetailIMG,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Positioned(
            left: 0,
            height: 150,
            child: IgnorePointer(
              child: Image.asset(
                Assets.dialogLeftDetailIMG,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Positioned(
            right: 0,
            height: 150,
            child: IgnorePointer(
              child: Image.asset(
                Assets.dialogRightDetailIMG,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),

          if (closeTap != null)
            Positioned(
              left: 0,
              top: 0,
              child: IconButton(
                onPressed: closeTap,
                icon: Icon(
                  MingCute.close_circle_fill,
                  color: Colors.red.shade400,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
