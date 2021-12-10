import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';

class NotificationConfig {
  NotificationConfig() {
    _init();
  }

  Future<void> _init() async {
    final check = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('STATUS => ${check.authorizationStatus}');

    FirebaseMessaging.onMessage.listen(
      (message) {
        print('notification received');

        asuka.showDialog(
          builder: (context) {
            return AlertDialog(
              title: Text('${message.notification!.title}'),
              content: Text('${message.notification!.body}'),
            );
          },
        );
      },
    );
  }
}
