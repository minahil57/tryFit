import 'package:try_fit/core/imports/external_imports.dart';
import 'package:try_fit/views/home/home_view_controller.dart';

import '../../../core/imports/core_imports.dart';

class TabBarHomeView extends GetView<HomeViewController> {
  const TabBarHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeViewController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            'For You',
            style: getBoldStyle(color: kcBlackColor, fontSize: 20.sp),
          ),
        ),
        Obx(
          () => SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(controller.tabs.length, (index) {
                return GestureDetector(
                  onTap: () {
                    controller.selectedIndex.value = index;
                  },
                  child: Row(
                    children: [
                      if (controller.selectedIndex.value == index)
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 500),
                          opacity: 1,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOutCubic,
                            width: 6.0.r,
                            height: 6.0.r,
                            decoration: const BoxDecoration(
                              color: kcPrimaryColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      horizontalSpaceSmall,
                      Text(
                        controller.tabs[index],
                        style: getRegularStyle(
                          color: kcBlackColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
