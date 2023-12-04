import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/Views/Home_Screen/Home_page.dart';

import 'Views/All_Task_page/all_task.dart';
import 'Views/Login_page/login_screen.dart';
import 'Views/sign_page/sign_in_screen.dart';
import 'Views/splace_screen/splace.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true),
    getPages: [
      GetPage(name: '/', page: () => Splash()),
      GetPage(name: '/login', page: () => login_page()),
      GetPage(name: '/home', page: () => Home_Page()),
      GetPage(name: '/sign', page: () => Signup_page()),
      GetPage(name: '/task', page: () => All_Task()),
    ],
  ));
}
