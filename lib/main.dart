import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'Screen/Dashboard/dashboard_screen.dart';
import 'Screen/Login/login_Screen.dart';
import 'Screen/main_dashboard.dart';
import 'Service/global_data.dart';
import 'Service/shared_preferences/pref_manager.dart';

var is_check_login;
Future<void> main() async {
  await Preferences.init();
  is_check_login=Preferences.getBoolValuesSF(Preferences.is_login_check);
  Auth_token=Preferences.getStringValuesSF(Preferences.Token);
  print('is_check_login');
  print(is_check_login);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Admin Panel',
      builder: EasyLoading.init(),
        debugShowCheckedModeBanner: false,
      home:  is_check_login!=null?const main_dashboard()
        :const login_screen(),
      // initialRoute:is_check_login!=null? '/':'/login',
      // onGenerateRoute: (settings) {
      //   final page = _getPageWidget(settings);
      //   if (page != null) {
      //     return PageRouteBuilder(
      //         settings: settings,
      //         pageBuilder: (_, __, ___) => page,
      //         transitionsBuilder: (_, anim, __, child) {
      //           return FadeTransition(
      //             opacity: anim,
      //             child: child,
      //           );
      //         });
      //   }
      //   return null;
      // },

    );
  }
  // Widget? _getPageWidget(RouteSettings settings) {
  //   if (settings.name == null) {
  //     return null;
  //   }
  //   final uri = Uri.parse(settings.name!);
  //   switch (uri.path) {
  //     case '/':
  //       return DashboardScreen();
  //     case '/login':
  //       return login_screen();
  //     case '/secondLevelItem1':
  //       return Container(child: Text('secondLevelItem1'),);
  //     case '/secondLevelItem2':
  //       return Container(child: Text('secondLevelItem2'),);
  //     case '/thirdLevelItem1':
  //       return Container(child: Text('thirdLevelItem1'),);
  //     case '/thirdLevelItem2':
  //       return Container(child: Text('thirdLevelItem2'),);
  //   }
  //   return null;
  // }
}
