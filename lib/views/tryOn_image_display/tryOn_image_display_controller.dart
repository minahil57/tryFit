import 'package:get/get.dart';
import 'package:try_fit/services/tryOn_services.dart';

class ImageEditingController extends GetxController {
  final ApiService apiService = ApiService();
  final int maxRetries = 3;

  var imageFuture = Future<String?>.value(null).obs;
  var retryCount = 0.obs;

  void fetchImage(String upperBody, String lowerBody, double height, double width) {
    imageFuture.value = apiService.editImage(upperBody, lowerBody, height, width).then((imageUrl) {
      if (retryCount.value < maxRetries && (imageUrl == null || !imageUrl.endsWith('.png'))) {
        retryCount.value++;
        fetchImage(upperBody, lowerBody, height, width);
      } else {
        retryCount.value = 0;
      }
      print(imageUrl);
      return imageUrl;
    });
  }
}
