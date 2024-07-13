import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:try_fit/views/home/home_view_controller.dart';
import '../../core/imports/core_imports.dart';

class HomeView extends GetView<HomeViewController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeViewController());
    return Scaffold(
        backgroundColor: kcBackgroundColor,
        body:  Padding(
          padding: EdgeInsets.only(top: 60.h, left: 20.w, right: 20.w),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 10.h, bottom: 10.h,left: 20.w),
                width: Get.width,
                decoration: BoxDecoration(
                  color: kcPrimaryColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Try Outfits!! \n virtually',
                        style: getBoldStyle(
                            color: kcWhitecolor, fontSize: 20.sp)),
                    verticalSpaceMedium,
                    Center(
                      child: Container(
                        alignment: Alignment.center,
                        height: 20.h,
                        width: Get.width * 0.25,
                        decoration: BoxDecoration(
                          color: kcWhitecolor,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Text(
                          'Try',
                          style: getRegularStyle(
                              color: kcBlackColor, fontSize: 15.sp),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              verticalSpaceLarge,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: controller.brands.map((brand) {
                  return Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 60.h,
                        width: 60.w,
                        decoration: const BoxDecoration(
                          color: kcWhitecolor,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          brand.image,
                          height: 40.h,
                          width: 40.w,
                        ),
                      ),
                      Text(brand.name),
                    ],
                  );
                }).toList(), // Convert the map to a list
              ),
              verticalSpaceLarge,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text('Products',
                          style: getBoldStyle(
                              color: kcBlackColor, fontSize: 20.sp))),
                  
                  Obx(
                    ()=>
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:
                            List.generate(controller.tabs.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              controller.selectedIndex.value = index;
                            },
                            child: Row(
                              children: [
                                if (controller.selectedIndex.value == index)
                                  Container(
                                    width: 6.0,
                                    height: 6.0,
                                    decoration: const BoxDecoration(
                                      color: kcPrimaryColor,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                horizontalSpaceSmall,
                                Text(
                                  controller.tabs[index],
                                  style: getRegularStyle(
                                    color: kcBlackColor,
                                    fontSize: 12.sp
                                  )
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            
            ],
          ),
        ));
  }
}
