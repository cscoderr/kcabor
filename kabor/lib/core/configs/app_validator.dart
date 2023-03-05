///Form Validator class for Athena UI [AppValidator].
class AppValidator {
  ///Email Validator function for Athena UI.
  static String? email(String? value) {
    if (value == null) return null;
    if (value.isEmpty) {
      return 'Email is required';
    }

    if (!isEmailValid(value)) {
      return 'Email is invalid';
    }
    return null;
  }

  static String? emailOrPhone(String? value) {
    if (value == null) return null;
    if (value.isEmpty) {
      return 'Email is required';
    }

    if (int.tryParse(value) != null) {
      return phoneNumber(value);
    }

    if (!isEmailValid(value)) {
      return 'Email is invalid';
    }
    return null;
  }

  ///Check for valid alphanumeric email for Athena UI.
  static bool isEmailValid(String value) {
    final emailRegex = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$",
    );
    return emailRegex.hasMatch(value);
  }

  ///Full Name Validator function for Athena UI.
  static String? fullName(String? value) {
    if (value == null) return null;
    if (value.isEmpty) {
      return 'Full name is required';
    }
    return null;
  }

  ///Phone Number Validator function for Athena UI.
  static String? phoneNumber(String? value) {
    if (value == null) return null;
    if (value.isEmpty) {
      return 'Phone number is required';
    }

    if (value.length < 10) {
      return 'Invalid phone number';
    }
    return null;
  }

  ///Otp Validator function for Athena UI.
  static String? otp(String? value) {
    if (value == null) return null;
    if (value.isEmpty) {
      return 'Otp is required';
    }

    if (value.length != 4) {
      return 'Invalid otp';
    }
    return null;
  }

  ///First Name Validator function for Athena UI.
  static String? firstName(String? value) {
    if (value == null) return null;
    if (value.isEmpty) {
      return 'First name is required';
    }
    return null;
  }

  ///Last Name Validator function for Athena UI.
  static String? lastName(String? value) {
    if (value == null) return null;
    if (value.isEmpty) {
      return 'Last name is required';
    }
    return null;
  }

  ///Date of Birth Validator function for Athena UI.
  static String? normalDob(DateTime? value) {
    if (value == null) return null;
    if (value.toString().isEmpty) {
      return 'Dob is required';
    }
    return null;
  }

  ///Date of Birth Validator function for Athena UI.
  static String? dob(DateTime? value) {
    if (value == null) return null;
    if (value.toString().isEmpty) {
      return 'Dob is required';
    }
    final isEligible = validateDob(value);
    if (isEligible != null) {
      return isEligible;
    }
    return null;
  }

  ///Check for valid date of birth for Athena UI.
  static String? validateDob(DateTime dateTime) {
    final dob = DateTime.now().difference(dateTime);
    if (dob.inDays < 6368) {
      return 'You must be up to 18 years before you can register';
    }
    return null;
  }

  ///Check for password for Athena UI.
  static bool isValidPassword(String value) {
    if (!RegExp('^(?=(.*[A-Z]){1})(?=(.*[a-z]){1})').hasMatch(value)) {
      return false;
    }

    if (!RegExp('^(?=.*?[a-z])').hasMatch(value)) {
      return false;
    }

    if (!RegExp('(?=.*?[0-9])').hasMatch(value)) {
      return false;
    }

    if (!RegExp(r'(?=.*?[!@#\?\$&*~])').hasMatch(value)) {
      return false;
    }

    if (!RegExp(r'(?=^.{8,20}$)').hasMatch(value)) {
      return false;
    }
    return true;
  }

  ///Password Validator for Athena UI.
  static String? password(String? value) {
    if (value == null) return null;
    if (value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    if (!RegExp('^(?=(.*[A-Z]){1})(?=(.*[a-z]){1})').hasMatch(value)) {
      return 'At least a capital and small letter is required';
    }

    if (!RegExp('^(?=.*?[a-z])').hasMatch(value)) {
      return 'At least a small letter is required';
    }

    if (!RegExp('(?=.*?[0-9])').hasMatch(value)) {
      return 'At least a number is required';
    }

    if (!RegExp(r'(?=.*?[!@#\?\$&*~])').hasMatch(value)) {
      return 'At least a special character is required';
    }

    if (!RegExp(r'(?=^.{8,20}$)').hasMatch(value)) {
      return 'Password must be between 8 - 20 characters';
    }

    // if (!value.isAlphanumeric) {
    //   return 'At least a number, a letter and a special character is required';
    // }
    return null;
  }

  ///Confirm Password Validator for Athena UI.
  static String? confirmPassword(String? value, String password) {
    if (value == null) return null;
    if (value != password) {
      return 'Password do not match';
    }
    return null;
  }

  ///Login Password Validator for Athena UI.
  static String? loginPassword(String? value) {
    if (value == null) return null;
    if (value.isEmpty) {
      return 'Password is required';
    }
    return null;
  }
}
