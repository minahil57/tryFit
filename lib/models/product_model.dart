import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String name;
  final String image;
  final String description;
  final String tryOnImage;
  final double price;
  ProductModel({
    required this.name,
    required this.tryOnImage,
    required this.image,
    required this.description,
    required this.price,
  });

  factory ProductModel.fromsnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final json = snapshot.data()!;
    return ProductModel(
      tryOnImage: json['tryOn_image'],
      name: json['name'],
      image: json['image'],
      description: json['description'],
      price: json['price'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'tryOn_image': tryOnImage,
      'price': price,
    };
  }
}

//  factory ReservationsModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot){ 
//     final data = snapshot.data();
//     return ReservationsModel(
//       id: data?['id'],
//       phone: data?['phone'],
//       name: data?['name'],
//       date: data?['date'],
//       type: data?['bookingType'],
//       submittedDate: data?['submittedDate'],
//       submittedTime: data?['submittedTime'],
//       //testDate: data?['testDate']
//     );
//    }
