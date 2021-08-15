import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:p2_mobile/core/services/local_notification_services.dart';
import '../core/util/app_localizations.dart';
import '../core/util/constants.dart';
import '../core/util/custom_scroll_behavior.dart';
import '../core/util/generate_screen.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  late Locale locale;

  @override
  void initState() {
    locale = Locale(
        // prefs.getString(PreferencesKeys.APP_LANGUAGE) ??
        LANGUAGE_DEFAULT);
    // here i should send api to get user information

    /// gives you the message on which user taps
    /// And it opened the app from triminated state
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      final routeFromMessage = message!.data['route'];
      print(routeFromMessage);
      // todo implement navigation with the [routeFromMessage]
    });

    /// forground work
    FirebaseMessaging.onMessage.listen((message) {
      print(message.notification!.title!);
      print(message.notification!.body!);
      LocalNotificationServices.display(message);
    });

    /// when the app is in background but opened and user taps
    /// on the notification
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routeFromMessage = message.data['route'];
      print(routeFromMessage);
      // todo implement navigation with the [routeFromMessage]
    });
    super.initState();
  }

  changeLocal() {
    setState(() {
      locale = Locale(
          //     prefs.getString(PreferencesKeys.APP_LANGUAGE) ??
          LANGUAGE_DEFAULT);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      designSize: Size(360, 690),
      // allowFontScaling: false,
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Symphonia School',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Color(0XFFAC50FC),
          accentColor: Color(0XFFAC50FC),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        builder: (context, child) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.dark.copyWith(
              statusBarColor: Colors.transparent,
            ),
            child: ScrollConfiguration(
              behavior: CustomScrollBehavior(),
              child: child!,
            ),
          );
        },
        initialRoute: NameScreen.SplachScreen,
        onGenerateRoute: GenerateScreen.onGenerate,
        localizationsDelegates: [
          // A class which loads the translations from JSON files
          AppLocalizations.delegate,
          //AppLocalizations.delegate,
          // Built-in localization of basic text for Material widgets
          GlobalMaterialLocalizations.delegate,
          // Built-in localization for text direction LTR/RTL

          ////////////////////////
          GlobalWidgetsLocalizations.delegate,
          ////////////////////////
        ],
        supportedLocales: [
          Locale(LANGUAGE_ENGLISH),
          Locale(LANGUAGE_ARABIC),
        ],
        // localeResolutionCallback:
        //     (Locale locale, Iterable<Locale> supportedLocales) {
        //   for (var supportedLocale in supportedLocales) {
        //     if (locale != null &&
        //         supportedLocale.languageCode == locale.languageCode)
        //       return supportedLocale;
        //   }
        //   return supportedLocales.first;
        // },
      ),
    );
  }

  @override
  dispose() {
    super.dispose();
  }
}
