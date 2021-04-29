import 'package:get/get_utils/src/get_utils/get_utils.dart';

class Validator {
  static String isEmail(String value) {
    if (value.trim().isEmpty) {
      return 'This field is required';
    }
    if (GetUtils.isEmail(value.trim())) {
      return null;
    }
    return 'Please enter a valid email';
  }

  static String isPassword(String value) {
    if (value.trim().isEmpty) {
      return 'This field is required';
    } else if (!GetUtils.isLengthGreaterOrEqual(value.trim(), 2)) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  static String isUserName(String value) {
    if (value.trim().isEmpty) {
      return 'This field is required';
    } else if (!GetUtils.isUsername(value.trim()) || value.trim().length < 2) {
      return 'Please enter a valid username';
    }
    return null;
  }

  static String isPhoneNumber(String value) {
    if (value.isEmpty || value.length < 11) {
      return 'Phone number must be 11 digits long';
    }
    return null;
  }
}
