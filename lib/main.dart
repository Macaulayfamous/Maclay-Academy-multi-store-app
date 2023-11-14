import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:macstore/controllers/banners_controller.dart';
import 'package:macstore/controllers/category_controller.dart';
import 'package:macstore/views/screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: FirebaseOptions(
          apiKey: "AIzaSyBbMnAG9TmAbeZJxzKi4K8qJrKbtyyR2f8",
          appId: '1:558100884881:android:013960d2a4d5fc48e83e30',
          messagingSenderId: '558100884881',
          projectId: 'macstore-73d62',
        ))
      : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainScreen(),
      initialBinding: BindingsBuilder(() {
        Get.put<CategoryController>(
          CategoryController(),
        );

        Get.put<BannerController>(
          BannerController(),
        );
      }),
    );
  }
}
