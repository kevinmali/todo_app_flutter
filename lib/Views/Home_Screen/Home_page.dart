import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_app/utils/Helper/firebase_helper.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  List AllTextFields = [];
  String? task;

  List<TextEditingController> AllController = [];

  @override
  void initState() {
    super.initState();
    AllController.add(TextEditingController());
    AllController.add(TextEditingController());

    AllTextFields.add(Row());
    AllTextFields.add(Row());
  }

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
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  height: 600,
                  width: 400,
                  color: Colors.white,
                  child: SingleChildScrollView(
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
                          ...AllTextFields.map(
                            (e) => getTextFiled(
                              i: AllTextFields.indexOf(
                                (e),
                              ),
                            ),
                          ).toList(),
                          SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () {
                              setState(
                                () {
                                  AllController.add(TextEditingController());
                                  AllTextFields.add(
                                      getTextFiled(i: AllTextFields.length));
                                },
                              );
                            },
                          ),
                          Center(
                            child: ElevatedButton(
                                onPressed: () {
                                  CloudFireStoreHelper.cloudFireStoreHelper
                                      .addTask(data: {
                                    "task": task,
                                  });
                                  log("======================================================");
                                  log("$task");
                                  log("======================================================");
                                },
                                child: Text("Add task")),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row getTextFiled({required int i}) {
    return Row(children: [
      Expanded(
        flex: 12,
        child: TextField(
          controller: AllController[i],
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            icon: IconButton(
              icon: Icon(
                Icons.watch_later,
                size: 40,
              ),
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2015, 8),
                  lastDate: DateTime(2101),
                );
              },
            ),
            hintText: "  Your Tasks ",
            hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
          ),
        ),
      ),
      Expanded(
        flex: 2,
        child: IconButton(
          onPressed: () {
            setState(
              () {
                AllController.removeAt(i);
                AllTextFields.removeAt(i);
              },
            );
          },
          icon: Icon(
            Icons.delete,
            size: 40,
          ),
        ),
      ),
    ]);
  }
}
