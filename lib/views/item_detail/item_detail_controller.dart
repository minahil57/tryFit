import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:try_fit/models/product_model.dart';
import 'package:try_fit/services/pic_upload.dart';
import 'package:try_fit/services/tryOn_services.dart';
import 'package:try_fit/views/tryOn_image_display/tryOn_image_display_view.dart';

import '../../core/imports/core_imports.dart';

class ItemDetailController extends GetxController {
  double width = 0.0;
  double height = 0.0;
  RxBool isImageLoaded = false.obs;
  var image = Rx<File?>(null);
  Rx<Size?> imageSize = Rx<Size?>(null);

  final PicUpload upload = PicUpload();
  final ApiService apiService = ApiService();

  Future<void> pickImage() async {
    isImageLoaded.value = true;
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File imgFile = File(pickedFile.path);
      image.value = imgFile;

      // Load image to get dimensions
      final decodedImage = await decodeImageFromList(imgFile.readAsBytesSync());
      width = decodedImage.width.toDouble();
      height = decodedImage.height.toDouble();
      if (height % 8 != 0) {
        height = (height / 8).round() * 8;
      }
      if (width % 8 != 0) {
        width = (width / 8).round() * 8;
      }
      imageSize.value = Size(decodedImage.width.toDouble(), decodedImage.height.toDouble());

      isImageLoaded.value = false;
    }
  }

  void submitImage(String upperBody) async {
    if (image.value != null) {
      final imageLink = await upload.uploadImage(image.value!);

      Get.to(ImageEditingScreen(
        upperBody: upperBody,
        lowerBody: imageLink,
         height:  height,
        width: width,
      ));
    }
  }


}
