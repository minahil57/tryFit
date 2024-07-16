import 'dart:math';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:try_fit/core/imports/core_imports.dart';
import 'package:try_fit/views/splash/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Stack(children: [
      Positioned.fill(
          child: Container(
        color: kcBlackColor,
      )),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'GET ',
                  style: getRegularStyle(fontSize: 51.sp, color: kcWhitecolor),
                ),
                horizontalSpaceSmall,
                Expanded(
                  child: Text(
                    'Over 400',
                    style:
                        getRegularStyle(fontSize: 12.sp, color: kcWhitecolor),
                  ),
                ),
                Container(
                  width: 50,
                  height: 30,
                  alignment: Alignment.center,
                  //padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(50.r)),
                  child: Text(
                    'Skip',
                    style:
                        getRegularStyle(fontSize: 12.sp, color: kcWhitecolor),
                  ),
                )
              ],
            ),
            Text(
              'READY',
              style: getRegularStyle(fontSize: 51.sp, color: kcWhitecolor),
            ),
            Text(
              'TO SLAY',
              style: getRegularStyle(fontSize: 51.sp, color: kcWhitecolor),
            ),
            Row(
              children: [
                Text(
                  'IN',
                  style: getRegularStyle(fontSize: 51.sp, color: kcWhitecolor),
                ),
                horizontalSpaceSmall,
                Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: const BoxDecoration(
                      color: kcPrimaryColor, shape: BoxShape.circle),
                ),
                horizontalSpaceSmall,
                Text(
                  'UNLEASH YOUR \n STYLE',
                  style: getRegularStyle(fontSize: 8.sp, color: kcWhitecolor),
                ),
              ],
            ),
            Text(
              'STYLE',
              style: getRegularStyle(fontSize: 51.sp, color: kcWhitecolor),
            ),
          ],
        ),
      ),
      Align(
        alignment: Alignment.topRight,
        child: Transform.rotate(
          origin: const Offset(-150, 300),
          angle: pi / 4.5, // Rotate 60 degrees clockwise
          child: Container(
            height: 900, // 500.0 Adjust height of the bar
            width: 500.0, // Adjust width of the bar
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  kcLightGrey.withOpacity(0.5),
                  kcLightGrey
                      .withOpacity(0.01), // Adjust opacity or color as needed
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
      ),
      Positioned(
        bottom: -100,
        child: Image.asset(
          'assets/images/splash.png',
          height: 500.h,
          width: 500,
        ),
      ),
    ]);
  }
}
