import 'package:flutter/material.dart';

import '../../models/stay_model.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';

class StayCard extends StatelessWidget {
  const StayCard({
    super.key,
    required this.stay,
    required this.onTap,
    this.buttonText,
  });

  final StayModel stay;
  final VoidCallback onTap;
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSizes.radius24),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.spacing12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.tealLight, AppColors.cream],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(AppSizes.radius18),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: -22,
                      top: -22,
                      child: Container(
                        height: 92,
                        width: 92,
                        decoration: BoxDecoration(
                          color: AppColors.white.withAlpha(100),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    const Center(
                      child: Icon(
                        Icons.home_work_outlined,
                        color: AppColors.primary,
                        size: 58,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSizes.spacing4,
                  AppSizes.spacing12,
                  AppSizes.spacing4,
                  AppSizes.spacing4,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      stay.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w900,
                          ),
                    ),
                    const SizedBox(height: AppSizes.spacing4),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: AppColors.greyText,
                          size: 17,
                        ),
                        const SizedBox(width: AppSizes.spacing4),
                        Expanded(
                          child: Text(
                            stay.location,
                            style: const TextStyle(color: AppColors.greyText),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSizes.spacing12),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSizes.spacing12,
                            vertical: AppSizes.spacing8,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withAlpha(20),
                            borderRadius:
                                BorderRadius.circular(AppSizes.radius24),
                          ),
                          child: Text(
                            stay.skillName,
                            style: const TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.star,
                          color: AppColors.warningOrange,
                          size: 18,
                        ),
                        const SizedBox(width: AppSizes.spacing4),
                        Text(
                          stay.rating.toStringAsFixed(1),
                          style: const TextStyle(fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSizes.spacing12),
                    Row(
                      children: [
                        Text(
                          '\$${stay.pricePerNight.toStringAsFixed(0)} / night',
                          style: const TextStyle(
                            color: AppColors.blackText,
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const Spacer(),
                        if (buttonText != null)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSizes.spacing12,
                              vertical: AppSizes.spacing8,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius:
                                  BorderRadius.circular(AppSizes.radius24),
                            ),
                            child: Text(
                              buttonText!,
                              style: const TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          )
                        else
                          Container(
                            height: 34,
                            width: 34,
                            decoration: BoxDecoration(
                              color: AppColors.tealPale,
                              borderRadius:
                                  BorderRadius.circular(AppSizes.radius10),
                            ),
                            child: const Icon(
                              Icons.chevron_right,
                              color: AppColors.primary,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
