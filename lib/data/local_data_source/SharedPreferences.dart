import 'package:p2_mobile/models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  SharedPref._();
  late SharedPreferences _preferences;
  static final SharedPref pref = SharedPref._();
  static late String token;
  static late String lang;
  static late User user;
}
