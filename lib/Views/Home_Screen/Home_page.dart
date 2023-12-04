import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_app/utils/Helper/firebase_helper.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  String? detils;
  String? time;
  String? date;

  TextEditingController tasktEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To DO App"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 20,
                  ),
                  border: OutlineInputBorder(borderSide: BorderSide(width: 20)),
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.blueGrey),
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Add Task",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 30,
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
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                Container(
                    height: 80,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.calendar_today),
                      tooltip: 'Tap to open date picker',
                      onPressed: () {
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2015, 8),
                          lastDate: DateTime(2101),
                        );
                      },
                    )),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        CloudFireStoreHelper.cloudFireStoreHelper
                            .addTask(data: {
                          "task": detils,
                          "date": date,
                          "time": time,
                        });
                        log("======================================================");
                        log("$detils");
                        log("$time");
                        log("$date");
                        log("======================================================");
                        tasktEditingController.clear();
                      },
                      child: Text("Add task")),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
