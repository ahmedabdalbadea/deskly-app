abstract class FormValidators {
  static String? requiredFieldValidator(String? value) {
    if (value?.isEmpty ?? true) {
      return "Field is required";
    } else {
      return null;
    }
  }

  static String? validateEmail(String? value) {
    final regex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (value == null || !regex.hasMatch(value)) {
      return "Enter a valid email";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.length < 8) {
      return "Password must be at least 8 characters";
    }
    return null;
  }

  static String? confirmPasswordValidator(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return "Please confirm your password";
    }

    if (value != password) {
      return "Passwords do not match";
    }

    return null;
  }

  static String? validateInternationalPhone(String? value) {
    final regexPhone = RegExp(r'^\+?[0-9\s\-\(\)]{9,15}$');

    if (value == null || value.isEmpty) {
      return "Phone number is required";
    } else if (!regexPhone.hasMatch(value)) {
      return "Please enter a valid phone number";
    }

    return null;
  }
}
