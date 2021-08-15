String authValidation(String authCode) {
  if (authCode.length == 0) {
    return 'لا يمكن ترك هذا الحقل فارغا';
  } else if (authCode.length < 4) {
    return 'يجب ان يحوي اسم المستخدم على الأقل 3 محارف';
  } else {
    return '';
  }
}
