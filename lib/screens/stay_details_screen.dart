import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_sizes.dart';
import '../core/constants/app_strings.dart';
import '../core/widgets/primary_button.dart';
import '../models/stay_model.dart';
import 'choose_stay_option_screen.dart';

class StayDetailsScreen extends StatelessWidget {
  const StayDetailsScreen({super.key, required this.stay});

  final StayModel stay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Stay Details'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(
            AppSizes.spacing16,
            AppSizes.spacing16,
            AppSizes.spacing16,
            AppSizes.spacing32,
          ),
          children: [
            Container(
              height: 260,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFD7F4EF), Color(0xFFFFF3D8)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(AppSizes.radius24),
              ),
              child: const Icon(
                Icons.home_work_outlined,
                color: AppColors.primary,
                size: 92,
              ),
            ),
            const SizedBox(height: AppSizes.spacing24),
            Text(stay.title, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: AppSizes.spacing8),
            Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: AppColors.greyText,
                  size: 20,
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
            const SizedBox(height: AppSizes.spacing8),
            Text(
              'Hosted by ${stay.hostName}',
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: AppSizes.spacing16),
            Row(
              children: [
                const Icon(Icons.star, color: AppColors.warningOrange, size: 20),
                const SizedBox(width: AppSizes.spacing4),
                Text(
                  stay.rating.toStringAsFixed(1),
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
                const Spacer(),
                Text(
                  '\$${stay.pricePerNight.toStringAsFixed(0)} / night',
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.spacing20),
            Container(
              padding: const EdgeInsets.all(AppSizes.spacing16),
              decoration: BoxDecoration(
                color: AppColors.primary.withAlpha(18),
                borderRadius: BorderRadius.circular(AppSizes.radius18),
                border: Border.all(color: AppColors.primary.withAlpha(55)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.school_outlined, color: AppColors.primary),
                  const SizedBox(width: AppSizes.spacing12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Skill experience',
                          style: TextStyle(color: AppColors.greyText),
                        ),
                        const SizedBox(height: AppSizes.spacing4),
                        Text(
                          stay.skillName,
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSizes.spacing20),
            Text('About this stay', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: AppSizes.spacing8),
            Text(stay.description),
            const SizedBox(height: AppSizes.spacing20),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(AppSizes.spacing16),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.primary,
                      child: Icon(Icons.person, color: AppColors.white),
                    ),
                    SizedBox(width: AppSizes.spacing12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Lovely host and a memorable local experience.',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: AppSizes.spacing4),
                          Text(
                            'A recent guest',
                            style: TextStyle(color: AppColors.greyText),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSizes.spacing24),
            PrimaryButton(
              text: AppStrings.bookThisStay,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChooseStayOptionScreen(stay: stay),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
