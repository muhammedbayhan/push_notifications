import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  late final FirebaseMessaging messaging;

  void settingsNotification() async {
    await messaging.requestPermission(
      alert: true,
      sound: true,
      badge: true,
    );
  }

  void connectNotification() async {
    await Firebase.initializeApp();
    messaging = FirebaseMessaging.instance;
    messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      sound: true,
      badge: true,
    );

    settingsNotification();
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {});
  }
}
