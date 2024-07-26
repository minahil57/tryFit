import 'package:try_fit/core/imports/external_imports.dart';
import 'package:try_fit/models/product_model.dart';
import 'package:try_fit/views/item_detail/item_detail_controller.dart';
import 'package:try_fit/views/item_detail/widgets/product_description_container.dart';
import 'package:try_fit/views/item_detail/widgets/product_detail_container.dart';
import 'package:try_fit/widgets/primary_button.dart';

import '../../../core/imports/core_imports.dart';

class TopContainer extends GetView<ItemDetailController> {
  final ProductModel product;
  const TopContainer({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemDetailController());
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
          gradient: SweepGradient(
            center: Alignment.topLeft,
            colors: [
              kcBackgroundColor,
              kcLightGrey,
              kcMediumGrey,
            ],
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: Column(
          children: [
            verticalSpaceSmall, // small line indicating the scrollable content
            Container(
              width: 100,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpaceMedium,
                ProductDetailContainer(
                  product: product,
                ),
                verticalSpaceSmall,
                const ProductDescriptionContainer(),
                verticalSpaceSmall,
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      //controller.toImagePickerScreen(product);
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: 300,
                            width: Get.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: <Widget>[
                                verticalSpaceSmall,
                                Obx(() {
                                  if (controller.image.value == null) {
                                    return controller.isImageLoaded.value
                                        ? CircularProgressIndicator()
                                        : GestureDetector(
                                      onTap: controller.pickImage,
                                      child: Column(
                                        children: [
                                          Text(
                                            "Select Image",
                                            style: getRegularStyle(color: kcBlackColor),
                                          ),
                                          verticalSpaceSmall,
                                           Image.asset(
                                            'assets/images/select image.jpg',
                                            height: 80.h,
                                          ),
                                          verticalSpaceSmall,

                                        ],
                                      ),
                                    );
                                  } else {
                                    return Column(
                                      children: [
                                        Text('Tap on the image to reselect' ,style: getRegularStyle(), ),
                                        verticalSpaceTiny,
                                        GestureDetector(
                                          onTap: controller.pickImage,
                                          child: Container(
                                            width: 350,
                                            height: 170,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(20.r),
                                              ),
                                              image: DecorationImage(
                                                image: FileImage(controller.image.value!),
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ),
                                        ),

                                      ],
                                    );
                                  }
                                })
                                ,

                                verticalSpaceMedium,
                                CustomButton(
                                    width: 100.w,
                                    text: 'Submit',
                                    onPressed: () {
                                      controller
                                          .submitImage(product.tryOnImage);
                                    })
                              ],
                            ),
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: kcWhitecolor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 140, vertical: 15),
                    ),
                    child: const Text("Try On"),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
