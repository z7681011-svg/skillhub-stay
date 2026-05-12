import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_sizes.dart';
import '../core/widgets/booking_info_row.dart';
import '../core/widgets/primary_button.dart';
import '../core/widgets/secondary_button.dart';
import '../models/stay_model.dart';
import 'home_screen.dart';
import 'my_bookings_screen.dart';

class BookingConfirmedScreen extends StatelessWidget {
  const BookingConfirmedScreen({
    super.key,
    required this.stay,
    required this.selectedOption,
    required this.total,
  });

  final StayModel stay;
  final String selectedOption;
  final double total;

  static const String _bookingId = 'SHS-2048';
  static const String _dateText = '20 May 2026';

  void _backHome(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
      (route) => false,
    );
  }

  void _viewBooking(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyBookingsScreen()),
    );
  }

  void _messageHost(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Messaging feature coming soon')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSizes.spacing24),
          children: [
            const SizedBox(height: AppSizes.spacing24),
            const Icon(
              Icons.check_circle,
              size: 112,
              color: AppColors.successGreen,
            ),
            const SizedBox(height: AppSizes.spacing20),
            Text(
              'Booking Confirmed!',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: AppSizes.spacing8),
            const Text(
              'Your stay and skill experience are booked. We sent the details to your account.',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.greyText, height: 1.5),
            ),
            const SizedBox(height: AppSizes.spacing24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.spacing16),
                child: Column(
                  children: [
                    const BookingInfoRow(
                      icon: Icons.confirmation_number_outlined,
                      label: 'Booking ID',
                      value: _bookingId,
                    ),
                    BookingInfoRow(
                      icon: Icons.home_work_outlined,
                      label: 'Stay',
                      value: stay.title,
                    ),
                    BookingInfoRow(
                      icon: Icons.school_outlined,
                      label: 'Option',
                      value: selectedOption,
                    ),
                    const BookingInfoRow(
                      icon: Icons.calendar_month_outlined,
                      label: 'Date',
                      value: _dateText,
                    ),
                    BookingInfoRow(
                      icon: Icons.payments_outlined,
                      label: 'Total paid',
                      value: '\$${total.toStringAsFixed(0)}',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSizes.spacing24),
            PrimaryButton(
              text: 'Back to Home',
              onPressed: () => _backHome(context),
            ),
            const SizedBox(height: AppSizes.spacing12),
            SecondaryButton(
              text: 'View Booking',
              onPressed: () => _viewBooking(context),
            ),
            const SizedBox(height: AppSizes.spacing8),
            TextButton(
              onPressed: () => _messageHost(context),
              child: const Text('Message Host'),
            ),
          ],
        ),
      ),
    );
  }
}
