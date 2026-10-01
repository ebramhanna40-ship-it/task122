// Flutter SDK imports are resolved by the Flutter analyzer/build environment.
// ignore: uri_does_not_exist
import 'package:flutter/material.dart';
import 'package:flutter_application_2/login/login_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(420, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(home: LoginScreen()),
    );
  }
}
