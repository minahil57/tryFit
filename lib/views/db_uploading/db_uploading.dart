// import 'dart:developer';
// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:try_fit/core/imports/external_imports.dart';
// import 'package:try_fit/models/product_model.dart';
// import 'package:try_fit/services/pic_upload.dart';
//
// class ProductInputScreen extends StatefulWidget {
//   const ProductInputScreen({super.key});
//
//   @override
//   _ProductInputScreenState createState() => _ProductInputScreenState();
// }
//
// class _ProductInputScreenState extends State<ProductInputScreen> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();
//   double price = 0.0;
//   File? imageFile;
//   File? tryOnImageFile;
//
//   final picker = ImagePicker();
//
//   Future<void> _pickImage(ImageSource source) async {
//     final pickedFile = await picker.pickImage(source: source);
//
//     setState(() {
//       if (pickedFile != null) {
//         if (source == ImageSource.gallery) {
//           imageFile = File(pickedFile.path);
//         } else {
//           imageFile = File(pickedFile.path);
//         }
//       }
//     });
//   }
//   Future<void> _pickTryOnImage(ImageSource source) async {
//     final pickedFile = await picker.pickImage(source: source);
//
//     setState(() {
//       if (pickedFile != null) {
//         if (source == ImageSource.gallery) {
//           tryOnImageFile = File(pickedFile.path);
//         } else {
//           tryOnImageFile = File(pickedFile.path);
//         }
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add Product'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.save),
//             onPressed: () {
//               _saveProduct();
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextFormField(
//               controller: nameController,
//               decoration: const InputDecoration(labelText: 'Name'),
//             ),
//             const SizedBox(height: 16.0),
//             TextFormField(
//               controller: descriptionController,
//               decoration: const InputDecoration(labelText: 'Description'),
//               maxLines: 3,
//             ),
//             const SizedBox(height: 16.0),
//             TextFormField(
//               keyboardType: const TextInputType.numberWithOptions(decimal: true),
//               decoration: const InputDecoration(labelText: 'Price'),
//               onChanged: (value) {
//                 setState(() {
//                   price = double.tryParse(value) ?? 0.0;
//                 });
//               },
//             ),
//             const SizedBox(height: 16.0),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text('Upload Image:'),
//                 const SizedBox(height: 8.0),
//                 Row(
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {
//                         _pickImage(ImageSource.gallery);
//                       },
//                       child: const Text('Select from Gallery'),
//                     ),
//                     const SizedBox(width: 16.0),
//                     ElevatedButton(
//                       onPressed: () {
//                         _pickImage(ImageSource.camera);
//                       },
//                       child: const Text('Take a Photo'),
//                     ),
//                   ],
//                 ),
//                 if (imageFile != null) Image.file(imageFile!, height: 200),
//               ],
//             ),
//             const SizedBox(height: 16.0),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text('Upload Try-On Image:'),
//                 const SizedBox(height: 8.0),
//                 Row(
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {
//                         _pickTryOnImage(ImageSource.gallery);
//                       },
//                       child: const Text('Select from Gallery'),
//                     ),
//                     const SizedBox(width: 16.0),
//                     ElevatedButton(
//                       onPressed: () {
//                         _pickTryOnImage(ImageSource.camera);
//                       },
//                       child: const Text('Take a Photo'),
//                     ),
//                   ],
//                 ),
//                 if (tryOnImageFile != null)
//                   Image.file(tryOnImageFile!, height: 200),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _saveProduct() async {
//     if (nameController.text.isEmpty ||
//         descriptionController.text.isEmpty ||
//         price == 0.0 ||
//         imageFile == null ||
//         tryOnImageFile == null) {
//       log('error');
//       return;
//     }
//
//     final PicUpload uploadImageOnDB = PicUpload();
//     final imageUrl = await uploadImageOnDB.uploadImage(imageFile!);
//     final tryOnImageUrl = await uploadImageOnDB.uploadImage(tryOnImageFile!);
//
//     // Create ProductModel instance
//     ProductModel product = ProductModel(
//       name: nameController.text,
//       image: imageUrl,
//       description: descriptionController.text,
//       tryOnImage: tryOnImageUrl,
//       price: price,
//     );
//
//     // Upload product data to Firestore
//     await FirebaseFirestore.instance
//         .collection('products')
//         .add(product.toJson());
//
//     // Optionally, navigate to another screen or show success message
//     Get.snackbar('test', 'product uploaded successfully');
//   }
//
//
// }
