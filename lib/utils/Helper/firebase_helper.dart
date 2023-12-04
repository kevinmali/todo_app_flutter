import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFireStoreHelper {
  CloudFireStoreHelper._();

  static final CloudFireStoreHelper cloudFireStoreHelper =
      CloudFireStoreHelper._();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addTask({required Map<String, dynamic> data}) async {
    await firestore.collection("task").doc("${data['detils']}").set(data);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchTask() {
    return firestore.collection("task").snapshots();
  }
}
