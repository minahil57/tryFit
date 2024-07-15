import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:try_fit/core/imports/core_imports.dart';

class NavBarController extends GetxController {

  RxInt currentIndex = 0.obs;
  final PageController pageController = PageController(initialPage: 0);


  final bottomBarItems = [
   BottomNavigationBarItem(
    icon: SvgPicture.asset(
          'assets/icons/Home House.svg',
          width: 20.w,
          height: 20.h,

          color: kcBlackColor, // Optional: set color
        ),
    activeIcon: SvgPicture.asset(
          'assets/icons/Home House.svg',
          width: 20.w,
          height: 20.h,
          // ignore: deprecated_member_use
          color: kcPrimaryColor, // Optional: set color
        ),
    label: 'Home',
  ),
    BottomNavigationBarItem(
    icon: SvgPicture.asset(
          'assets/icons/Compass.svg',
          width: 20.w,
          height: 20.h,
          // ignore: deprecated_member_use
          color: kcBlackColor, // Optional: set color
        ),
    activeIcon: SvgPicture.asset(
          'assets/icons/Compass.svg',
          width: 20.w,
          height: 20.h,
          // ignore: deprecated_member_use
          color: kcPrimaryColor, // Optional: set color
        ),
    label: 'Explore',
  ),
   BottomNavigationBarItem(
    icon: SvgPicture.asset(
          'assets/icons/Heart.svg',
          width: 20.w,
          height: 20.h,
          // ignore: deprecated_member_use
          color: kcBlackColor, // Optional: set color
        ),
    activeIcon: SvgPicture.asset(
          'assets/icons/Heart.svg',
          width: 20.w,
          height: 20.h,
          // ignore: deprecated_member_use
          color: kcPrimaryColor, // Optional: set color
        ),
    label: 'Favorites',
  ),
   BottomNavigationBarItem(
    icon: SvgPicture.asset(
          'assets/icons/Speech Bubble.svg',
          width: 20.w,
          height: 20.h,
          // ignore: deprecated_member_use
          color: kcBlackColor, // Optional: set color
        ),
    activeIcon: SvgPicture.asset(
          'assets/icons/Speech Bubble.svg',
          width: 20.w,
          height: 20.h,
          // ignore: deprecated_member_use
          color: kcPrimaryColor, // Optional: set color
        ),
    label: 'Cart',
  ),
   BottomNavigationBarItem(
    icon: SvgPicture.asset(
          'assets/icons/User 1.svg',
          width: 20.w,
          height: 20.h,
          // ignore: deprecated_member_use
          color: kcBlackColor, // Optional: set color
        ),
    activeIcon:  SvgPicture.asset(
          'assets/icons/User 1.svg',
          width: 2.w,
          height: 20.h,
          // ignore: deprecated_member_use
          color: kcPrimaryColor, // Optional: set color
        ),
    label: 'Profile',
  ),
].obs;


}