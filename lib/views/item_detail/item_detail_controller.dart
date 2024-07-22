import 'package:get/get.dart';
import 'package:try_fit/models/product_model.dart';
import 'package:try_fit/views/tryOn_imagePicker/tryOn_view.dart';

class ItemDetailController extends GetxController{
  void toImagePickerScreen(ProductModel product){
    Get.to(TryonView(productModel: product,));
  }
}