import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_sizes.dart';
import '../core/constants/app_strings.dart';
import '../core/widgets/primary_button.dart';
import '../core/widgets/secondary_button.dart';
import 'home_screen.dart';
import 'login_screen.dart';
import 'signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void _open(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSizes.spacing24),
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.tealLight, AppColors.cream],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(AppSizes.radius24),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withAlpha(24),
                    blurRadius: 24,
                    offset: const Offset(0, 14),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: -36,
                    top: -30,
                    child: Container(
                      height: 140,
                      width: 140,
                      decoration: BoxDecoration(
                        color: AppColors.white.withAlpha(105),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  const Center(
                    child: Icon(
                      Icons.travel_explore,
                      color: AppColors.primary,
                      size: 86,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSizes.spacing32),
            Text(
              AppStrings.subtitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: AppSizes.spacing12),
            const Text(
              'Book friendly stays hosted by locals and learn something memorable during your trip.',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.greyText, height: 1.5),
            ),
            const SizedBox(height: AppSizes.spacing32),
            PrimaryButton(
              text: 'Login',
              onPressed: () => _open(context, const LoginScreen()),
            ),
            const SizedBox(height: AppSizes.spacing12),
            SecondaryButton(
              text: AppStrings.createAccount,
              onPressed: () => _open(context, const SignupScreen()),
            ),
            const SizedBox(height: AppSizes.spacing8),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              child: const Text('Continue as Guest'),
            ),
          ],
        ),
      ),
    );
  }
}
