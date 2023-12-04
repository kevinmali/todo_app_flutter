import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/utils/Helper/firebase_helper.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  String? detils;
  TimeOfDay? timepick;
  String? date;

  TextEditingController tasktEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To DO App"),
        centerTitle: true,
      ),
      drawer: Drawer(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                child: Image(
                  image: AssetImage("lib/Asset/Images/pngwing.com (9).png"),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Add Task",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  child: TextFormField(
                    controller: tasktEditingController,
                    onChanged: (val) {
                      detils = val;
                    },
                    decoration: InputDecoration(
                      hintText: "Add your Task",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  timepick = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                },
                child: Container(
                  height: 66,
                  width: 366,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Add Time",
                          // "${timepick?.hour}:${timepick?.minute}",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 20,
                          ),
                        ),
                        Icon(Icons.calendar_today),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  CloudFireStoreHelper.cloudFireStoreHelper.addTask(data: {
                    "task": detils,
                    "Time": "${timepick?.hour}:${timepick?.minute}",
                    // "time": time,
                  });
                  log("======================================================");
                  log("$detils");
                  log("${timepick?.hour}:${timepick?.minute}");
                  // log("$date");
                  log("======================================================");
                  tasktEditingController.clear();
                },
                child: Container(
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        boxShadow: [BoxShadow(offset: Offset(0, 5))],
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Text(
                      "Add Task",
                      style: TextStyle(fontSize: 20),
                    ))),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed('/task');
                },
                child: Container(
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        boxShadow: [BoxShadow(offset: Offset(0, 5))],
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Text(
                      "NEXT",
                      style: TextStyle(fontSize: 20),
                    ))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
