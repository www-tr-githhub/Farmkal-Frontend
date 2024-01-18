import 'dart:io';

import 'package:farmkal/controllers/sellProductcontroller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  var pickedImage = File('').obs;
  final SellProductController _sellProductController =
      Get.put(SellProductController());

  Future pickImage() async {
    // ignore: deprecated_member_use
    final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      pickedImage.value = File(pickedFile.path);
      _sellProductController.files.add(pickedImage.value);
    } else {
      print('No image selected.');
    }
  }
}
