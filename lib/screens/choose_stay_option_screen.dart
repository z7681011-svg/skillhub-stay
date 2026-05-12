import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_sizes.dart';
import '../core/constants/app_strings.dart';
import '../core/widgets/primary_button.dart';
import '../models/stay_model.dart';
import 'booking_summary_screen.dart';

class ChooseStayOptionScreen extends StatefulWidget {
  const ChooseStayOptionScreen({super.key, required this.stay});

  final StayModel stay;

  @override
  State<ChooseStayOptionScreen> createState() => _ChooseStayOptionScreenState();
}

class _ChooseStayOptionScreenState extends State<ChooseStayOptionScreen> {
  String _selectedOption = 'Stay Only';

  final List<String> _options = const [
    'Stay Only',
    'Stay + Photography Walk',
    'Stay + Creative Skill Session',
  ];

  void _continue() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookingSummaryScreen(
          stay: widget.stay,
          selectedOption: _selectedOption,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Choose Your Stay Option'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSizes.spacing16),
          children: [
            Text(widget.stay.title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: AppSizes.spacing16),
            ..._options.map(
              (option) => _OptionCard(
                title: option,
                selected: option == _selectedOption,
                onTap: () {
                  setState(() {
                    _selectedOption = option;
                  });
                },
              ),
            ),
            const SizedBox(height: AppSizes.spacing20),
            const _PlaceholderSelection(
              icon: Icons.calendar_month_outlined,
              title: 'Date',
              value: '20 May 2026',
            ),
            const SizedBox(height: AppSizes.spacing12),
            const _PlaceholderSelection(
              icon: Icons.schedule_outlined,
              title: 'Session time',
              value: '10:00 AM',
            ),
            const SizedBox(height: AppSizes.spacing32),
            PrimaryButton(
              text: AppStrings.continueToBooking,
              onPressed: _continue,
            ),
          ],
        ),
      ),
    );
  }
}

class _OptionCard extends StatelessWidget {
  const _OptionCard({
    required this.title,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: selected ? AppColors.primary.withAlpha(18) : AppColors.cardBackground,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSizes.radius18),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.spacing16),
          child: Row(
            children: [
              Icon(
                selected
                    ? Icons.radio_button_checked
                    : Icons.radio_button_unchecked,
                color: selected ? AppColors.primary : AppColors.greyText,
              ),
              const SizedBox(width: AppSizes.spacing12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: AppSizes.spacing4),
                    Text(
                      title == 'Stay Only'
                          ? 'Accommodation without a skill add-on.'
                          : 'Includes accommodation and a guided local experience.',
                      style: const TextStyle(color: AppColors.greyText),
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

class _PlaceholderSelection extends StatelessWidget {
  const _PlaceholderSelection({
    required this.icon,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final String title;
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
                Text(title, style: const TextStyle(color: AppColors.greyText)),
                const SizedBox(height: AppSizes.spacing4),
                Text(value, style: const TextStyle(fontWeight: FontWeight.w800)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: AppColors.greyText),
        ],
      ),
    );
  }
}
