import 'package:get/get.dart';
import 'package:try_fit/core/constants/asset_manager.dart';
import 'package:try_fit/models/brand_model.dart';
import 'package:try_fit/models/product_model.dart';
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

  List<ProductModel> products = [




    ProductModel(
        name: 'Polo Shirt',
        image: AssetManager.dpImage,
        description: 'Adidas',
        price: 1000.0,
      tryOnImage: '',
    ),
    ProductModel(
        name: 'Polo Shirt',
        image: AssetManager.product,
        description: 'Adidas',
        price: 1000.0,
      tryOnImage: '',
    ),
    ProductModel(
        name: 'Polo Shirt',
        image: 'assets/images/product2.jpg',
        description: 'Adidas',
        price: 1000.0,
      tryOnImage: '',
    ),
    ProductModel(
        name: 'Polo Shirt',
        image: 'assets/images/product3.jpg',
        description: 'Adidas',
        price: 1000.0,
      tryOnImage: '',
    ),
  ];
  void onProductTap(ProductModel products){
    Get.to(() => ItemDetailView(product: products));
  }

  void onFilterTap(){
    Get.to(() => ProductInputScreen());
  }

}

