import 'dart:developer';
import 'dart:io';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:green_vegease/features/injuction.dart';
import '../../routes/app_router.dart';

class FirebaseCloudMessaging {
  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      // ignore: use_build_context_synchronously
      _handleMessage(initialMessage);
    }
    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // ignore: use_build_context_synchronously
      _handleMessage(message);
    });
  }

  //Handle Terminated messages here
  void _handleMessage(RemoteMessage message) {
    handleRouteFromMessage(message.data);
  }

  void handleRouteFromMessage(Map<String, dynamic> message) {
    serviceLocator<AppRouter>().push(const ForgotPasswordPageRoute());
  }

  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  static String? fcmToken;
  FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

  /// Create a [AndroidNotificationChannel] for heads up notifications
  late AndroidNotificationChannel channel;

  //Foreground type variables
  dynamic fgType;
  dynamic fgId;
  dynamic fgCollType;
  dynamic fgCollTitle;

  getFirebaseNotification() async {
    FirebaseMessaging.instance.getAPNSToken().then((APNStoken) {
      print('here is APN token ---$APNStoken');
    });
    firebaseMessaging.getToken().then((value) async {
      fcmToken = value.toString();
      print('here is fcm token ---$fcmToken');
    }).catchError((onError) {
      print("Exception: $onError");
    });

    //For Foreground Notifications
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      showFlutterNotification(message);
    });
  }

  void showFlutterNotification(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin?.show(
        1,
        notification.title,
        notification.body,
        // message.data['title'].toString(),
        // message.data['body'].toString(),
        payload: message.data['route'],
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            icon: android.smallIcon ?? 'mipmap/ic_launcher',
            channelDescription: channel.description,
          ),
          iOS: const DarwinNotificationDetails(),
        ),
      );
    }
  }

  Future<void> setupFlutterNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    if (Platform.isIOS) {
      NotificationSettings settings = await FirebaseMessaging.instance
          .requestPermission(
              alert: true,
              announcement: false,
              badge: true,
              carPlay: false,
              criticalAlert: false,
              sound: true,
              provisional: false);
      print("user granted permission : ${settings.authorizationStatus}");
    }
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('mipmap/ic_launcher');

    /// Note: permissions aren't requested here just to demonstrate that can be
    /// done later
    final DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
            requestAlertPermission: true,
            requestBadgePermission: true,
            requestSoundPermission: true,
            onDidReceiveLocalNotification: (
              int id,
              String? title,
              String? body,
              String? payload,
            ) async {
              print('here is payload ---> $payload');
            });

    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
      // macOS: initializationSettingsMacOS,
    );

    //-- Foreground

    void onReceiveNotificationResponse(NotificationResponse payload) async {
      //Foreground redirection code
      // Parse the payload to get the data
      handleRouteFromMessage({"route": payload.payload});
      log("${payload.payload}");
    }

    await flutterLocalNotificationsPlugin?.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onReceiveNotificationResponse);

    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description: 'This channel is used for important notifications.',
      playSound: true,
      importance: Importance.max,
    );
    await flutterLocalNotificationsPlugin!
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }
}
