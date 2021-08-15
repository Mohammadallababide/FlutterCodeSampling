String? emailValidation(String email) {
  bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
  if (!emailValid) {
    return 'صيغة البريد الإلكتروني غير صحيحة';
  }
  return null;
}
