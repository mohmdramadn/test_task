class Validator {
  Validator._();

  static String isValidPassword(String password) {
    if (password.isEmpty) {
      return '';
    }
    return '';
  }

  static String isValidConfirmPassword(
      {required String password, required String confirmPassword}) {
    if (confirmPassword.isEmpty) {
      return '';
    } else if (!isMatchPassword(password, confirmPassword)) {
      return '';
    }
    return '';
  }

  static bool isValidEmail(String? email) {
    const emailRegExpString = r'[a-zA-Z0-9\+\.\_\%\-\+]{1,256}\@[a-zA-Z0-9]'
        r'[a-zA-Z0-9\-]{0,64}(\.[a-zA-Z0-9][a-zA-Z0-9\-]{0,25})+';
    return RegExp(emailRegExpString, caseSensitive: false).hasMatch(email!) ||
        email.isEmpty;
  }

  static String isValidPhone(String? phone) {
    String pattern = r'^1\d{10}$';

    if (phone!.isEmpty) {
      return '';
    } else if (!RegExp(pattern).hasMatch(phone)) {
      return '';
    }

    return '';
  }

  static bool isValidName(String? userName) {
    return userName != '';
  }

  static bool isMatchPassword(String password, String matchPassword) {
    return password == matchPassword;
  }
}
