import 'package:flutter/material.dart';

import '../../models/skill_model.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';

class SkillChip extends StatelessWidget {
  const SkillChip({
    super.key,
    required this.skill,
    this.selected = false,
    this.onSelected,
  });

  final SkillModel skill;
  final bool selected;
  final ValueChanged<bool>? onSelected;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSizes.radius24),
        onTap: onSelected == null ? null : () => onSelected!(!selected),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.spacing16,
            vertical: AppSizes.spacing8,
          ),
          decoration: BoxDecoration(
            color: selected ? AppColors.primary : AppColors.white,
            borderRadius: BorderRadius.circular(AppSizes.radius24),
            border: Border.all(
              color: selected ? AppColors.primary : const Color(0x1F0F766E),
            ),
            boxShadow: [
              if (selected)
                BoxShadow(
                  color: AppColors.primary.withAlpha(36),
                  blurRadius: 14,
                  offset: const Offset(0, 6),
                ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (selected) ...[
                const Icon(Icons.check, color: AppColors.white, size: 16),
                const SizedBox(width: AppSizes.spacing4),
              ],
              Text(
                skill.title,
                style: TextStyle(
                  color: selected ? AppColors.white : AppColors.blackText,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
