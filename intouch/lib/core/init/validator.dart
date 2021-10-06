// Libraries

// Project imports:
import 'package:intouch/core/constants/core.dart';

class Validator {
  // Username Control
  String validateName(String value) {
    String pattern = r'(^[a-zA-Z ]*$)'; // PHP preg_match()
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return AppStrings.NAME_NULL_ERROR;
    } else if (!regExp.hasMatch(value)) {
      return AppStrings.INVALID_NAME_ERROR;
    }
    return null;
  }

  String validateMobile(String value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Mobile is Required";
    } else if (value.length != 10) {
      return "Mobile number must 10 digits";
    } else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits";
    }
    return null;
  }

  // E-mail Control
  String validateEmail(String value) {
    String pattern =
        r'[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}'; // PHP preg_match()
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return AppStrings.EMAIL_NULL_ERROR;
    } else if (!regExp.hasMatch(value)) {
      return AppStrings.INVALID_EMAIL_ERROR;
    }
    return null;
  }

  // Password Control
  String validatePasswordLength(String value) {
    if (value.length == 0) {
      return AppStrings.NULL_PASSWORD_ERROR;
    } else if (value.length < 5) {
      return AppStrings.SHORT_PASSWORD_ERROR;
    }
    return null;
  }
}
