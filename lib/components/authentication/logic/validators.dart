bool validateEmail(String email) {
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = new RegExp(pattern);
  if (!(regex.hasMatch(email))) {
    return false;
  }
  return true;
}

bool validateUsername(String username) {
  if (username.length > 4) {
    return true;
  }

  return false;
}

bool validatePassword(String password) {
  return passwordSize(password) &&
      passwordUppercase(password) &&
      passwordLowercase(password) &&
      passwordNumber(password) &&
      passwordSpecialCharacter(password) &&
      passwordNotSpace(password);
}

bool passwordSize(String password) {
  if (password.length >= 8) {
    return true;
  }

  return false;
}

bool passwordUppercase(String password) {
  String pattern = "[A-Z]";
  RegExp regex = new RegExp(pattern);
  if (regex.hasMatch(password)) {
    return true;
  }

  return false;
}

bool passwordLowercase(String password) {
  String pattern = "[a-z]";
  RegExp regex = new RegExp(pattern);
  if (regex.hasMatch(password)) {
    return true;
  }

  return false;
}

bool passwordNumber(String password) {
  for (int i = 0; i < password.length; i++) {
    if ((password.codeUnitAt(i) ^ 0x30) <= 9) {
      return true;
    }
  }

  return false;
}

bool passwordSpecialCharacter(String password) {
  String pattern = "[\$&+,:;=?@#|'<>.^*()%!-]";
  RegExp regex = new RegExp(pattern);
  if (regex.hasMatch(password)) {
    return true;
  }

  return false;
}

bool passwordNotSpace(String password) {
  for (int i = 0; i < password.length; i++) {
    if (password[i] == ' ') {
      return false;
    }
  }

  return true;
}
