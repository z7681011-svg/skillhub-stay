import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_sizes.dart';
import '../core/constants/app_strings.dart';
import '../core/utils/validators.dart';
import '../core/widgets/custom_text_field.dart';
import '../core/widgets/primary_button.dart';
import '../models/stay_model.dart';
import 'booking_confirmed_screen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({
    super.key,
    required this.stay,
    required this.selectedOption,
    required this.total,
  });

  final StayModel stay;
  final String selectedOption;
  final double total;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _cardholderController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _expiryController = TextEditingController();
  final _cvvController = TextEditingController();
  String _paymentMethod = 'card';

  @override
  void dispose() {
    _cardholderController.dispose();
    _cardNumberController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  void _confirmPayment() {
    if (!_formKey.currentState!.validate()) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => BookingConfirmedScreen(
          stay: widget.stay,
          selectedOption: widget.selectedOption,
          total: widget.total,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Payment'),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(AppSizes.spacing16),
            children: [
              Text('Payment method', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: AppSizes.spacing12),
              _PaymentMethodTile(
                title: 'Credit / Debit Card',
                subtitle: 'Selected by default',
                icon: Icons.credit_card,
                selected: _paymentMethod == 'card',
                onTap: () => setState(() => _paymentMethod = 'card'),
              ),
              _PaymentMethodTile(
                title: 'Apple Pay',
                subtitle: 'Placeholder option',
                icon: Icons.phone_iphone,
                selected: _paymentMethod == 'apple',
                onTap: () => setState(() => _paymentMethod = 'apple'),
              ),
              _PaymentMethodTile(
                title: 'PayPal',
                subtitle: 'Placeholder option',
                icon: Icons.account_balance_wallet_outlined,
                selected: _paymentMethod == 'paypal',
                onTap: () => setState(() => _paymentMethod = 'paypal'),
              ),
              const SizedBox(height: AppSizes.spacing20),
              CustomTextField(
                controller: _cardholderController,
                labelText: 'Cardholder name',
                hintText: 'Enter name on card',
                prefixIcon: Icons.person_outline,
                validator: (value) => Validators.requiredField(
                  value,
                  'Cardholder name',
                ),
              ),
              const SizedBox(height: AppSizes.spacing16),
              CustomTextField(
                controller: _cardNumberController,
                labelText: 'Card number',
                hintText: '1234 5678 9012 3456',
                prefixIcon: Icons.credit_card,
                keyboardType: TextInputType.number,
                validator: Validators.cardNumber,
              ),
              const SizedBox(height: AppSizes.spacing16),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: _expiryController,
                      labelText: 'Expiry',
                      hintText: 'MM/YY',
                      prefixIcon: Icons.date_range_outlined,
                      keyboardType: TextInputType.datetime,
                      validator: (value) =>
                          Validators.requiredField(value, 'Expiry'),
                    ),
                  ),
                  const SizedBox(width: AppSizes.spacing12),
                  Expanded(
                    child: CustomTextField(
                      controller: _cvvController,
                      labelText: 'CVV',
                      hintText: '123',
                      prefixIcon: Icons.lock_outline,
                      keyboardType: TextInputType.number,
                      validator: Validators.cvv,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.spacing24),
              Container(
                padding: const EdgeInsets.all(AppSizes.spacing16),
                decoration: BoxDecoration(
                  color: AppColors.primary.withAlpha(18),
                  borderRadius: BorderRadius.circular(AppSizes.radius18),
                  border: Border.all(color: AppColors.primary.withAlpha(55)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.payments_outlined, color: AppColors.primary),
                    const SizedBox(width: AppSizes.spacing12),
                    const Expanded(
                      child: Text(
                        'Total payment',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                    ),
                    Text(
                      '\$${widget.total.toStringAsFixed(0)}',
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSizes.spacing32),
              PrimaryButton(
                text: AppStrings.payAndConfirm,
                onPressed: _confirmPayment,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PaymentMethodTile extends StatelessWidget {
  const _PaymentMethodTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: selected ? AppColors.primary.withAlpha(18) : AppColors.cardBackground,
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: AppColors.primary),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w800)),
        subtitle: Text(subtitle),
        trailing: Icon(
          selected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
          color: selected ? AppColors.primary : AppColors.greyText,
        ),
      ),
    );
  }
}
