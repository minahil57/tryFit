import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class PicUpload{
  Future<String> uploadImage(File imageFile) async {

    String filePath =
        'products/images/${DateTime.now().millisecondsSinceEpoch}.jpg';
    log('Uploading.....');
    // Upload file to Firebase Storage
    final storageRef = FirebaseStorage.instance.ref().child(filePath);
    await storageRef.putFile(imageFile);

    // Get download URL
    String downloadURL = await storageRef.getDownloadURL();
    log('Uploaded');
    return downloadURL;
  }
}