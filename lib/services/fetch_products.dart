import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:try_fit/models/product_model.dart';

class Products {
  static Future<List<ProductModel>> getBookings() async {
    EasyLoading.show();
    final snapshot =
        await FirebaseFirestore.instance.collection("products").get();
    final userData =
        snapshot.docs.map((e) => ProductModel.fromsnapshot(e)).toList();
    print(userData);
    EasyLoading.dismiss();
    return userData;
  }
}
