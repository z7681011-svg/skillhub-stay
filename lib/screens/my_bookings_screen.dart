import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_sizes.dart';
import '../core/widgets/bottom_nav_bar.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'search_filter_screen.dart';

class MyBookingsScreen extends StatelessWidget {
  const MyBookingsScreen({super.key, this.showAppBar = true});

  final bool showAppBar;

  void _handleBottomNav(BuildContext context, int index) {
    if (index == 2) return;

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
      appBar: showAppBar ? AppBar(title: const Text('My Bookings')) : null,
      bottomNavigationBar: BottomNavBar(
        currentIndex: 2,
        onTap: (index) => _handleBottomNav(context, index),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSizes.spacing16),
          children: const [
            Text(
              'Upcoming',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
            SizedBox(height: AppSizes.spacing12),
            _BookingCard(
              stayTitle: "Sarah's Creative Stay",
              dateText: '20 May 2026',
              selectedExperience: 'Stay + Photography Walk',
              status: 'Confirmed',
              statusColor: AppColors.successGreen,
            ),
            SizedBox(height: AppSizes.spacing24),
            Text(
              'Past',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
            SizedBox(height: AppSizes.spacing12),
            _BookingCard(
              stayTitle: 'Artisan Loft',
              dateText: '12 Mar 2026',
              selectedExperience: 'Stay + Creative Skill Session',
              status: 'Completed',
              statusColor: AppColors.greyText,
            ),
          ],
        ),
      ),
    );
  }
}

class _BookingCard extends StatelessWidget {
  const _BookingCard({
    required this.stayTitle,
    required this.dateText,
    required this.selectedExperience,
    required this.status,
    required this.statusColor,
  });

  final String stayTitle;
  final String dateText;
  final String selectedExperience;
  final String status;
  final Color statusColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.spacing16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 92,
              width: 92,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFD7F4EF), Color(0xFFFFF3D8)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(AppSizes.radius14),
              ),
              child: const Icon(
                Icons.home_work_outlined,
                color: AppColors.primary,
                size: 36,
              ),
            ),
            const SizedBox(width: AppSizes.spacing12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    stayTitle,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: AppSizes.spacing4),
                  Text(
                    dateText,
                    style: const TextStyle(color: AppColors.greyText),
                  ),
                  const SizedBox(height: AppSizes.spacing4),
                  Text(selectedExperience),
                  const SizedBox(height: AppSizes.spacing8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.spacing8,
                      vertical: AppSizes.spacing4,
                    ),
                    decoration: BoxDecoration(
                      color: statusColor.withAlpha(24),
                      borderRadius: BorderRadius.circular(AppSizes.radius24),
                    ),
                    child: Text(
                      status,
                      style: TextStyle(
                        color: statusColor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
