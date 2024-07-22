import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:try_fit/models/product_model.dart';
import 'package:try_fit/services/tryOn_services.dart';
import 'package:try_fit/views/tryOn_image_display/tryOn_image_display_view.dart';

import '../../core/imports/external_imports.dart';
import '../../services/pic_upload.dart';

class TryonView extends StatefulWidget {
   final ProductModel productModel;
   const TryonView({super.key,
     required this.productModel
});
  @override
  _TryonViewState createState() => _TryonViewState();
}

class _TryonViewState extends State<TryonView> {
  File? _image;
  final PicUpload upload =PicUpload();
  final ApiService apiService = ApiService();

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _submitImage() async{
    if (_image != null) {
      final imageLink = await upload.uploadImage(_image!);

        Get.to(ImageEditingScreen(upperBody: widget.productModel.tryOnImage,lowerBody: imageLink,));



    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No image to submit.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Try On View'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: _image == null
                  ? Text(
                'No image selected.',
                style: TextStyle(fontSize: 18),
              )
                  : Image.file(
                _image!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _submitImage,
              child: Text('Submit'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.image),
      ),
    );
  }
}
