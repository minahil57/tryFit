import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:try_fit/views/home/home_view_controller.dart';
import 'package:try_fit/views/home/widgets/brand_list.dart';
import 'package:try_fit/views/home/widgets/item_display_grid.dart';
import 'package:try_fit/views/home/widgets/tab_bar.dart';
import 'package:try_fit/views/home/widgets/top_container.dart';
import '../../core/imports/core_imports.dart';
import '../../widgets/grid_item.dart';

class HomeView extends GetView<HomeViewController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeViewController());
    return Scaffold(
        backgroundColor: kcBackgroundColor,
        body: const Column(
          children: [
            TopContainer(),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child:  Column(
                  children: [
                    BrandList(),
                    verticalSpaceMedium,
                    TabBarHomeView(),
                    verticalSpaceMedium,
                    // GridItem(),
                    ItemDisplayGrid(),
                  ],
                ),
              ),


          ],
        ));
  }
}
