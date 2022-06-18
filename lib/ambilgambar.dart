import 'package:firebase_storage/firebase_storage.dart';

Future<String> getImageDownloadURL(String image) async {
  String imageDownloadURL =
      await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  return imageDownloadURL;
}
