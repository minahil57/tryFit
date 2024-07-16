import 'dart:async';
import 'package:get/get.dart';
import 'package:try_fit/views/bottom%20bar/bottom_view.dart';


class SplashController extends GetxController {



  late Timer timer;

  @override
  void onInit() async {
    super.onInit();

    timer = Timer(const Duration(seconds: 5), () {

      Get.offAll(() => const BottomNavBar());

      // Cancel the timer after it has been executed
      timer.cancel();
    });
  }

  @override
  void onClose() {
    super.onClose();
    timer.cancel();
  }
}