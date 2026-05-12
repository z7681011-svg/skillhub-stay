import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_sizes.dart';
import '../core/constants/app_strings.dart';
import '../core/utils/validators.dart';
import '../core/widgets/custom_text_field.dart';
import '../core/widgets/primary_button.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _acceptedTerms = false;
  bool _showTermsError = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _createAccount() {
    setState(() {
      _showTermsError = !_acceptedTerms;
    });
    if (!_formKey.currentState!.validate() || !_acceptedTerms) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  void _openLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const BackButton()),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(AppSizes.spacing24),
            children: [
              Text(
                AppStrings.createAccount,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: AppSizes.spacing8),
              const Text(
                'Join SkillHub Stay and book stays with local experiences.',
                style: TextStyle(color: AppColors.greyText),
              ),
              const SizedBox(height: AppSizes.spacing32),
              CustomTextField(
                controller: _nameController,
                labelText: 'Full name',
                hintText: 'Enter your full name',
                prefixIcon: Icons.person_outline,
                validator: (value) => Validators.requiredField(value, 'Name'),
              ),
              const SizedBox(height: AppSizes.spacing16),
              CustomTextField(
                controller: _emailController,
                labelText: 'Email',
                hintText: 'Enter your email',
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                validator: Validators.email,
              ),
              const SizedBox(height: AppSizes.spacing16),
              CustomTextField(
                controller: _passwordController,
                labelText: 'Password',
                hintText: 'Minimum 6 characters',
                prefixIcon: Icons.lock_outline,
                obscureText: true,
                validator: Validators.password,
              ),
              const SizedBox(height: AppSizes.spacing16),
              CustomTextField(
                controller: _confirmPasswordController,
                labelText: 'Confirm password',
                hintText: 'Re-enter your password',
                prefixIcon: Icons.lock_outline,
                obscureText: true,
                validator: (value) => Validators.confirmPassword(
                  value,
                  _passwordController.text,
                ),
              ),
              const SizedBox(height: AppSizes.spacing16),
              CheckboxListTile(
                value: _acceptedTerms,
                onChanged: (value) {
                  setState(() {
                    _acceptedTerms = value ?? false;
                    _showTermsError = false;
                  });
                },
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text(
                  'I agree to the SkillHub Stay terms and privacy policy.',
                ),
              ),
              if (_showTermsError)
                const Padding(
                  padding: EdgeInsets.only(left: AppSizes.spacing12),
                  child: Text(
                    'Please accept the terms to continue',
                    style: TextStyle(color: Colors.redAccent, fontSize: 12),
                  ),
                ),
              const SizedBox(height: AppSizes.spacing20),
              PrimaryButton(
                text: AppStrings.createAccount,
                onPressed: _createAccount,
              ),
              const SizedBox(height: AppSizes.spacing16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  TextButton(
                    onPressed: _openLogin,
                    child: const Text('Sign In'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
