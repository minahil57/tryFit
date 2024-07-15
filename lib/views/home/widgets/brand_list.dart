import 'package:try_fit/core/imports/core_imports.dart';
import 'package:try_fit/core/imports/external_imports.dart';
import 'package:try_fit/views/home/home_view_controller.dart';

class BrandList extends GetView<HomeViewController> {
  const BrandList({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeViewController());
    return  Row(
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
    );
  }
}
