String? phoneNumberValidation(String value) {
// Indian Mobile number are of 10 digit only
  if (value.length != 10)
    return 'لابد أن تكون صيغة رقم الجوال صحيحة مثل 0912345678';
  else
    return null;
}
