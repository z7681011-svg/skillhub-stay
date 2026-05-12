import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_sizes.dart';
import '../core/widgets/bottom_nav_bar.dart';
import '../core/widgets/skill_chip.dart';
import '../core/widgets/stay_card.dart';
import '../data/mock_data.dart';
import 'my_bookings_screen.dart';
import 'profile_screen.dart';
import 'search_filter_screen.dart';
import 'stay_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedSkillIndex = 0;

  void _handleBottomNav(int index) {
    if (index == 0) return;

    final screens = <Widget>[
      const HomeScreen(),
      const SearchFilterScreen(),
      const MyBookingsScreen(),
      const ProfileScreen(),
    ];

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screens[index]),
    );
  }

  void _openSearch() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SearchFilterScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        currentIndex: 0,
        onTap: _handleBottomNav,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSizes.spacing16),
          children: [
            const SizedBox(height: AppSizes.spacing8),
            Text(
              'Hi Yasir',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: AppSizes.spacing8),
            const Text(
              'Where would you like to stay and learn today?',
              style: TextStyle(color: AppColors.greyText),
            ),
            const SizedBox(height: AppSizes.spacing24),
            InkWell(
              borderRadius: BorderRadius.circular(AppSizes.radius24),
              onTap: _openSearch,
              child: Container(
                padding: const EdgeInsets.all(AppSizes.spacing16),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(AppSizes.radius24),
                  border: Border.all(color: const Color(0x140F766E)),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withAlpha(18),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: const Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColors.tealPale,
                      child: Icon(Icons.search, color: AppColors.primary),
                    ),
                    SizedBox(width: AppSizes.spacing12),
                    Expanded(
                      child: Text(
                        'Search location, date, guest, or skill',
                        style: TextStyle(
                          color: AppColors.greyText,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColors.primary,
                      child: Icon(Icons.tune, color: AppColors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSizes.spacing24),
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
            Text(
              'Recommended stays',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: AppSizes.spacing12),
            ...MockData.stays.map(
              (stay) => StayCard(
                stay: stay,
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
