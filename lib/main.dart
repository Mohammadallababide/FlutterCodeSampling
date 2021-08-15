import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';
import 'package:firebase_core/firebase_core.dart';

import 'core/services/local_notification_services.dart';

/// Receive message when app is in background solution for on message
Future<void> backGroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title!);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotificationServices.initialize();
  await Firebase.initializeApp();

  /// Set a message handler function which is called
  /// when the app is in the background or terminated.
  FirebaseMessaging.onBackgroundMessage(backGroundHandler);
  runApp(App());
}
