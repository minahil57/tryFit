import 'package:try_fit/models/product_model.dart';

import '../../../core/imports/core_imports.dart';
import '../../../core/imports/external_imports.dart';

class BackgroundImage extends StatelessWidget {
  final ProductModel product;
  const BackgroundImage({super.key,required this .product});

  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
      expandedHeight: Get.height * 0.7,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              product.image, // replace with your image asset
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
