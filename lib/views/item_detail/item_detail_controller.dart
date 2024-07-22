import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:try_fit/models/product_model.dart';
import 'package:try_fit/services/pic_upload.dart';
import 'package:try_fit/services/tryOn_services.dart';
import 'package:try_fit/views/tryOn_imagePicker/tryOn_view.dart';
import 'package:try_fit/views/tryOn_image_display/tryOn_image_display_view.dart';

class ItemDetailController extends GetxController {
  void toImagePickerScreen(ProductModel product) {
    Get.to(TryonView(
      productModel: product,
    ));
  }

  File? image;
  final PicUpload upload = PicUpload();
  final ApiService apiService = ApiService();

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
    }
  }

  void submitImage(String upperBody) async {
    if (image != null) {
      final imageLink = await upload.uploadImage(image!);

      Get.to(ImageEditingScreen(
        upperBody: upperBody,
        lowerBody: imageLink,
      ));
    }
  }
}
