import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:try_fit/core/imports/external_imports.dart';
import 'package:try_fit/views/db_uploading/db_uploading.dart';
import 'package:try_fit/views/home/home_view_controller.dart';
import 'package:try_fit/views/item_detail/item_detail_view.dart';
import 'package:try_fit/widgets/grid_item.dart';
import '../../../core/imports/core_imports.dart';

class ItemDisplayGrid extends GetView<HomeViewController> {
  const ItemDisplayGrid({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeViewController());
    return StaggeredGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: 0.5,
      crossAxisSpacing: 10,
      children: [


        GestureDetector(
          onTap: controller.onFilterTap,
          child: Container(
            alignment: Alignment.center,
            height: 40.h,
            width: Get.width * 0.4,
            decoration: BoxDecoration(
              color: kcPrimaryColor,
              borderRadius: BorderRadius.circular(50.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Filters',
                  style: getMediumStyle(
                      fontWeight: FontWeight.w400, color: kcWhitecolor),
                ),
                Container(
                  height: 40.h,
                  decoration: const BoxDecoration(
                    color: kcWhitecolor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.filter_alt_outlined,
                    color: kcPrimaryColor,
                    size: 18.dg,
                  ),

                ),
              ],
            ),
          ),
        ),
        ...controller.products.map((products) => StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 2,

              child: GestureDetector(
                  onTap: () => controller.onProductTap(products),
                  child: GridItem(products: products)),
            ),),
      ],
    );
  }
}
