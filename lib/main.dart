import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:macstore/controllers/auth_controller.dart';
import 'package:macstore/controllers/banners_controller.dart';
import 'package:macstore/controllers/category_controller.dart';
import 'package:macstore/views/screens/authentication_screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: FirebaseOptions(
          apiKey: "AIzaSyBbMnAG9TmAbeZJxzKi4K8qJrKbtyyR2f8",
          appId: '1:558100884881:android:013960d2a4d5fc48e83e30',
          messagingSenderId: '558100884881',
          projectId: 'macstore-73d62',
          storageBucket: "gs://macstore-73d62.appspot.com",
        )).then((value) {
          Get.put(AuthController());
           Stripe.publishableKey =
        "pk_test_51Nv0TYLcpVDSklU4eoI285cQsT6Lr0w0YuHR5Aaj2Tx8hhLtkBJS6adO2yC0kcAesDO9jfN0PK4sfcs6oelLXowX006uEcO1Dw";
        })
      : await Firebase.initializeApp();
  runApp(ProviderScope(child: const MyApp()));
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
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: LoginScreen(),
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
