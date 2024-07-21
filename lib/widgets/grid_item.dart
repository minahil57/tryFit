import 'package:try_fit/core/imports/core_imports.dart';
import 'package:try_fit/core/imports/external_imports.dart';
import 'package:try_fit/models/product_model.dart';

class GridItem extends StatelessWidget {
  final ProductModel products;
  const GridItem({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image
        Container(
          width: Get.width * 0.38,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.r)),
            image: DecorationImage(
              image:
                  NetworkImage(products.image), // Replace with your image URL
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Heart shape container
        Positioned(
          right: 20,
          top: 10,
          child: Container(
            width: 24,
            height: 24,
            decoration: const BoxDecoration(
              color: kcWhitecolor,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.favorite_border,
              color: kcPrimaryColor,
              size: 16,
            ),
          ),
        ),
      ],
    );
  }
}
