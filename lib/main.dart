import 'package:attendance_system/model/attendance_model.dart';
import 'package:attendance_system/providers/attendance_provder.dart';
import 'package:attendance_system/providers/user_document_provider.dart';
import 'package:attendance_system/screens/auth/create_user.dart';
import 'package:attendance_system/screens/auth/signup.dart';
import 'package:attendance_system/screens/splash.dart';
import 'package:attendance_system/screens/user/all_user_screen.dart';
import 'package:attendance_system/screens/attendance_screen.dart';
import 'package:attendance_system/services/http_services/attendance_service/attendance_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AttendanceProvider()),
        ChangeNotifierProvider(create: (_) => UserDocumentProvider()),
      ],
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: SplashScreen(),
            );
          }),
    );
  }
}
