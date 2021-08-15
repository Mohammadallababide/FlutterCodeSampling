String? userNameValidation(String userName) {
  if (userName == null) {
    return 'لا يمكن ترك هذا الحقل فارغا';
  } else if (userName.length < 3) {
    return 'يجب ان يحوي اسم المستخدم على الأقل 3 محارف';
  }
  return null;
}
