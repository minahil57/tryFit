import 'package:try_fit/core/imports/core_imports.dart';
import 'package:try_fit/models/product_model.dart';
import 'package:try_fit/views/item_detail/widgets/background_image.dart';
import 'package:try_fit/views/item_detail/widgets/top_container.dart';


class ItemDetailView extends StatelessWidget {
  final ProductModel product;
  const ItemDetailView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomScrollView(
        slivers: [
          BackgroundImage(product: product,),
          TopContainer(product: product,),
        ],
      ),
    );
  }
}
