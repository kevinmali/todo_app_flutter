import 'dart:developer';
import 'package:flutter/material.dart';
import '../../utils/Helper/firebase_auth_helper.dart';

class Signup_page extends StatelessWidget {
  Signup_page({super.key});

  String? email;
  String? password;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Signup"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              onChanged: (val) {
                email = val;
              },
              decoration: InputDecoration(
                  hintText: "email", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: passwordController,
              onChanged: (val) {
                password = val;
              },
              decoration: InputDecoration(
                  hintText: "Password", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  AuthHelper.authHelper
                      .signup(email: email!, password: password!);
                  log("${email}");
                  log("${password}");

                  emailController.clear();
                  passwordController.clear();
                },
                child: Text("Sign Up")),
          ],
        ),
      ),
    );
  }
}
