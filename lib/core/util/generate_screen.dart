import 'package:flutter/material.dart';
import 'package:p2_mobile/ui/home/pages/home_page.dart';
import 'package:p2_mobile/ui/splash/pages/splash_page.dart';
import '../../ui/account/pages/singin_page.dart';
import '../../ui/account/pages/singup_page.dart';

///
/// [GenerateScreen.onGenerate] function is responsible for returning the
///  specific [Route] with the right data.
///
class GenerateScreen {
  static Route<dynamic> onGenerate(RouteSettings value) {
    String? name = value.name;
    final Map args = value.arguments as Map<String, dynamic>;
    switch (name) {
      case NameScreen.SplachScreen:
        {
          return MaterialPageRoute(builder: (context) => SplashPage());
        }

      case NameScreen.SiginScreen:
        {
          return MaterialPageRoute(builder: (context) => SiginPage());
        }
      case NameScreen.SigupScreen:
        {
          return MaterialPageRoute(builder: (context) => SigupPage());
        }
      case NameScreen.HomeScreen:
        {
          return MaterialPageRoute(builder: (context) => HomePage());
        }

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Error'),
          ),
          body: Center(
            child: Text('ERROR'),
          ),
        );
      },
    );
  }
}

///
/// [NameScreen] class is responsible for declaring the routing names
///
class NameScreen {
  // '/'
  static const String SplachScreen = '/spalchScreen';
  //sigupPage
  static const String SiginScreen = '/siginPage';
  static const String SigupScreen = '/sigupPage';
  //homePage
  static const String HomeScreen = '/HomePage';
}
