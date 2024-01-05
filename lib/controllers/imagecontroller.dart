import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  var pickedImage = File('').obs;

  Future pickImage() async {
    // ignore: deprecated_member_use
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      pickedImage.value = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }
}
