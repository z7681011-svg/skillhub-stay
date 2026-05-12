import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_sizes.dart';
import '../core/constants/app_strings.dart';
import '../core/widgets/booking_info_row.dart';
import '../core/widgets/primary_button.dart';
import '../models/stay_model.dart';
import 'payment_screen.dart';

class BookingSummaryScreen extends StatelessWidget {
  const BookingSummaryScreen({
    super.key,
    required this.stay,
    required this.selectedOption,
  });

  final StayModel stay;
  final String selectedOption;

  double get _skillSessionPrice => selectedOption == 'Stay Only' ? 0 : 28;
  double get _serviceFee => 9;
  double get _total => stay.pricePerNight + _skillSessionPrice + _serviceFee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Booking Summary'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSizes.spacing16),
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.spacing16),
                child: Column(
                  children: [
                    BookingInfoRow(
                      icon: Icons.home_work_outlined,
                      label: 'Stay',
                      value: stay.title,
                    ),
                    BookingInfoRow(
                      icon: Icons.location_on_outlined,
                      label: 'Location',
                      value: stay.location,
                    ),
                    BookingInfoRow(
                      icon: Icons.school_outlined,
                      label: 'Option',
                      value: selectedOption,
                    ),
                    const BookingInfoRow(
                      icon: Icons.calendar_month_outlined,
                      label: 'Dates',
                      value: '20 May 2026',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSizes.spacing20),
            Text('Price breakdown', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: AppSizes.spacing12),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.spacing16),
                child: Column(
                  children: [
                    BookingInfoRow(
                      icon: Icons.bed_outlined,
                      label: 'Accommodation',
                      value: '\$${stay.pricePerNight.toStringAsFixed(0)}',
                    ),
                    BookingInfoRow(
                      icon: Icons.lightbulb_outline,
                      label: 'Skill session',
                      value: '\$${_skillSessionPrice.toStringAsFixed(0)}',
                    ),
                    BookingInfoRow(
                      icon: Icons.receipt_long_outlined,
                      label: 'Service fee',
                      value: '\$${_serviceFee.toStringAsFixed(0)}',
                    ),
                    const Divider(height: AppSizes.spacing24),
                    BookingInfoRow(
                      icon: Icons.payments_outlined,
                      label: 'Total',
                      value: '\$${_total.toStringAsFixed(0)}',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSizes.spacing12),
            const Text(
              'You can review all details again before confirming payment.',
              style: TextStyle(color: AppColors.greyText),
            ),
            const SizedBox(height: AppSizes.spacing32),
            PrimaryButton(
              text: AppStrings.proceedToPayment,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentScreen(
                      stay: stay,
                      selectedOption: selectedOption,
                      total: _total,
                    ),
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
