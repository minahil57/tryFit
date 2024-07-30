import 'package:get/get.dart';
import 'package:try_fit/core/constants/asset_manager.dart';
import 'package:try_fit/models/brand_model.dart';
import 'package:try_fit/models/product_model.dart';
import 'package:try_fit/services/fetch_products.dart';
import 'package:try_fit/views/db_uploading/db_uploading.dart';
import 'package:try_fit/views/item_detail/item_detail_view.dart';

class HomeViewController extends GetxController {
  RxInt selectedIndex = 0.obs;
  final RxList<String> tabs = ['Trending', 'New', 'Best'].obs;

  List<Brands> brands = [
    Brands(name: 'Adidas', image: 'assets/images/adidas.png'),
    Brands(name: 'Reebok', image: 'assets/images/rebook.png'),
    Brands(name: 'Puma', image: 'assets/images/puma.png'),
    Brands(name: 'Nike', image: 'assets/images/nike.png'),
  ];

  RxList<ProductModel> products = <ProductModel>[].obs;
  void onProductTap(ProductModel products) {
    Get.to(() => ItemDetailView(product: products));
  }



  @override
  void onInit() async {
    products.value = await Products.getBookings();
    super.onInit();
  }
}
