import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_sizes.dart';
import '../core/widgets/bottom_nav_bar.dart';
import 'home_screen.dart';
import 'my_bookings_screen.dart';
import 'search_filter_screen.dart';
import 'welcome_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, this.showAppBar = true});

  final bool showAppBar;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _showPublicProfile = true;
  bool _allowHostMessages = true;
  bool _receiveUpdates = false;

  void _handleBottomNav(int index) {
    if (index == 3) return;

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

  void _openBookings() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyBookingsScreen()),
    );
  }

  void _logout() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      (route) => false,
    );
  }

  void _showComingSoon(String label) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$label coming soon')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showAppBar ? AppBar(title: const Text('Profile')) : null,
      bottomNavigationBar: BottomNavBar(
        currentIndex: 3,
        onTap: _handleBottomNav,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSizes.spacing16),
          children: [
            const SizedBox(height: AppSizes.spacing8),
            const CircleAvatar(
              radius: 46,
              backgroundColor: AppColors.primary,
              child: Text(
                'YM',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(height: AppSizes.spacing12),
            Text(
              'Yasir Moreno',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: AppSizes.spacing4),
            const Text(
              'yasir@example.com',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.greyText),
            ),
            const SizedBox(height: AppSizes.spacing24),
            Card(
              child: Column(
                children: [
                  _MenuRow(
                    icon: Icons.calendar_month_outlined,
                    title: 'My Bookings',
                    onTap: _openBookings,
                  ),
                  _MenuRow(
                    icon: Icons.favorite_border,
                    title: 'Saved Stays',
                    onTap: () => _showComingSoon('Saved Stays'),
                  ),
                  _MenuRow(
                    icon: Icons.credit_card,
                    title: 'Payment Methods',
                    onTap: () => _showComingSoon('Payment Methods'),
                  ),
                  _MenuRow(
                    icon: Icons.lock_outline,
                    title: 'Privacy Settings',
                    onTap: () => _showComingSoon('Privacy Settings'),
                  ),
                  _MenuRow(
                    icon: Icons.contact_emergency_outlined,
                    title: 'Emergency Contact',
                    onTap: () => _showComingSoon('Emergency Contact'),
                  ),
                  _MenuRow(
                    icon: Icons.help_outline,
                    title: 'Help & Feedback',
                    onTap: () => _showComingSoon('Help & Feedback'),
                  ),
                  _MenuRow(
                    icon: Icons.logout,
                    title: 'Log Out',
                    onTap: _logout,
                    isDestructive: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSizes.spacing24),
            Text(
              'Privacy Controls',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: AppSizes.spacing12),
            Card(
              child: Column(
                children: [
                  SwitchListTile(
                    value: _showPublicProfile,
                    onChanged: (value) {
                      setState(() => _showPublicProfile = value);
                    },
                    title: const Text('Show my public profile'),
                  ),
                  SwitchListTile(
                    value: _allowHostMessages,
                    onChanged: (value) {
                      setState(() => _allowHostMessages = value);
                    },
                    title: const Text('Allow host messages'),
                  ),
                  SwitchListTile(
                    value: _receiveUpdates,
                    onChanged: (value) {
                      setState(() => _receiveUpdates = value);
                    },
                    title: const Text('Receive app updates'),
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

class _MenuRow extends StatelessWidget {
  const _MenuRow({
    required this.icon,
    required this.title,
    required this.onTap,
    this.isDestructive = false,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isDestructive;

  @override
  Widget build(BuildContext context) {
    final color = isDestructive ? Colors.redAccent : AppColors.blackText;

    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: isDestructive ? Colors.redAccent : AppColors.primary),
      title: Text(
        title,
        style: TextStyle(color: color, fontWeight: FontWeight.w700),
      ),
      trailing: const Icon(Icons.chevron_right, color: AppColors.greyText),
    );
  }
}
