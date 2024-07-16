import 'package:get/get.dart';
import 'package:try_fit/models/brand_model.dart';
import 'package:try_fit/models/product_model.dart';

class HomeViewController extends GetxController{

  RxInt selectedIndex = 0.obs;
  final RxList<String> tabs = ['Trending', 'New', 'Best'].obs;


  List<Brands> brands = [
    Brands(name: 'Adidas', image: 'assets/images/adidas.png'),
    Brands(name: 'Reebok', image: 'assets/images/rebook.png'),
    Brands(name: 'Puma', image: 'assets/images/puma.png'),
    Brands(name: 'Nike', image: 'assets/images/nike.png'),

  ];

  List<ProductModel> products = [
    ProductModel(name: 'Polo Shirt', image: 'assets/images/adidas.png', description: 'Adidas', price: 1000.0,tryOnImage: ''),
    ProductModel(name: 'Rounded Neck T-Shirt', image: 'assets/images/reebok.png', description: 'Reebok', price: 500.0,tryOnImage: ''),
    ProductModel(name: 'Pink Short Tank Top', image: 'assets/images/puma.png', description: 'Puma', price:1200.0,tryOnImage: ''),
    ProductModel(name: 'Black Long Coat', image: 'assets/images/vans.png', description: 'Vans', price: 1300.0,tryOnImage: ''),
    ProductModel(name: 'Formal Shirt', image: 'assets/images/puma.png', description: 'Puma', price: 1200.0,tryOnImage: ''),
    ProductModel(name: '', image: 'assets/images/vans.png', description: 'Vans', price: 1400.0,tryOnImage: ''),
  ];
}

