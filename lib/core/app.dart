import 'package:blood_buddy/config/router/app_route.dart';
import 'package:blood_buddy/config/themes/theme_data.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blood Buddy',
      theme: AppTheme.lightTheme,
      initialRoute: AppRoute.splashRoute,
      routes: AppRoute.getApplicationRoute(),
      // home: const InternetCheck(),
    );
  }
}

