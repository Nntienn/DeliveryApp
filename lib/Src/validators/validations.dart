class Validation {
  static bool isValidName(String name) {
    if (name == null || name.length == 0) {
      return false;
    }
    return true;
  }

  static bool isValidEmail(String email) {
    if (email == null || email.length == 0 || !email.contains('@')) {
      return false;
    }
    return true;
  }

  static bool isValidPhone(String phone) {
    if (phone == null || phone.length == 0) {
      return false;
    }
    return true;
  }
}