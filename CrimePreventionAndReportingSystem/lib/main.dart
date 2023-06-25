
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:crime_prevent_report_system/account/screens/help_center_screen.dart';
import 'package:crime_prevent_report_system/help_feed/screens/my_post_screen.dart';
import 'package:crime_prevent_report_system/login_register/screens/register_screen.dart';
import 'package:crime_prevent_report_system/login_register/screens/splash_screen.dart';
import 'package:crime_prevent_report_system/service/global.dart';
import 'package:crime_prevent_report_system/service/logger.dart';
import 'package:crime_prevent_report_system/account/screens/manage_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


import 'account/components/webview.dart';
import 'account/screens/account_screen.dart';
import 'account/screens/edit_profile_screen.dart';
import 'account/screens/edit_sos_content_screen.dart';
import 'crime_alert/screens/crime_alert_screen.dart';
import 'crime_report/screens/crime_report_screen.dart';
import 'help_feed/screens/add_edit_screen.dart';
import 'help_feed/screens/post_feed_screen.dart';
import 'home.dart';
import 'login_register/screens/login_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  //firebase
  await Firebase.initializeApp();

  //awesome notifications
  AwesomeNotifications().initialize(null,
      [NotificationChannel(
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            )],);

  runApp(const MyApp());
}


_init() async {
  var log = logger();
  log.i('App init');
  var global = Global();
  await global.init();
  // to suppress the code check warning which requires return a string
  return Future.value(null);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  asyncInit() async {
    await _init();
  }

  @override
  initState() {
    super.initState();
    asyncInit();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crime PnR System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/':(context) => const SplashScreen(),
        '/home':(context) => const HomePage(),
        '/login':(context) => const LoginScreen(),
        '/register':(context) => const RegisterScreen(),
        '/account':(context) => const AccountScreen(),
        '/crimeAlert':(context) => const CrimeAlertsScreen(),
        '/crimeReport':(context) => const CrimeReportScreen(),
        '/postFeed':(context) => const PostFeedScreen(),
        '/editProfile':(context) => const EditProfile(),
        '/manageContact':(context) => const ManageEmergencyContact(),
        '/postList':(context) => const PostFeedScreen(),
        '/editSOS':(context) => const EditSOSContent(),
        '/myPost':(context) => const MyPostScreen(),
        '/helpCenter':(context) => const HelpCenterScreen(),
        '/guide':(context) => const GuideWebview()
      },
    );
  }
}



