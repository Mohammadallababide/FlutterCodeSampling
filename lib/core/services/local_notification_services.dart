import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// creating notification chanal by [LocalNotificationServices]
class LocalNotificationServices {
  static final FlutterLocalNotificationsPlugin _notificationPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize() {
    final InitializationSettings initializationSettings =
        InitializationSettings(
          // todo need to set and define app icon to pass it to AndroidInitializationSettings function bellow .... 
            android: AndroidInitializationSettings("@mipmap/ic_launcher"));
    _notificationPlugin.initialize(initializationSettings);
  }

  static void display(RemoteMessage message) async {
    try {
      final id = DateTime.now().microsecondsSinceEpoch ~/ 1000;
      final NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          'symphoniaNotification',
          'symphoniaNotification channel',
          'this is out channel',
          importance: Importance.max,
          priority: Priority.high,
        ),
      );
      await _notificationPlugin.show(
        id,
        message.notification!.title!,
        message.notification!.body!,
        notificationDetails,
      );
    } on Exception catch (e) {
      print(e);
    }
  }
}
