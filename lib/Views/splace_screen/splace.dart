import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Login_page/login_screen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () {
      Get.toNamed('/login');
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 400,
              width: 400,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("lib/Asset/Images/todosplace.gif"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Create a Schedule ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
          ],
        ),
      ),
    );
  }
}
