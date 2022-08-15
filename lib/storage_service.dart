import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
class Storage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
////https://docs.microsoft.com/en-us/sharepoint/dev/sp-add-ins/upload-a-file-by-using-the-rest-api-and-jquery
  Future<void> uploadFile(
    String filePath,
    String fileName,
    ) async {
    File file = File(filePath);
    final storageRef=  storage.ref('test/$fileName');

    try {
      await storageRef.putFile(file).then((p0) async { print( await storageRef.getDownloadURL());});

    } on firebase_core.FirebaseException catch (e) {
      print(e);
    }
  }

}