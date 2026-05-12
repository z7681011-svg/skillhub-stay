import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
  });

  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final style = OutlinedButton.styleFrom(
      minimumSize: const Size.fromHeight(AppSizes.buttonHeight),
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.spacing20),
      foregroundColor: AppColors.primary,
      side: const BorderSide(color: AppColors.primary, width: 1.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radius18),
      ),
      textStyle: const TextStyle(fontWeight: FontWeight.w800),
    );

    if (icon == null) {
      return OutlinedButton(
        onPressed: onPressed,
        style: style,
        child: Text(text),
      );
    }

    return OutlinedButton.icon(
      onPressed: onPressed,
      style: style,
      icon: Icon(icon),
      label: Text(text),
    );
  }
}
