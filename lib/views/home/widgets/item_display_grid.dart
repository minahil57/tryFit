import 'package:try_fit/core/imports/external_imports.dart';
import 'package:try_fit/widgets/grid_item.dart';

import '../../../core/imports/core_imports.dart';

class ItemDisplayGrid extends StatelessWidget {
  const ItemDisplayGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            SizedBox(
              width: Get.width * 0.4,
              child: Column(
                children: [
                  Container(
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
                  verticalSpaceMedium,

                  GridItem(),
                  // Expanded(
                  //   child: ListView.builder(
                  //     shrinkWrap: true,
                  //     itemCount: 10,
                  //     itemBuilder: (context, index) {
                  //       return GridItem();
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
        horizontalSpaceMedium,
        Column(
          children: [
            Container(
              width: Get.width * 0.4,
              child: Column(
                children: [
                  GridItem(),
                  // Expanded(
                  //   child: ListView.builder(
                  //     shrinkWrap: true,
                  //     itemCount: 10,
                  //     itemBuilder: (context, index) {
                  //       return GridItem();
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
