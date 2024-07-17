import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:try_fit/models/product_model.dart';

class ProductInputScreen extends StatefulWidget {
  const ProductInputScreen({super.key});

  @override
  _ProductInputScreenState createState() => _ProductInputScreenState();
}

class _ProductInputScreenState extends State<ProductInputScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  double price = 0.0;
  File? imageFile;
  File? tryOnImageFile;

  final picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        if (source == ImageSource.gallery) {
          imageFile = File(pickedFile.path);
        } else {
          tryOnImageFile = File(pickedFile.path);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              _saveProduct();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
              maxLines: 3,
            ),
            SizedBox(height: 16.0),
            TextFormField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Price'),
              onChanged: (value) {
                setState(() {
                  price = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Upload Image:'),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _pickImage(ImageSource.gallery);
                      },
                      child: Text('Select from Gallery'),
                    ),
                    SizedBox(width: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        _pickImage(ImageSource.camera);
                      },
                      child: Text('Take a Photo'),
                    ),
                  ],
                ),
                if (imageFile != null)
                  Image.file(imageFile!, height: 200),
              ],
            ),
            SizedBox(height: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Upload Try-On Image:'),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _pickImage(ImageSource.gallery);
                      },
                      child: Text('Select from Gallery'),
                    ),
                    SizedBox(width: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        _pickImage(ImageSource.camera);
                      },
                      child: Text('Take a Photo'),
                    ),
                  ],
                ),
                if (tryOnImageFile != null)
                  Image.file(tryOnImageFile!, height: 200),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _saveProduct() async {
    if (nameController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        price == 0.0 ||
        imageFile == null ||
        tryOnImageFile == null) {
      log('error');
      return;
    }

    // Upload images to Firebase Storage
    final imageUrl = await _uploadImage(imageFile!);
    final tryOnImageUrl = await _uploadImage(tryOnImageFile!);

    // Create ProductModel instance
    ProductModel product = ProductModel(
      name: nameController.text,
      image: imageUrl,
      description: descriptionController.text,
      tryOnImage: tryOnImageUrl,
      price: price,
    );

    // Upload product data to Firestore
    await FirebaseFirestore.instance.collection('products').add(
        product.toJson());

    // Optionally, navigate to another screen or show success message
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Product added successfully!'),
      duration: Duration(seconds: 2),
    ));
  }

  Future<String> _uploadImage(File imageFile) async {
    // Example function to upload image to Firebase Storage
    // Replace with your Firebase Storage upload logic
    // Make sure to include Firebase Storage dependency in pubspec.yaml
    // and configure Firebase Storage in your Firebase project

    // Example path: 'products/images/image1.jpg'
    String filePath = 'products/images/${DateTime
        .now()
        .millisecondsSinceEpoch}.jpg';
    log('Uploading.....');
    // Upload file to Firebase Storage
    final storageRef = FirebaseStorage.instance.ref().child(filePath);
    await storageRef.putFile(imageFile);

    // Get download URL
    String downloadURL = await storageRef.getDownloadURL();
    log('Uploaded');
    return downloadURL;
  }
}