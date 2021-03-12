import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';

class ShowNotificationHelper {
  final AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
          'default_channel', 'Podcast App', 'your channel description',
          color: Colors.white,
          importance: Importance.max,
          priority: Priority.high,
          largeIcon: const DrawableResourceAndroidBitmap('icon_notif_large'),
          ticker: 'ticker');
  final IOSNotificationDetails iOSPlatformChannelSpecifics =
      IOSNotificationDetails();
  final FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

  ShowNotificationHelper({this.flutterLocalNotificationsPlugin}) {}

  Future<void> showNotification(String message) async {
    int msgId = 1;
    String title = "A NEW NOTIFICATION";
    String body = message;
    String payload = "";

    return await _showNotificationNormal(
      msgId: msgId,
      title: title,
      body: body,
      payload: payload,
    );
  }

  Future<void> _showNotificationNormal(
      {required int msgId,
      required String title,
      required String body,
      required String payload,
      String? image}) async {
    NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: (image != null)
            ? AndroidNotificationDetails('default_channel', 'your channel name',
                'your channel description',
                color: Colors.white,
                importance: Importance.max,
                priority: Priority.max,
                ticker: 'ticker')
            : androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    flutterLocalNotificationsPlugin!
        .show(msgId, title, body, platformChannelSpecifics, payload: payload);
  }

  Future<void> showOngoingNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
            'default_channel', 'your channel name', 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ongoing: true,
            autoCancel: false);
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin!.show(0, 'ongoing notification title',
        'ongoing notification body', platformChannelSpecifics);
  }
}
