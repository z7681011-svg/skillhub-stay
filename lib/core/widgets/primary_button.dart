import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
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
    final style = ElevatedButton.styleFrom(
      minimumSize: const Size.fromHeight(AppSizes.buttonHeight),
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.spacing20),
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radius18),
      ),
      textStyle: const TextStyle(fontWeight: FontWeight.w800),
    );

    if (icon == null) {
      return ElevatedButton(
        onPressed: onPressed,
        style: style,
        child: Text(text),
      );
    }

    return ElevatedButton.icon(
      onPressed: onPressed,
      style: style,
      icon: Icon(icon),
      label: Text(text),
    );
  }
}
