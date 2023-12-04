import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/utils/Helper/firebase_helper.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../../utils/Helper/firebase_auth_helper.dart';

class All_Task extends StatefulWidget {
  const All_Task({super.key});

  @override
  State<All_Task> createState() => _All_TaskState();
}

class _All_TaskState extends State<All_Task> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedTextKit(
          animatedTexts: [
            WavyAnimatedText('All Data '),
            WavyAnimatedText('To Do App'),
          ],
          isRepeatingAnimation: true,
        ),
        // AnimatedTextKit(
        //   animatedTexts: [
        //     TypewriterAnimatedText(
        //       "${AuthHelper.authHelper.auth.currentUser?.email.toString().split("@")[0]}",
        //       textStyle: const TextStyle(
        //         fontSize: 32.0,
        //         fontWeight: FontWeight.bold,
        //       ),
        //       speed: const Duration(milliseconds: 500),
        //     ),
        //   ],
        //   repeatForever: true,
        //   displayFullTextOnTap: true,
        // ),
        centerTitle: true,

        // Text(
        //   "${AuthHelper.authHelper.auth.currentUser?.email.toString().split("@")[0]}",
        //   style: TextStyle(fontSize: 26),
        // ),
      ),
      body: StreamBuilder(
        stream: CloudFireStoreHelper.cloudFireStoreHelper.fetchTask(),
        builder: (ctx, snapshot) {
          if (snapshot.hasError) {
            Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            QuerySnapshot<Map<String, dynamic>>? data = snapshot.data;
            List<QueryDocumentSnapshot<Map<String, dynamic>>>? task =
                data?.docs;
            return ListView.builder(
              itemCount: task?.length,
              itemBuilder: (ctx, i) {
                return Card(
                    child: ListTile(
                  title: Text("${task?[i]['task']}"),
                  subtitle: Text("${task?[i]['Time']}"),
                ));
              },
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
