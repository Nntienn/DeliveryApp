class Validation {
  static bool isValidName(String name) {
    if (name == null || name.length == 0) {
      return false;
    }
    return true;
  }

  static int isValidEmail(String email) {
    String pattern = '(?=\A.{6,255}\z)(#{USER})@(#{DOMAIN})';
    RegExp regExp = new RegExp(pattern);
    if (email.length == 0) {
      return 0;
    } else if (!regExp.hasMatch(email)) {
      return 1;
    }
    return null;
  }

  static int isValidPhone(String phone) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    if (phone.length == 0) {
      return 0;
    } else if (!regExp.hasMatch(phone)) {
      return 1;
    }
    return null;
  }
}