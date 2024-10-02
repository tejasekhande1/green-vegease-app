mixin ValidationMixin {
  String? validatedPhoneNumber(String? value) {
    if (value == null ||
        value.length > 10 ||
        value.isEmpty ||
        value.length < 10) {
      return 'Please enter a valid phone number';
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Please enter a valid phone number';
    } else {
      return null;
    }
  }

  String? validatedPassword(String? value) {
    if (value == null || value.isEmpty || value.contains(' ')) {
      return 'Passwords fields should not be empty';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    } else {
      return null;
    }
  }

  String? validatedName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a name';
    } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'Please enter a valid name';
    } else if (value.length > 50) {
      return 'Name cannot be longer than 50 characters';
    } else {
      return null;
    }
  }

  String? validatedEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email address';
    } else {
      return null;
    }
  }
}
