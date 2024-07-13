import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:try_fit/views/splash/splah_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
   return Scaffold(
      body:
      Padding(padding: EdgeInsets.only(left: 30.w,right:30.w),
      child:
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox.shrink(),
            Image.asset(
              'assets/images/logo.png',
              height: 200.h,
            ),
            SizedBox(height: 14.h),
          ],
        ),
      ),
      ),
    );
  }
}