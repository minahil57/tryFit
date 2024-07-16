import 'package:get/get.dart';
import 'package:try_fit/core/imports/core_imports.dart';
import 'package:try_fit/views/bottom%20bar/bottom_controller.dart';
import 'package:try_fit/views/home/home_view.dart';
import 'package:try_fit/views/item_detail/item_detail_view.dart';

class BottomNavBar extends GetView<NavBarController> {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NavBarController());
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: PageView(
        scrollBehavior: const MaterialScrollBehavior(),
        physics: const PageScrollPhysics(),
        controller: controller.pageController,
        onPageChanged: (value) {
          controller.currentIndex.value = value;
        },
        children: const [
          HomeView(),
          //ItemDetailView(),
        ],
        //controller: controller.pageController,
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: kcWhitecolor,
          items: controller.bottomBarItems,
          currentIndex: controller.currentIndex.value,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedIconTheme: const IconThemeData(color: kcBlackColor),
          selectedIconTheme: const IconThemeData(color: kcPrimaryColor),
          selectedItemColor: kcPrimaryColor,
          unselectedItemColor: kcBlackColor,
          onTap: (int value) {
            controller.pageController.animateToPage(value,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut);
            // controller.onItemTapped(value);
          },
        ),
      ),
    );
  }
}
