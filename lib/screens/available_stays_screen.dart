import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_sizes.dart';
import '../core/widgets/bottom_nav_bar.dart';
import '../core/widgets/stay_card.dart';
import '../data/mock_data.dart';
import 'home_screen.dart';
import 'my_bookings_screen.dart';
import 'profile_screen.dart';
import 'search_filter_screen.dart';
import 'stay_details_screen.dart';

class AvailableStaysScreen extends StatelessWidget {
  const AvailableStaysScreen({super.key});

  void _handleBottomNav(BuildContext context, int index) {
    if (index == 1) return;

    final screens = <Widget>[
      const HomeScreen(),
      const SearchFilterScreen(),
      const MyBookingsScreen(),
      const ProfileScreen(),
    ];

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => screens[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Available Stays')),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1,
        onTap: (index) => _handleBottomNav(context, index),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSizes.spacing16),
          children: [
            Container(
              padding: const EdgeInsets.all(AppSizes.spacing16),
              decoration: BoxDecoration(
                color: AppColors.primary.withAlpha(18),
                borderRadius: BorderRadius.circular(AppSizes.radius18),
                border: Border.all(color: AppColors.primary.withAlpha(60)),
              ),
              child: const Row(
                children: [
                  Icon(Icons.tune, color: AppColors.primary),
                  SizedBox(width: AppSizes.spacing12),
                  Expanded(
                    child: Text(
                      'Showing stays for flexible dates, 1 guest, all budgets.',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSizes.spacing16),
            ...MockData.stays.map(
              (stay) => StayCard(
                stay: stay,
                buttonText: 'View Details',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StayDetailsScreen(stay: stay),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
