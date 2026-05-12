import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_sizes.dart';
import '../core/widgets/custom_text_field.dart';
import '../core/widgets/primary_button.dart';
import '../core/widgets/skill_chip.dart';
import '../data/mock_data.dart';
import 'available_stays_screen.dart';

class SearchFilterScreen extends StatefulWidget {
  const SearchFilterScreen({super.key});

  @override
  State<SearchFilterScreen> createState() => _SearchFilterScreenState();
}

class _SearchFilterScreenState extends State<SearchFilterScreen> {
  final _locationController = TextEditingController();
  int _selectedSkillIndex = 0;

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }

  void _showResults() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AvailableStaysScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Search Stay + Skill'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSizes.spacing16),
          children: [
            CustomTextField(
              controller: _locationController,
              labelText: 'Location',
              hintText: 'Enter city or area',
              prefixIcon: Icons.location_on_outlined,
            ),
            const SizedBox(height: AppSizes.spacing16),
            const _PlaceholderRow(
              icon: Icons.calendar_month_outlined,
              label: 'Date',
              value: 'Choose travel dates',
            ),
            const SizedBox(height: AppSizes.spacing12),
            const _PlaceholderRow(
              icon: Icons.group_outlined,
              label: 'Guests',
              value: '1 guest',
            ),
            const SizedBox(height: AppSizes.spacing24),
            Text('Skill experience', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: AppSizes.spacing12),
            Wrap(
              spacing: AppSizes.spacing8,
              runSpacing: AppSizes.spacing8,
              children: List.generate(MockData.skills.length, (index) {
                final skill = MockData.skills[index];
                return SkillChip(
                  skill: skill,
                  selected: index == _selectedSkillIndex,
                  onSelected: (_) {
                    setState(() {
                      _selectedSkillIndex = index;
                    });
                  },
                );
              }),
            ),
            const SizedBox(height: AppSizes.spacing24),
            Container(
              padding: const EdgeInsets.all(AppSizes.spacing16),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(AppSizes.radius18),
                border: Border.all(color: AppColors.borderGrey),
              ),
              child: const Row(
                children: [
                  Icon(Icons.payments_outlined, color: AppColors.primary),
                  SizedBox(width: AppSizes.spacing12),
                  Expanded(
                    child: Text(
                      'Budget: flexible',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                  Text(
                    'Set range',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSizes.spacing32),
            PrimaryButton(text: 'Show Results', onPressed: _showResults),
          ],
        ),
      ),
    );
  }
}

class _PlaceholderRow extends StatelessWidget {
  const _PlaceholderRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.spacing16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppSizes.radius18),
        border: Border.all(color: AppColors.borderGrey),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary),
          const SizedBox(width: AppSizes.spacing12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(color: AppColors.greyText)),
                const SizedBox(height: AppSizes.spacing4),
                Text(
                  value,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: AppColors.greyText),
        ],
      ),
    );
  }
}
