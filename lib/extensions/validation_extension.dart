extension InputValExt on String {
  bool get isValidEmail {
    final emailRegEx = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    return emailRegEx.hasMatch(this);
  }

  bool get isValidPassword {
    return length > 6;
  }

  bool get isValidUsername {
    return length > 6;
  }
}
