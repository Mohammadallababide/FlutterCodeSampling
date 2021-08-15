String? passwordValidation(String password) {
  if (password.length <= 6) {
    return 'يجب ان تكون كلمة المرور اكثر من 8 محارف';
  }
  return null;
}
