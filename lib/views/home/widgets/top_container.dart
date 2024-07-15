import 'package:try_fit/core/imports/core_imports.dart';

import '../../../core/imports/external_imports.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      width: Get.width,
      height: Get.height * 0.3,
      decoration: BoxDecoration(
        color: kcPrimaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40.r),
          bottomRight: Radius.circular(40.r),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Morning!!',
              style: getBoldStyle(color: kcWhitecolor, fontSize: 30),
            ),
            Text(
              'Minahil Akhtar',
              style: getRegularStyle(
                  color: kcWhitecolor.withOpacity(0.8),
                  fontSize: 24,
                  fontWeight: FontWeight.w200),
            ),
            verticalSpaceMedium,
            Center(
              child: Container(
                alignment: Alignment.center,
                height: 60.h,
                padding: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                width: Get.width * 0.82,
                decoration: BoxDecoration(
                  color: kcWhitecolor,
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Row(

                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: kcPrimaryColor,
                          width: 4,
                        ),
                        shape: BoxShape.circle,

                      ),
                      child: CircleAvatar(
                        maxRadius: 29,
                        foregroundImage: AssetImage(AssetManager.dpImage),
                      ),
                    ),
                    horizontalSpace(35),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Follow',
                              style: getMediumStyle(
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              '200K',
                              style: getRegularStyle(
                                  ),
                            ),
                          ],
                        ),
                        horizontalSpace(35),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Likes',
                              style: getMediumStyle(
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              '1.9M',
                              style: getRegularStyle(
                              ),
                            ),
                          ],
                        ),
                        horizontalSpace(35),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Buy',
                              style: getMediumStyle(
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              '129',
                              style: getRegularStyle(
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),


                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
