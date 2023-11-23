import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

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
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      Get.snackbar(
          '${event.notification?.title}', '${event.notification?.body}');
    });

    messaging.getToken().then((value) => print("token:$value"));
  }

  static Future<void> backGroundMessage(RemoteMessage remoteMessage) async {
    print("Message");
  }
}
