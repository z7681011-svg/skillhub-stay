class Validators {
  const Validators._();

  static String? requiredField(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  static String? email(String? value) {
    final requiredMessage = requiredField(value, 'Email');
    if (requiredMessage != null) {
      return requiredMessage;
    }
    if (!value!.contains('@') || !value.contains('.')) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? password(String? value) {
    final requiredMessage = requiredField(value, 'Password');
    if (requiredMessage != null) {
      return requiredMessage;
    }
    if (value!.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  static String? confirmPassword(String? value, String passwordValue) {
    final requiredMessage = requiredField(value, 'Confirm password');
    if (requiredMessage != null) {
      return requiredMessage;
    }
    if (value != passwordValue) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? cardNumber(String? value) {
    final requiredMessage = requiredField(value, 'Card number');
    if (requiredMessage != null) {
      return requiredMessage;
    }
    final digitsOnly = value!.replaceAll(' ', '');
    if (digitsOnly.length < 12 || digitsOnly.length > 19) {
      return 'Enter a valid card number';
    }
    return null;
  }

  static String? cvv(String? value) {
    final requiredMessage = requiredField(value, 'CVV');
    if (requiredMessage != null) {
      return requiredMessage;
    }
    if (value!.length < 3 || value.length > 4) {
      return 'Enter a valid CVV';
    }
    return null;
  }
}
