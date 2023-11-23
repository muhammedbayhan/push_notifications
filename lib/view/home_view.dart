import 'package:flutter/material.dart';
import 'package:push_notifications/service/notification_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _notificationService = NotificationService();
  @override
  void initState() {
    
    super.initState();
    _notificationService.connectNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Push Notifications"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Text(
          "Send notifications to customers via Firebase",
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        )),
      ),
    );
  }
}
