import 'package:flutter/material.dart';

import '../assets.dart';
import '../constants.dart';

class StarButton extends StatelessWidget {
  const StarButton(
    this.icon, {
    required this.onTap,
    this.size = 46,
    this.isLoading = false,
    super.key,
  });
  final VoidCallback onTap;
  final IconData icon;
  final bool isLoading;
  final double size;

  @override
  Widget build(BuildContext context) {
    final color = Colors.white;

    return InkWell(
      onTap: isLoading ? null : onTap,
      borderRadius: BorderRadius.circular(30),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(Assets.starIMG, width: size, height: size),
          AnimatedSwitcher(
            duration: Constants.animationDuration,
            child: isLoading
                ? SizedBox(
                    width: size * 0.4,
                    height: size * 0.4,
                    child: CircularProgressIndicator(
                      color: color,
                      strokeWidth: 2.5,
                    ),
                  )
                : Icon(icon, size: size * 0.6, color: color),
          ),
        ],
      ),
    );
  }
}
