import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:try_fit/views/home/home_view.dart';


class StartUpController extends GetxController {
  BuildContext context;
  StartUpController({required this.context});
  RxDouble opacity = 0.0.obs;


  @override
  void onInit() async{
    super.onInit();

    _startAnimation();
    _navigateToHome();
  }

  void _startAnimation() {
    Future.delayed(const Duration(milliseconds: 200), () {
      opacity.value = 1.0;
    },);
  }

  void _navigateToHome() {
    Future.delayed(const Duration(seconds: 5), () {
    Get.to(const HomeView());

    },);
  }
}

